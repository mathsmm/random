using System.Collections.Immutable;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using APIClienteProduto.Models;

namespace APIClienteProduto.Data
{
    public class DataContext : DbContext
    {
        public DataContext(DbContextOptions<DataContext> options) : base(options) {}

        public DbSet<Product> Product { get; set; }
        public DbSet<Client> Client { get; set; }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            builder.Entity<Client>()
                .HasData(
                    new List<Client>() 
                    {
                        new Client(1, "Diego", "11111111111"),
                        new Client(2, "Felipe", "11111111112"),
                        new Client(3, "Matheus", "11111111113"),
                        new Client(4, "Marcela", "11111111114")
                    }
                );

            builder.Entity<Product>()
                .HasData(
                    new List<Product>()
                    {
                        new Product(1, "Batata", 4, 1),
                        new Product(2, "Arroz", 6, 1),
                        new Product(3, "Macarrão", 5, 1),

                        new Product(4, "Pãozinho", 8, 2),
                        new Product(5, "Alcatra", 45, 2),

                        new Product(6, "Feijão", 9, 3),
                        new Product(7, "Carvão", 15, 3),

                        new Product(8, "Couve-flor", 7, 4),
                        new Product(9, "Brócolis", 2, 4),
                        new Product(10, "Cerveja", 32, 4)
                    }
                );
        }

    }
}