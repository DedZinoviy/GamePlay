using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace GamePlay.Models.BbModels
{
    public class Topic
    {
        [Key]
        public int Idtopic { get; set; }

        public string? Name { get; set; }

        public string? Img { get; set; }

        public List<Game> Games { get; set; } = new List<Game>();
    }
}
