using Microsoft.EntityFrameworkCore;

namespace Rover.Models
{
    public class ApiDbContext : DbContext
    {
        public ApiDbContext(DbContextOptions option) : base(option) 
        { 
        
        }

        public DbSet<Users> Users { get; set; }
        public DbSet<Route> Routes { get; set; }
        public DbSet<History> Histories { get; set; }
    }

}
