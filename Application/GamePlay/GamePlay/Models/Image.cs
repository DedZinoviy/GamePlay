using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace GamePlay.Models
{
    [Table("images")]
    public class Image
    {
        [Key]
        public int Idimg { get; set; }

        [Column("url")]
        public string? Source { get; set; }

        [ForeignKey("idgame")]
        public int Idgame { get; set; }

        public Game? Game { get; set; }
    }
}
