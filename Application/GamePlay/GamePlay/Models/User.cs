using System.ComponentModel.DataAnnotations;

namespace GamePlay.Models
{
    public class User
    {
        [Key]
        public int Iduser { get; set; }
        public string Login { get; set; }
        public string Password { get; set; }
        
        public string Email { get; set; }
        public DateTime Birth_Date { get; set; }

        public int isVerificied { get; set; }

    }
}
