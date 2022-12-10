using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace GamePlay.Models.BbModels
{
    [Table("topics_to_games")]
    public class TopicsToGames
    {
        [Key, Column(Order = 0)]
        public int IdTopic { get; set; }

        [Key, Column(Order = 1)]
        public int IdGame { get; set; }
    }
}
