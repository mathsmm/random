using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Training_API.Data.Interfaces;
using Training_API.Models;

namespace Training_API.Data.Services
{
    public class PersonService : IPerson
    {
        private readonly DataContext _context;
        public PersonService(DataContext context)
        {
            this._context = context;
        }

        public async Task<Person[]> GetAllAsync()
        {
            IQueryable<Person> query = _context.Person;
            query = query.AsNoTracking().OrderBy(p => p.Id);
            return await query.ToArrayAsync();
        }

        public async Task<Person> GetByIdAsync(int personId, bool includeRooms)
        {
            IQueryable<Person> query = _context.Person;
            if (includeRooms)
            {
                query = query.Include(p => p.TrainingRoomPeople)
                             .ThenInclude(trp => trp.TrainingRoom);
                query = query.Include(p => p.TrainingRoomPeople)
                             .ThenInclude(trp => trp.StageTime);
                query = query.Include(p => p.RestRoomPeople)
                             .ThenInclude(rrp => rrp.RestRoom);
                query = query.Include(p => p.RestRoomPeople)
                             .ThenInclude(rrp => rrp.RestTime);
            }
            query = query.AsNoTracking().Where(p => p.Id == personId);
            return await query.FirstOrDefaultAsync();
        }
    }
}