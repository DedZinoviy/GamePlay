using GamePlay.Models.BbModels;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace GamePlay.Data
{
    public class ApplicationDbContext : IdentityDbContext
    {
        public DbSet<User> users { get; set; }

        public DbSet<Game> games { get; set; }

        public DbSet<Genre> genres { get; set; }

        public DbSet<Platform> platforms { get; set; }

        public DbSet<Studio> studios { get; set; }

        public DbSet<News> news { get; set; }

        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
            //Database.EnsureCreated();
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseMySql(
                "server=localhost;user=root;password=0000;database=game_play_db;",
                new MySqlServerVersion(new Version(8, 0, 11))
            );
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<Requirements>().ToTable("requirements");
            modelBuilder.Entity<Studio>().ToTable("studios");
            modelBuilder.Entity<Platform>().ToTable("platforms");
            modelBuilder.Entity<Rating>().ToTable("ratings");

            modelBuilder.Entity<GenreGames>().HasKey(gg => new { gg.IdGenre, gg.IdGame });
            modelBuilder.Entity<PlatformGames>().HasKey(pg => new { pg.Idplatform, pg.Idgame });
            modelBuilder.Entity<Rating>().HasKey(r => new { r.Iduser, r.Idgame });

            modelBuilder.Entity<Game>()
                .HasMany(g => g.Images)
                .WithOne(i => i.Game)
                .HasForeignKey(s => s.Idgame);

            modelBuilder.Entity<Game>()
                .HasMany(g => g.Genres)
                .WithMany(g => g.Games)
                .UsingEntity<GenreGames>();

            modelBuilder.Entity<Game>()
                .HasMany(g => g.Platforms)
                .WithMany(p => p.Games)
                .UsingEntity<PlatformGames>();

            modelBuilder.Entity<Game>()
                .HasMany(g => g.Ratings)
                .WithOne(r => r.Game)
                .HasForeignKey(r => r.Idgame);

            modelBuilder.Entity<User>()
                .HasMany(u => u.Ratings)
                .WithOne(r => r.User)
                .HasForeignKey(r => r.Iduser);

            modelBuilder.Entity<User>()
                .HasMany(u => u.News)
                .WithOne(n => n.User)
                .HasForeignKey(n => n.Iduser);
        }
    }
}