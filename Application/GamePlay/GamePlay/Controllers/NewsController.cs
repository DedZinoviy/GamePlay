using GamePlay.Data;
using GamePlay.Models;
using GamePlay.Models.BbModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;

namespace GamePlay.Controllers
{
    public class NewsController : Controller
    {
        private readonly ApplicationDbContext _context;

        public NewsController(ApplicationDbContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            List<News> news = _context.news.Include(n => n.User).ToList();
            NewsViewModel newsView = new NewsViewModel() { News = news };

            string[] source = news[0].Url.Split("/");

            return View(newsView);
        }
    }
}
