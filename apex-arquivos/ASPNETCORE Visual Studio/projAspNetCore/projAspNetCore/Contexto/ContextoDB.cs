using Microsoft.EntityFrameworkCore;
using projAspNetCore.Models;

namespace projAspNetCore.Contexto
{
    public class ContextoDB : DbContext
    {
        public ContextoDB(DbContextOptions<ContextoDB> opcoes) : base(opcoes)
        {
        }

        public DbSet<Funcionario> Funcionario { get; set; }
    }
}
