using GamePlay.Data;
using GamePlay.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using System.Linq;
using HtmlAgilityPack;
using System.Net;
using Microsoft.EntityFrameworkCore;

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
            List<Game> games = _context.games
                .Select(g => new Game() {

                    Idgame = g.Idgame, 
                    Title = g.Title,
                    Release_date = g.Release_date,
                    Main_Image = g.Main_Image
                })
                .Take(20).ToList();

            return View(games);
        }

        public IActionResult Privacy()
        {
            return View();
        }
        public IActionResult Game(int id)
        {
            Game game = _context.games
                        .Include(g => g.Images)
                        .Include(g => g.Genres)
                        .Include(g => g.Platforms)
                        .Include(g => g.Minimum)
                        .Include(g => g.Recomended)
                        .Include(g => g.Studio)
                        .Include(g => g.Publisher)
                        .First(x => x.Idgame == id);

            return View(game);
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
    }
}