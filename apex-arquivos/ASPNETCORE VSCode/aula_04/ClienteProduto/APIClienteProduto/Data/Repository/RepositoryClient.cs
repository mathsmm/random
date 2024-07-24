using System.Threading.Tasks;
using APIClienteProduto.Data.Repository.Interfaces;
using APIClienteProduto.Models;
using System.Linq;
using Microsoft.EntityFrameworkCore;

namespace APIClienteProduto.Data.Repository
{
    public class RepositoryClient : IRepositoryClient
    {
        private readonly DataContext _context;

        public RepositoryClient(DataContext context)
        {
            this._context = context;
        }

        public async Task<Client[]> GetAllAsync(bool includeProduct)
        {
            IQueryable<Client> query = this._context.Client;

            if (includeProduct)
            {
                query = query.Include(p => p.Products);
            }

            query = query.AsNoTracking().OrderBy(c => c.Id);
            return await query.ToArrayAsync();
        }

        public async Task<Client> GetByIdAsync(int clientId, bool includeProduct)
        {
            IQueryable<Client> query = this._context.Client;

            if (includeProduct)
            {
                query = query.Include(p => p.Products);
            }

            query = query.AsNoTracking()
                         .OrderBy(c => c.Id)
                         .Where(c => c.Id == clientId);

            return await query.FirstOrDefaultAsync();
        }
    }
}