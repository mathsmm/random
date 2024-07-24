using System.Linq;
using System.Threading.Tasks;
using APIClienteProduto.Data.Repository.Interfaces;
using APIClienteProduto.Models;
using Microsoft.EntityFrameworkCore;

namespace APIClienteProduto.Data.Repository
{
    public class RepositoryProduct : IRepositoryProduct
    {
        private readonly DataContext _context;

        public RepositoryProduct(DataContext context)
        {
            this._context = context;
        }

        public async Task<Product[]> GetAllAsync()
        {
            IQueryable<Product> query = this._context.Product;

            query = query.AsNoTracking().OrderBy(p => p.Id);
            return await query.ToArrayAsync();
        }

        public async Task<Product> GetByIdAsync(int productId)
        {
            IQueryable<Product> query = this._context.Product;

            query = query.AsNoTracking()
                         .OrderBy(p => p.Id)
                         .Where(p => p.Id == productId);

            return await query.FirstOrDefaultAsync();
        }

        public async Task<Product[]> GetByClientIdAsync(int clientId)
        {
            IQueryable<Product> query = this._context.Product;

            query = query.Include(p => p.Client)
                         .AsNoTracking()
                         .OrderBy(p => p.Id)
                         .Where(p => p.ClientId == clientId);

            return await query.ToArrayAsync();
        }
    }
}