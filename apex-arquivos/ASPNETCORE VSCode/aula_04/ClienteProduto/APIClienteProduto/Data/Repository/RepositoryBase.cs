using System.Threading.Tasks;
using APIClienteProduto.Data.Repository.Interfaces;

namespace APIClienteProduto.Data.Repository
{
    public class RepositoryBase : IRepository
    {
        private readonly DataContext _context;

        public RepositoryBase(DataContext context)
        {
            this._context = context;
        }

        public void Add<T>(T entity) where T : class
        {
            this._context.Add(entity);
        }

        public void Delete<T>(T entity) where T : class
        {
            this._context.Remove(entity);
        }

        public void Update<T>(T entity) where T : class
        {
            this._context.Update(entity);
        }

        public async Task<bool> SaveChangesAsync()
        {
            return (await _context.SaveChangesAsync()) > 0;
        }
    }
}