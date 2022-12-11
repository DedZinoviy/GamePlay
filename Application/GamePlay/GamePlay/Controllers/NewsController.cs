using GamePlay.Data;
using GamePlay.Models;
using GamePlay.Models.BbModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;

namespace GamePlay.Controllers
{
    public class NewsController : BaseController
    {
        public NewsController(ApplicationDbContext context) : base(context) { }

        public IActionResult Index()
        {
            LoadGamesForSearch();

            List<News> news = Context.news.Include(n => n.User).ToList();
            NewsViewModel newsView = new NewsViewModel() { News = news };

            string[] source = news[0].Url.Split("/");

            return View(newsView);
        }
    }
}
