using GamePlay.Data;
using GamePlay.Models;
using GamePlay.Models.BbModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace GamePlay.Controllers
{
    public class TopicsController : BaseController
    {
        public TopicsController(ApplicationDbContext context) : base(context) { }

        public IActionResult Index()
        {
            LoadGamesForSearch();
            List<Topic> topics = Context.topics.ToList();
            TopicsViewModel topicsView = new TopicsViewModel() { Topics = topics };
            return View(topicsView);
        }

        public IActionResult Topic(int id)
        {
            LoadGamesForSearch();
            Topic topic = Context.topics
                                  .Include(t => t.Games).ThenInclude(g => g.Main_Image)
                                  .Include(t => t.Games).ThenInclude(g => g.Ratings)
                                  .First(t => t.Idtopic == id);
            return View(topic);
        }
    }
}
