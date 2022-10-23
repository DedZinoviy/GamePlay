using GamePlay.Data;
using GamePlay.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;

namespace GamePlay.Controllers
{
    public class HomeController : Controller
    {
        ApplicationDbContext _context;

        public HomeController(ApplicationDbContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            return View(_context.users.ToList());
        }

        public IActionResult Privacy()
        {
            return View();
        }
        public IActionResult Game()
        {
            return View();
        }

        public IActionResult News()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}