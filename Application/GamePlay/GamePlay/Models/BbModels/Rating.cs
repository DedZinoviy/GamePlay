using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace GamePlay.Models.BbModels
{
    public class Rating
    {
        [Key, Column(Order = 0)]
        public int Iduser { get; set; }

        public User? User { get; set; }

        [Key, Column(Order = 1)]
        public int Idgame { get; set; }

        public Game? Game { get; set; }

        public int Plot { get; set; } = 5;

        public int Gameplay { get; set; } = 5;

        public int Graphics { get; set; } = 5;

        public int Emotions { get; set; } = 5;

        public string? Comment { get; set; }

        [NotMapped]
        public float Middle 
        {
            get { return (Plot + Gameplay + Graphics + Emotions) / 4f; }
        }
    }
}
