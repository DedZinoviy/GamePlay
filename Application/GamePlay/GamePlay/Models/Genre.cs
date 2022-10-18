﻿using System.ComponentModel.DataAnnotations;

namespace GamePlay.Models
{
    /// <summary>
    /// Класс, описывающий модель жанра в БД.
    /// </summary>
    public class Genre
    {
        /// <summary>
        /// Идентификатор (первичный ключ) жанра в БД.
        /// </summary>
        [Key]
        public int Idgenre { get; set; }

        /// <summary>
        /// Название жанра.
        /// </summary>
        public string Name { get; set; }
    }
}
