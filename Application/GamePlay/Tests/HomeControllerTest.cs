using Xunit;
using GamePlay.Controllers;
using GamePlay.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Mvc;
using GamePlay.Models;
using GamePlay.Models.BbModels;

namespace Tests
{
    public class HomeControllerTest
    {
        private DbContextOptions<ApplicationDbContext> dbContext = new DbContextOptions<ApplicationDbContext>();

        [Fact]
        public void Test_HomeController_Index_GamesWithoutFilters()
        {
            using (var context = new ApplicationDbContext(dbContext))
            {
                // Arrange
                var controller = new HomeController(context);
                var indexView = new IndexViewModel();
                int[] expGamesID = Enumerable.Range(1, 20).ToArray();

                // Act
                var result = controller.Index(indexView);

                // Assert
                var viewResult = Assert.IsType<ViewResult>(result);
                var model = Assert.IsType<IndexViewModel>(viewResult.Model);
                Assert.Equal(expGamesID, model.Games.ConvertAll(g => g.Idgame).ToArray());
            }
        }

        [Fact]
        public void Test_HomeController_Index_GamesForGenre()
        {
            using (var context = new ApplicationDbContext(dbContext))
            {
                // Arrange
                var controller = new HomeController(context);
                var indexView = new IndexViewModel();
                indexView.Set(context.genres.ToList());
                indexView.Genres[0].Selected = true;
                int[] expGamesID = new int[] { 2, 8, 10, 11, 12, 15, 19 };

                // Act
                var result = controller.Index(indexView);

                // Assert
                var viewResult = Assert.IsType<ViewResult>(result);
                var model = Assert.IsType<IndexViewModel>(viewResult.Model);
                Assert.Equal(expGamesID, model.Games.ConvertAll(g => g.Idgame).ToArray());
            }
        }

        [Fact]
        public void Test_HomeController_Index_GamesForPtatform()
        {
            using (var context = new ApplicationDbContext(dbContext))
            {
                // Arrange
                var controller = new HomeController(context);
                var indexView = new IndexViewModel();
                indexView.Set(context.platforms.ToList());
                indexView.Platforms[12].Selected = true;
                int[] expGamesID = new int[] { 5, 8, 9, 10, 17 };

                // Act
                var result = controller.Index(indexView);

                // Assert
                var viewResult = Assert.IsType<ViewResult>(result);
                var model = Assert.IsType<IndexViewModel>(viewResult.Model);
                Assert.Equal(expGamesID, model.Games.ConvertAll(g => g.Idgame).ToArray());
            }
        }

        [Fact]
        public void Test_HomeController_Index_GamesForStudos()
        {
            using (var context = new ApplicationDbContext(dbContext))
            {
                // Arrange
                var controller = new HomeController(context);
                var indexView = new IndexViewModel();
                indexView.Set(context.studios.ToList());
                indexView.Studios[0].Selected = true;
                int[] expGamesID = new int[] { 1 };

                // Act
                var result = controller.Index(indexView);

                // Assert
                var viewResult = Assert.IsType<ViewResult>(result);
                var model = Assert.IsType<IndexViewModel>(viewResult.Model);
                Assert.Equal(expGamesID, model.Games.ConvertAll(g => g.Idgame).ToArray());
            }
        }

        [Fact]
        public void Test_HomeController_Index_GamesForReleaseDate()
        {
            using (var context = new ApplicationDbContext(dbContext))
            {
                // Arrange
                var controller = new HomeController(context);
                var indexView = new IndexViewModel();
                indexView.MinimumYear = 2000;
                indexView.MaximumYear = 2010;
                int[] expGamesID = new int[] { 4, 5 };

                // Act
                var result = controller.Index(indexView);

                // Assert
                var viewResult = Assert.IsType<ViewResult>(result);
                var model = Assert.IsType<IndexViewModel>(viewResult.Model);
                Assert.Equal(expGamesID, model.Games.ConvertAll(g => g.Idgame).ToArray());
            }
        }

        [Fact]
        public void Test_HomeController_Index_GamesForMiddleRate()
        {
            using (var context = new ApplicationDbContext(dbContext))
            {
                // Arrange
                var controller = new HomeController(context);
                var indexView = new IndexViewModel();
                indexView.MinimumRate = 4;
                indexView.MaximumRate = 5;
                int[] expGamesID = new int[] { 1, 2, 5, 7, 13, 16 };

                // Act
                var result = controller.Index(indexView);

                // Assert
                var viewResult = Assert.IsType<ViewResult>(result);
                var model = Assert.IsType<IndexViewModel>(viewResult.Model);
                Assert.Equal(expGamesID, model.Games.ConvertAll(g => g.Idgame).ToArray());
            }
        }

        [Fact]
        public void Test_HomeController_Index_GamesForGenreAndStudios()
        {
            using (var context = new ApplicationDbContext(dbContext))
            {
                // Arrange
                var controller = new HomeController(context);
                var indexView = new IndexViewModel();
                indexView.Set(context.genres.ToList());
                indexView.Set(context.studios.ToList());
                indexView.Genres[7].Selected = true;
                indexView.Studios[0].Selected = true;
                int[] expGamesID = new int[] { 1 };

                // Act
                var result = controller.Index(indexView);

                // Assert
                var viewResult = Assert.IsType<ViewResult>(result);
                var model = Assert.IsType<IndexViewModel>(viewResult.Model);
                Assert.Equal(expGamesID, model.Games.ConvertAll(g => g.Idgame).ToArray());
            }
        }
    }
}
