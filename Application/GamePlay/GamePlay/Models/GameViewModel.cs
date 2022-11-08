using GamePlay.Models.BbModels;

namespace GamePlay.Models
{
    public class GameViewModel
    {
        public Game? Game { get; set; }

        public Rating Rating { get; set; } = new Rating();
    }
}
