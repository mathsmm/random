using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Training_API.Data.Interfaces;
using Training_API.Models;

namespace Training_API.Data.Services
{
    public class RestTimeService : IRestTime
    {
        private readonly DataContext _context;
        public RestTimeService(DataContext context)
        {
            this._context = context;
        }

        public async Task<RestTime[]> GetAllAsync()
        {
            IQueryable<RestTime> query = _context.RestTime;
            query = query.AsNoTracking().OrderBy(p => p.Id);
            return await query.ToArrayAsync();
        }

        public async Task<RestTime> GetByIdAsync(int restTimeId)
        {
            IQueryable<RestTime> query = _context.RestTime;
            query = query.AsNoTracking().Where(p => p.Id == restTimeId);
            return await query.FirstOrDefaultAsync();
        }
    }
}