using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using GamePlay.Data;
using GamePlay.Models.BbModels;
using GamePlay.Models;

namespace GamePlay.Controllers
{
    public class GamesController : Controller
    {
        private readonly ApplicationDbContext _context;

        public GamesController(ApplicationDbContext context)
        {
            _context = context;
        }

        public IActionResult Page(int id)
        {
            Game game = _context.games
                        .Include(g => g.Images)
                        .Include(g => g.Genres)
                        .Include(g => g.Platforms)
                        .Include(g => g.Minimum)
                        .Include(g => g.Recomended)
                        .Include(g => g.Studio)
                        .Include(g => g.Publisher)
                        .Include(g => g.Ratings)
                            .ThenInclude(r => r.User)
                        .First(x => x.Idgame == id);

            GameViewModel gameView = new GameViewModel();
            gameView.Game = game;

            return View(gameView);
        }

        [HttpPost]
        public IActionResult AddRating(GameViewModel gameView)
        {
            if (Request.Cookies.TryGetValue("iduser", out string? strUser))
            {
                int iduser = int.Parse(strUser);
                Rating rating = gameView.Rating;
                rating.Iduser = iduser;
                
                _context.games.First(g => g.Idgame == gameView.Game.Idgame).Ratings.Add(rating);
                _context.SaveChanges();
                
                return Redirect($"./Page?id={gameView.Game.Idgame}");
            }
            return RedirectToAction(actionName: "Login", controllerName: "Profile");
            
        }
    }
}
