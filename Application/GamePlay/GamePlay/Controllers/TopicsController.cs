using GamePlay.Data;
using GamePlay.Models;
using GamePlay.Models.BbModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace GamePlay.Controllers
{
    public class TopicsController : Controller
    {
        ApplicationDbContext _context;

        public TopicsController(ApplicationDbContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            List<Topic> topics = _context.topics.ToList();
            TopicsViewModel topicsView = new TopicsViewModel() { Topics = topics };
            return View(topicsView);
        }

        public IActionResult Topic(int idtopic)
        {
            Topic topic = _context.topics
                                  .Include(t => t.Games)
                                  .First(t => t.Idtopic == idtopic);
            return View(topic);
        }
    }
}
