using System.ComponentModel.DataAnnotations.Schema;

namespace GamePlay.Models
{
    public class News
    {
        [NotMapped]
        public string Source { get; set; }

        public string Img { get; set; }

        public string Title { get; set; }
    }
}
