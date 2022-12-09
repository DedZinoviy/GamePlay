using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace GamePlay.Models.BbModels
{
    /// <summary>
    /// Класс, описывающий модель пользователя приложения.
    /// </summary>
    public class User
    {
        /// <summary>
        /// Идентификатор (первичный ключ) пользователя в БД.
        /// </summary>
        [Key]
        public int Iduser { get; set; }

        /// <summary>
        /// Логин пользователя для входа в систему.
        /// </summary>
        public string Login { get; set; }

        /// <summary>
        /// Пароль пользователя для входа в систему.
        /// </summary>
        public string Password { get; set; }

        /// <summary>
        /// Электронная почта пользователя прилошения.
        /// </summary>
        public string Email { get; set; }

        /// <summary>
        /// Дата рождения пользователя приложения.
        /// </summary>
        public DateTime Birth_Date { get; set; }

        /// <summary>
        /// Флаг, обозначающий верифицированных пользователей.
        /// </summary>
        public int isVerificied { get; set; }

        public string? Avatar { get; set; }

        public List<Rating> Ratings { get; set; } = new List<Rating>();

        public List<News> News { get; set; } = new List<News>();

    }
}
