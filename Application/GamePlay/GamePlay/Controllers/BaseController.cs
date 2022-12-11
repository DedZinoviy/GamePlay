using GamePlay.Data;
using GamePlay.Models;
using GamePlay.Models.BbModels;
using Microsoft.AspNetCore.Mvc;

namespace GamePlay.Controllers
{
    public abstract class BaseController : Controller
    {
        private readonly ApplicationDbContext _cotext;

        protected ApplicationDbContext Context { get { return _cotext; } }

        public BaseController(ApplicationDbContext context)
        {
            _cotext = context;
        }

        protected void LoadGamesForSearch()
        {
            List<Game> games = Context.games.Select(g => new Game()
            {
                Idgame = g.Idgame,
                Title = g.Title
            })
            .ToList();

            IndexViewModel indexView = new IndexViewModel() { Games = games };

            ViewData["Games"] = indexView;
        }
    }
}
