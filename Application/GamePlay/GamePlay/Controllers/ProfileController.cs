using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using GamePlay.Data;
using GamePlay.Models;
using GamePlay.Models.BbModels;

namespace GamePlay.Controllers
{
    public class ProfileController : BaseController
    {
        private readonly IWebHostEnvironment _appEnvironment;

        public ProfileController(ApplicationDbContext context, IWebHostEnvironment appEnvironment) : base(context)
        {
            _appEnvironment = appEnvironment;
        }

        [HttpGet]
        public IActionResult Login()
        {
            LoadGamesForSearch();
            return View(new UserViewModel());
        }

        [HttpPost]
        public IActionResult Login(UserViewModel userView)
        {
            LoadGamesForSearch();
            if (userView.User != null && Context.users.Any(u => userView.User.Login == u.Login && userView.User.Password == u.Password))
            {
                User user = Context.users.First(u => userView.User.Login == u.Login && userView.User.Password == u.Password);
                Response.Cookies.Append("iduser", user.Iduser.ToString());
                return RedirectToAction(actionName: "Index", controllerName: "Profile");
            }
            userView.ErrorMessage = "Неверно указаны логин или пароль";
            return View(userView);
        }

        [HttpGet]
        public IActionResult Register()
        {
            LoadGamesForSearch();
            return View(new UserViewModel());
        }

        [HttpPost]
        public IActionResult Register(UserViewModel userView)
        {
            LoadGamesForSearch();
            if (userView.User != null && !Context.users.Any(u => userView.User.Login == u.Login))
            {
                User newUser = userView.User;
                Context.users.Add(newUser);
                Context.SaveChanges();
                return RedirectToAction(actionName: "Login", controllerName: "Profile");
            }
            userView.ErrorMessage = "Данный пользователь уже существует";
            return View(userView);
        }

        [HttpGet]
        public IActionResult Index()
        {
            LoadGamesForSearch();
            if (Request.Cookies.TryGetValue("iduser", out string? iduser))
            {
                int id = int.Parse(iduser);
                
                User user = Context.users
                    .Include(u => u.Ratings)
                        .ThenInclude(r => r.Game)
                    .Include(u => u.News)
                    .First(u => u.Iduser == id);
                
                UserViewModel userView = new UserViewModel();
                userView.User = user;
                return View(userView);
            }
            return RedirectToAction(actionName: "Login", controllerName: "Profile");
        }

        [HttpPost]
        public IActionResult Update(UserViewModel userView)
        {
            if (userView.User != null)
            {
                Context.users.Update(userView.User);
                try
                {
                    Context.SaveChanges();
                }
                catch
                {
                    userView.ErrorMessage = "Данный пользователь уже существует";
                    return View("Index", userView);
                }
            }
            
            return RedirectToAction(actionName: "Index", controllerName: "Profile");
        }

        [HttpPost]
        public async Task<IActionResult> AddPhoto(IFormFile uploadedFile)
        {
            if (!Request.Cookies.TryGetValue("iduser", out string? iduser)) 
                return RedirectToAction(actionName: "Index", controllerName: "Home");

            int id = int.Parse(iduser);

            User user = Context.users.First(u => u.Iduser == id);

            if (uploadedFile != null)
            {
                List<string> validFileTypes = new List<string>(){ ".jpeg", ".jpg", ".png" };
                string fileExtention = Path.GetExtension(uploadedFile.FileName);
                if (!validFileTypes.Any(t => t == fileExtention)) { return RedirectToAction("Index"); }

                string path = "/Avatars/" + user.Login + fileExtention;
                using (var fileStream = new FileStream(_appEnvironment.WebRootPath + path, FileMode.Create))
                {
                    await uploadedFile.CopyToAsync(fileStream);
                }
                user.Avatar = path;
                Context.users.Update(user);
                Context.SaveChanges();
            }

            return RedirectToAction("Index");
        }

        [HttpPost]
        public async Task<IActionResult> AddNews(UserViewModel userView, IFormFile uploadedFile)
        {
            if (!Request.Cookies.TryGetValue("iduser", out string? iduser))
                return RedirectToAction(actionName: "Index", controllerName: "Home");

            int id = int.Parse(iduser);

            User user = Context.users.First(u => u.Iduser == id);

            if (uploadedFile != null)
            {
                List<string> validFileTypes = new List<string>() { ".jpeg", ".jpg", ".png" };
                string fileExtention = Path.GetExtension(uploadedFile.FileName);
                if (!validFileTypes.Any(t => t == fileExtention)) { return RedirectToAction("Index"); }

                string path = "/News/" + uploadedFile.FileName;
                using (var fileStream = new FileStream(_appEnvironment.WebRootPath + path, FileMode.Create))
                {
                    await uploadedFile.CopyToAsync(fileStream);
                }
                userView.NewNews.Img = path;
                userView.NewNews.Iduser = id;
                Context.news.Add(userView.NewNews);
                Context.SaveChanges();
            }

            return RedirectToAction("Index");
        }


        [HttpGet]
        public IActionResult Logout()
        {
            if (Request.Cookies.ContainsKey("iduser"))
            {
                Response.Cookies.Delete("iduser");
            }
            return RedirectToAction(actionName: "Index", controllerName: "Home");
        }
    }
}
