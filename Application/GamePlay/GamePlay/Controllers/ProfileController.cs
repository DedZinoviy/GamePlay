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
    public class ProfileController : Controller
    {
        private readonly ApplicationDbContext _context;

        public ProfileController(ApplicationDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public IActionResult Login()
        {
            return View(new UserViewModel());
        }

        [HttpPost]
        public IActionResult Login(UserViewModel userView)
        {
            if (userView.User != null && _context.users.Any(u => userView.User.Login == u.Login && userView.User.Password == u.Password))
            {
                User user = _context.users.First(u => userView.User.Login == u.Login && userView.User.Password == u.Password);
                Response.Cookies.Append("iduser", user.Iduser.ToString());
                return RedirectToAction(actionName: "Index", controllerName: "Profile");
            }
            userView.ErrorMessage = "Неверно указаны логин или пароль";
            return View(userView);
        }

        [HttpGet]
        public IActionResult Register()
        {
            return View(new UserViewModel());
        }

        [HttpPost]
        public IActionResult Register(UserViewModel userView)
        {
            if (userView.User != null && !_context.users.Any(u => userView.User.Login == u.Login))
            {
                User newUser = userView.User;
                _context.users.Add(newUser);
                _context.SaveChanges();
                return RedirectToAction(actionName: "Login", controllerName: "Profile");
            }
            userView.ErrorMessage = "Данный пользователь уже существует";
            return View(userView);
        }

        [HttpGet]
        public IActionResult Index()
        {
            if (Request.Cookies.TryGetValue("iduser", out string? iduser))
            {
                int id = int.Parse(iduser);
                
                User user = _context.users
                    .Include(u => u.Ratings)
                        .ThenInclude(r => r.Game)
                    .First(u => u.Iduser == id);
                
                UserViewModel userView = new UserViewModel();
                userView.User = user;
                return View(userView);
            }
            return RedirectToAction(actionName: "Login", controllerName: "Profile");
        }
    }
}
