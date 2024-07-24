using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Training_API.Data.Interfaces;
using Training_API.Models;

namespace Training_API.Data.Services
{
    public class StageTimeService : IStageTime
    {
        private readonly DataContext _context;
        public StageTimeService(DataContext context)
        {
            this._context = context;
        }

        public async Task<StageTime[]> GetAllAsync()
        {
            IQueryable<StageTime> query = _context.StageTime;
            query = query.AsNoTracking().OrderBy(st => st.Id);
            return await query.ToArrayAsync();
        }

        public async Task<StageTime> GetByIdAsync(int stageTimeId)
        {
            IQueryable<StageTime> query = _context.StageTime;
            query = query.AsNoTracking().Where(st => st.Id == stageTimeId);
            return await query.FirstOrDefaultAsync();
        }
    }
}