using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace GamePlay.Models.BbModels
{
    /// <summary>
    /// Класс, опиывающий модель записи об игре.
    /// </summary>
    public class Game
    {
        /// <summary>
        /// Идентификатор (первичный ключ) игры в БД.
        /// </summary>
        [Key]
        public int Idgame { get; set; }

        /// <summary>
        /// Название игры.
        /// </summary>
        public string? Title { get; set; }

        /// <summary>
        /// Аннотация (описание) к игре.
        /// </summary>
        public string? Annotation { get; set; }

        /// <summary>
        /// Дата выпуска (релиза) игры.
        /// </summary>
        public DateTime Release_date { get; set; }

        public List<Image> Images { get; set; } = new List<Image>();

        public List<Genre> Genres { get; set; } = new List<Genre>();

        public List<Platform> Platforms { get; set; } = new List<Platform>();

        public List<Rating> Ratings { get; set; } = new List<Rating>();

        [ForeignKey("idminimum")]
        public Requirements? Minimum { get; set; }

        [ForeignKey("idrecommended")]
        public Requirements? Recomended { get; set; }

        [ForeignKey("idimg")]
        public Image? Main_Image { get; set; }

        [ForeignKey("idstudio")]
        public Studio? Studio { get; set; }

        [ForeignKey("idpublisher")]
        public Studio? Publisher { get; set; }

        [NotMapped]
        public bool HasSystemRequirments 
        {
            get { return Minimum != null; }
        }

        [NotMapped]
        public double MiddleRate
        {
            get
            {
                double rate = 0;
                if (Ratings.Count != 0)
                    rate = Ratings.Sum(r => r.Middle) / Ratings.Count;
                rate = Math.Round(rate, 1);
                return rate;
            }
        }
    }
}
