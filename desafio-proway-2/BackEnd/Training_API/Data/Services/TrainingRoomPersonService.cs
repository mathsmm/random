using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Training_API.Data.Interfaces;
using Training_API.Models;

namespace Training_API.Data.Services
{
    public class TrainingRoomPersonService : ITrainingRoomPerson
    {
        private readonly DataContext _context;
        private readonly ITrainingRoom _trainingRoom;
        public TrainingRoomPersonService(DataContext context, ITrainingRoom trainingRoom)
        {
            this._context = context;
            this._trainingRoom = trainingRoom;
        }

        public async Task<TrainingRoomPerson[]> GetAllAsync()
        {
            IQueryable<TrainingRoomPerson> query = _context.TrainingRoomPerson;
            query = query.AsNoTracking().OrderBy(trp => trp.Id);
            return await query.ToArrayAsync();
        }

        public async Task<TrainingRoomPerson> GetByIdAsync(int trainingRoomPersonId)
        {
            IQueryable<TrainingRoomPerson> query = _context.TrainingRoomPerson;
            query = query.AsNoTracking().Where(trp => trp.Id == trainingRoomPersonId);
            return await query.FirstOrDefaultAsync();
        }

        public async Task<TrainingRoomPerson[]> GetByRoomId(int roomId)
        {
            IQueryable<TrainingRoomPerson> query = _context.TrainingRoomPerson;
            query = query.Include(trp => trp.Person);
            query = query.AsNoTracking().Where(trp => trp.TrainingRoomId == roomId);
            return await query.ToArrayAsync();
        }

        public async Task<TrainingRoomPerson[]> GetByPersonId(int personId)
        {
            IQueryable<TrainingRoomPerson> query = _context.TrainingRoomPerson;
            query = query.Include(trp => trp.StageTime);
            query = query.Include(trp => trp.TrainingRoom);
            query = query.AsNoTracking().Where(trp => trp.PersonId == personId);
            return await query.ToArrayAsync();
        }

        public List<int> ReturnPeopleQuantityPerRoomList(int stageTimeId)
        {
            List<int> list = new List<int>();
            foreach (var trainingRoomId in _trainingRoom.ReturnRoomIdList())
            {
                IQueryable<TrainingRoomPerson> query = _context.TrainingRoomPerson;
                query = query.Where(trp => trp.StageTimeId == stageTimeId && trp.TrainingRoomId == trainingRoomId);
                list.Add(query.Count());
            }
            return list;
        }

        public int ReturnPeopleQuantityInRoom(int trainingRoomid)
        {
            IQueryable<TrainingRoomPerson> query = _context.TrainingRoomPerson;
            query = query.Where(trp => trp.StageTimeId == 1 && trp.TrainingRoomId == trainingRoomid);
            return query.Count();
        }
    }
}