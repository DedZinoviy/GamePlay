using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace GamePlay.Models.BbModels
{
    public class News
    {
        [Key]
        public int Id { get; set; }

        [ForeignKey("iduser")]
        public int Iduser { get; set; }

        public User? User { get; set; }

        public string Url { get; set; }

        [Column("photo")]
        public string? Img { get; set; }

        public string Title { get; set; }

        public DateTime Date { get; set; }

        [NotMapped]
        public string Source { get { return Url.Split("/")[2]; } }
    }
}
