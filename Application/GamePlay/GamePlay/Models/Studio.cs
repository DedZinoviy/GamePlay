using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace GamePlay.Models
{
    public class Studio
    {
        [Key]
        public int Idstudio { get; set; }

        public string? Name { get; set; }

        public string? Information { get; set; }
    }
}
