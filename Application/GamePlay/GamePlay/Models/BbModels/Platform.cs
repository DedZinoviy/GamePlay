using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace GamePlay.Models.BbModels
{
    public class Platform
    {
        [Key]
        public int Idplatform { get; set; }

        public string? Name { get; set; }

        public List<Game> Games { get; set; } = new List<Game>();
    }
}
