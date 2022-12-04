using Xunit;
using GamePlay.Controllers;
using GamePlay.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Mvc;
using GamePlay.Models;
using GamePlay.Models.BbModels;

namespace Tests
{
    public class ProfileControllerTest
    {
        private DbContextOptions<ApplicationDbContext> dbContext = new DbContextOptions<ApplicationDbContext>();

        [Fact]
        public void Test_ProfileController_Login()
        {
            using (var context = new ApplicationDbContext(dbContext))
            {
                // Arrange
                var controller = new ProfileController(context);

                // Act
                var result = controller.Login();

                // Assert
                var viewResult = Assert.IsType<ViewResult>(result);
                var model = Assert.IsType<UserViewModel>(viewResult.Model);
            }
        }

        [Fact]
        public void Test_ProfileController_Register()
        {
            using (var context = new ApplicationDbContext(dbContext))
            {
                // Arrange
                var controller = new ProfileController(context);

                // Act
                var result = controller.Register();

                // Assert
                var viewResult = Assert.IsType<ViewResult>(result);
                var model = Assert.IsType<UserViewModel>(viewResult.Model);
            }
        }
    }
}
