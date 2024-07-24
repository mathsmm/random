using Microsoft.EntityFrameworkCore;
using WebAPI1.Models;

namespace WebAPI1.Context
{
    public class ContextApp : DbContext
    {
        public ContextApp(DbContextOptions<ContextApp> options) : base(options) {}

        public DbSet<Cliente> Cliente { get; set; }

        public DbSet<Produto> Produto { get; set; }
    }
}