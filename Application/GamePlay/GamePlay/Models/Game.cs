using System.ComponentModel.DataAnnotations;
namespace GamePlay.Models
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
        public string Title { get; set; }

        /// <summary>
        /// Аннотация (описание) к игре.
        /// </summary>
        public string Annotation { get; set; }

        /// <summary>
        /// Дата выпуска (релиза) игры.
        /// </summary>
        public DateTime Release_date    { get; set; }

        /// <summary>
        /// Возрасное ограничение (внешний ключ к таблице с ограничениями).
        /// </summary>
        public int Idage_restriction    { get; set; }
    }
}
