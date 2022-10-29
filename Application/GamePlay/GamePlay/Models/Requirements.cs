using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace GamePlay.Models
{
    public class Requirements
    {
        [Key]
        public int Idrequirement { get; set; }

        public string? OS { get; set; }

        public string? Processor { get; set; }

        public string? Memory { get; set; }

        public string? Graphics_Card { get; set; }

        public string? HDD_Space { get; set; }
    }
}
