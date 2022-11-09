using GamePlay.Data;
using GamePlay.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using System.Linq;
using HtmlAgilityPack;
using System.Net;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.Html;
using Microsoft.DotNet.Scaffolding.Shared.Project;
using System.Linq.Expressions;
using GamePlay.Models.BbModels;

namespace GamePlay.Controllers
{
    public class HomeController : Controller
    {
        ApplicationDbContext _context;

        public HomeController(ApplicationDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public IActionResult Index(IndexViewModel model)
        {
            if (model.Genres.Count == 0)
                model.Set(_context.genres.ToList());

            if (model.Platforms.Count == 0)
                model.Set(_context.platforms.ToList());

            if (model.Studios.Count == 0)
                model.Set(_context.studios.ToList());

            List<Genre> genres = model.GetSelectedGenres().FindAll(g => g != null);
            List<Platform> platforms = model.GetSelectedPlatforms().FindAll(p => p != null);
            List<Studio> studios = model.GetSelectedStudios().FindAll(s => s != null);

            IQueryable<Game> games = _context.games
                .Include(g => g.Genres)
                .Include(g => g.Platforms)
                .Include(g => g.Studio)
                .Include(g => g.Publisher)
                .Include(g => g.Ratings)
                .Select(g => new Game()
                {
                    Idgame = g.Idgame,
                    Title = g.Title,
                    Release_date = g.Release_date,
                    Main_Image = g.Main_Image,
                    Genres = g.Genres,
                    Platforms = g.Platforms,
                    Studio = g.Studio,
                    Publisher = g.Publisher,
                    Ratings = g.Ratings

                })
                .Where(g => g.Release_date.Year >= model.MinimumYear && g.Release_date.Year <= model.MaximumYear);

            if (genres.Count != 0)
                games = games.Where(g => g.Genres.Any(g => genres.Contains(g)));
            
            if (platforms.Count != 0)
                games = games.Where(g => g.Platforms.Any(p => platforms.Contains(p)));
            
            if (studios.Count != 0)
                games = games.Where(g => studios.Contains(g.Studio) || studios.Contains(g.Publisher));

            model.Games = games.ToList().FindAll(g => g.MiddleRate >= model.MinimumRate && g.MiddleRate <= model.MaximumRate);

            return View(model);
        }

        public IActionResult Privacy()
        {
            return View();
        }
        
        public async Task<IActionResult> News()
        {
            News news = new News();
            news.Source = @"https://www.igromania.ru/news/120203/V_set_utyok_spoylernyy_geympleynyy_fragment_God_of_War_Ragnarok.html?from=mpp";
            
            HtmlDocument source = new HtmlDocument();
            source.LoadHtml(await new HttpClient().GetStringAsync(news.Source));

            var Node = source.DocumentNode.SelectSingleNode("//head");

            news.Title = source.DocumentNode.SelectSingleNode("//h1").InnerHtml;
            news.Img = source.DocumentNode.SelectSingleNode("//img").Attributes["src"].Value;

            return View(news);
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        public IActionResult Login()
        {
            return View();
        }
    }
}