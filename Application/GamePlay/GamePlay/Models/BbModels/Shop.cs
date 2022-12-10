using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace GamePlay.Models.BbModels
{
    public class Shop
    {
        [Key]
        public int Idshop { get; set; }

        public string? Name { get; set; }

        public float Price { get; set; }

        public string? Source { get; set; }

        [ForeignKey("idgame")]
        public int Idgame { get; set; }

        public Game? Game { get; set; }
    }
}
