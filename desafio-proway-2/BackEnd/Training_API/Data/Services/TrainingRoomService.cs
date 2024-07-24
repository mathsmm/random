using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Training_API.Data.Interfaces;
using Training_API.Models;

namespace Training_API.Data.Services
{
    public class TrainingRoomService : ITrainingRoom
    {
        private readonly DataContext _context;
        public TrainingRoomService(DataContext context)
        {
            this._context = context;
        }

        public async Task<TrainingRoom[]> GetAllAsync()
        {
            IQueryable<TrainingRoom> query = _context.TrainingRoom;
            query = query.AsNoTracking().OrderBy(tr => tr.Id);
            return await query.ToArrayAsync();
        }

        public async Task<TrainingRoom> GetByIdAsync(int trainingRoomId, bool includePeople)
        {
            IQueryable<TrainingRoom> query = _context.TrainingRoom;
            if (includePeople)
            {
                query = query.Include(tr => tr.TrainingRoomPeople)
                             .ThenInclude(trp => trp.Person);
            }
            query = query.AsNoTracking().Where(tr => tr.Id == trainingRoomId);
            return await query.FirstOrDefaultAsync();
        }

        public List<int> ReturnRoomIdList()
        {
            IQueryable<TrainingRoom> query = _context.TrainingRoom;
            query = query.AsNoTracking().OrderBy(tr => tr.Id);
            return query.Select(tr => tr.Id).ToList();
        }

        public int ReturnTrainingRoomCapacity(int trainingRoomId)
        {
            IQueryable<TrainingRoom> query = _context.TrainingRoom;
            query = query.AsNoTracking().Where(tr => tr.Id == trainingRoomId);
            return query.Select(tr => tr.Capacity).FirstOrDefault();
        }
    }
}