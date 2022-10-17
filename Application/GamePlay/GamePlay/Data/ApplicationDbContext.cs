using GamePlay.Models;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace GamePlay.Data
{
    public class ApplicationDbContext : IdentityDbContext
    {
        public DbSet<User> users { get; set; }

        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
            //Database.EnsureCreated();
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseMySql(
                "server=localhost;user=root;password=Hell.2002;database=game_play_db;",
                new MySqlServerVersion(new Version(8, 0, 11))
            );
        }
    }
}