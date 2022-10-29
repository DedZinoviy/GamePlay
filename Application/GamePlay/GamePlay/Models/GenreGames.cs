using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace GamePlay.Models
{
    [Table("genres_to_games")]
    public class GenreGames
    {
        [Key, Column(Order = 0)]
        public int IdGenre { get; set; }

        [Key, Column(Order = 1)]
        public int IdGame { get; set; }
    }
}
