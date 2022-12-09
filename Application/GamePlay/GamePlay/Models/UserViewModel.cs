using GamePlay.Models.BbModels;

namespace GamePlay.Models
{
    public class UserViewModel
    {
        public User? User { get; set; }

        public News? NewNews { get; set; }

        public string? ErrorMessage { get; set; }
    }
}
