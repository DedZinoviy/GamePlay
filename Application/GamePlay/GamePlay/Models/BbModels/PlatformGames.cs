using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace GamePlay.Models.BbModels
{
    [Table("platform_to_game")]
    public class PlatformGames
    {
        [Key, Column(Order = 0)]
        public int Idplatform { get; set; }

        [Key, Column(Order = 1)]
        public int Idgame { get; set; }
    }
}
