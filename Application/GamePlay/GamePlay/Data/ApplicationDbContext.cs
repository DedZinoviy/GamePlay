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
                "server=sql11.freesqldatabase.com;user=sql11528557;password=hA3bRIYxcE;database=sql11528557;",
                new MySqlServerVersion(new Version(8, 0, 11))
            );
        }
    }
}