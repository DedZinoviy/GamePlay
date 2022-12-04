using Xunit;
using GamePlay.Controllers;
using GamePlay.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Mvc;
using GamePlay.Models;
using GamePlay.Models.BbModels;

namespace Tests
{
    public class GameControllerTest
    {
        private DbContextOptions<ApplicationDbContext> dbContext = new DbContextOptions<ApplicationDbContext>();

        [Fact]
        public void Test_GameController_Page_Title()
        {
            using (var context = new ApplicationDbContext(dbContext))
            {
                // Arrange
                var controller = new GamesController(context);
                int gameID = 1;
                string expTitle = "The Witcher 3: Wild Hunt";

                // Act
                var result = controller.Page(gameID);

                // Assert
                var viewResult = Assert.IsType<ViewResult>(result);
                var model = Assert.IsType<GameViewModel>(viewResult.Model);
                Assert.Equal(expTitle, model.Game?.Title);
            }
        }

        [Fact]
        public void Test_GameController_Page_Images()
        {
            using (var context = new ApplicationDbContext(dbContext))
            {
                // Arrange
                var controller = new GamesController(context);
                int gameID = 1;
                string[] expImageSources =
                {
                    "/Images/TheWitcher3.jpeg",
                    "/Images/Witcher3Gameplay.jpeg",
                    "/Images/Griphon.jpeg"
                };

                // Act
                var result = controller.Page(gameID);

                // Assert
                var viewResult = Assert.IsType<ViewResult>(result);
                var model = Assert.IsType<GameViewModel>(viewResult.Model);
                Assert.Equal(expImageSources, model.Game?.Images.ConvertAll(i => i.Source).ToArray());
                Assert.Equal(expImageSources[0], model.Game?.Main_Image?.Source);
            }
        }

        [Fact]
        public void Test_GameController_Page_Annotation()
        {
            using (var context = new ApplicationDbContext(dbContext))
            {
                // Arrange
                var controller = new GamesController(context);
                int gameID = 1;
                string expAnnotation = "«Ведьмак 3: Дикая Охота» — компьютерная игра от третьего лица в жанре action/RPG. Игрок играет за Геральта из Ривии, охотника на чудовищ, работающего по заказу. В игре существует очень большое количество разных видов чудовищ; при создании этого бестиария использовались мифология разных стран, восточноевропейский фольклор и эзотерика.";

                // Act
                var result = controller.Page(gameID);

                // Assert
                var viewResult = Assert.IsType<ViewResult>(result);
                var model = Assert.IsType<GameViewModel>(viewResult.Model);
                Assert.Equal(expAnnotation, model.Game?.Annotation);
            }
        }

        [Fact]
        public void Test_GameController_Page_Genres()
        {
            using (var context = new ApplicationDbContext(dbContext))
            {
                // Arrange
                var controller = new GamesController(context);
                int gameID = 2;
                string[] expGenresName =
                {
                    "Action", 
                    "Adventure", 
                    "Western"
                };

                // Act
                var result = controller.Page(gameID);

                // Assert
                var viewResult = Assert.IsType<ViewResult>(result);
                var model = Assert.IsType<GameViewModel>(viewResult.Model);
                Assert.Equal(expGenresName, model.Game?.Genres.ConvertAll(g => g.Name).ToArray());
            }
        }

        [Fact]
        public void Test_GameController_Page_Platforms()
        {
            using (var context = new ApplicationDbContext(dbContext))
            {
                // Arrange
                var controller = new GamesController(context);
                int gameID = 1;
                string[] expPlatformsName =
                {
                    "Sony PlayStation 4", 
                    "Sony PlayStation 5", 
                    "Xbox One", 
                    "Xbox Series X/s", 
                    "Windows", 
                    "Nintendo Switch"
                };

                // Act
                var result = controller.Page(gameID);

                // Assert
                var viewResult = Assert.IsType<ViewResult>(result);
                var model = Assert.IsType<GameViewModel>(viewResult.Model);
                Assert.Equal(expPlatformsName, model.Game?.Platforms.ConvertAll(p => p.Name).ToArray());
            }
        }

        [Fact]
        public void Test_GameController_Page_Studios()
        {
            using (var context = new ApplicationDbContext(dbContext))
            {
                // Arrange
                var controller = new GamesController(context);
                int gameID = 2;
                string expStudioName = "Rockstar Studios";
                string expPublisherName = "Rockstar Games";

                // Act
                var result = controller.Page(gameID);

                // Assert
                var viewResult = Assert.IsType<ViewResult>(result);
                var model = Assert.IsType<GameViewModel>(viewResult.Model);
                Assert.Equal(expStudioName, model.Game?.Studio?.Name);
                Assert.Equal(expPublisherName, model.Game?.Publisher?.Name);
            }
        }

        [Fact]
        public void Test_GameController_Page_Rates()
        {
            using (var context = new ApplicationDbContext(dbContext))
            {
                // Arrange
                var controller = new GamesController(context);
                int gameID = 1;
                Rating[] ratings =
                {
                    new Rating() { Plot = 5, Gameplay = 5, Graphics = 5, Emotions = 5, Comment = "Puska!!!!" },
                    new Rating() { Plot = 5, Gameplay = 5, Graphics = 5, Emotions = 5, Comment = "А я все вопросики открыл при пятом прохождении." },
                    new Rating() { Plot = 2, Gameplay = 3, Graphics = 2, Emotions = 3, Comment = "Даёшь кипербанк 2088" }
                };

                // Act
                var result = controller.Page(gameID);

                // Assert
                var viewResult = Assert.IsType<ViewResult>(result);
                var model = Assert.IsType<GameViewModel>(viewResult.Model);
                Assert.Equal(ratings.Length, model.Game?.Ratings.Count);
                for (int i = 0; i < ratings.Length; i++)
                {
                    Assert.Equal(ratings[i].Plot, model.Game?.Ratings[i].Plot);
                    Assert.Equal(ratings[i].Gameplay, model.Game?.Ratings[i].Gameplay);
                    Assert.Equal(ratings[i].Graphics, model.Game?.Ratings[i].Graphics);
                    Assert.Equal(ratings[i].Emotions, model.Game?.Ratings[i].Emotions);
                    Assert.Equal(ratings[i].Comment, model.Game?.Ratings[i].Comment);
                }
            }
        }

        [Fact]
        public void Test_GameController_Page_MinimumRequairements()
        {
            using (var context = new ApplicationDbContext(dbContext))
            {
                // Arrange
                var controller = new GamesController(context);
                int gameID = 1;
                Requirements minimum = new Requirements()
                {
                    OS = "64-bit Windows 7, 64-bit Windows 8 (8.1) or 64-bit Windows 10",
                    Processor = "Intel CPU Core i5-2500K 3.3GHz / AMD CPU Phenom II X4 940",
                    Graphics_Card = "Nvidia GPU GeForce GTX 660 / AMD GPU Radeon HD 7870",
                    Memory = "6 GB",
                    HDD_Space = "35 GB"
                };

                // Act
                var result = controller.Page(gameID);

                // Assert
                var viewResult = Assert.IsType<ViewResult>(result);
                var model = Assert.IsType<GameViewModel>(viewResult.Model);
                Assert.Equal(minimum.OS, model.Game?.Minimum?.OS);
                Assert.Equal(minimum.Processor, model.Game?.Minimum?.Processor);
                Assert.Equal(minimum.Graphics_Card, model.Game?.Minimum?.Graphics_Card);
                Assert.Equal(minimum.Memory, model.Game?.Minimum?.Memory);
                Assert.Equal(minimum.HDD_Space, model.Game?.Minimum?.HDD_Space);
            }
        }

        [Fact]
        public void Test_GameController_Page_RecommentedRequairements()
        {
            using (var context = new ApplicationDbContext(dbContext))
            {
                // Arrange
                var controller = new GamesController(context);
                int gameID = 1;
                Requirements recommented = new Requirements()
                {
                    OS = "64-bit Windows 7, 64-bit Windows 8 (8.1) or 64-bit Windows 10",
                    Processor = "Intel CPU Core i7 3770 3.4 GHz / AMD CPU AMD FX-8350 4",
                    Graphics_Card = "Nvidia GPU GeForce GTX 770 / AMD GPU Radeon R9 290",
                    Memory = "8 GB",
                    HDD_Space = "35 GB"
                };

                // Act
                var result = controller.Page(gameID);

                // Assert
                var viewResult = Assert.IsType<ViewResult>(result);
                var model = Assert.IsType<GameViewModel>(viewResult.Model);
                Assert.Equal(recommented.OS, model.Game?.Recomended?.OS);
                Assert.Equal(recommented.Processor, model.Game?.Recomended?.Processor);
                Assert.Equal(recommented.Graphics_Card, model.Game?.Recomended?.Graphics_Card);
                Assert.Equal(recommented.Memory, model.Game?.Recomended?.Memory);
                Assert.Equal(recommented.HDD_Space, model.Game?.Recomended?.HDD_Space);
            }
        }
    }
}