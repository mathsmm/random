using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Training_API.Data.Interfaces;
using Training_API.Models;

namespace Training_API.Data.Services
{
    public class RestRoomPersonService : IRestRoomPerson
    {
        private readonly DataContext _context;
        private readonly IRestRoom _restRoom;
        public RestRoomPersonService(DataContext context, IRestRoom restRoom)
        {
            this._context = context;
            this._restRoom = restRoom;
        }

        public async Task<RestRoomPerson[]> GetAllAsync()
        {
            IQueryable<RestRoomPerson> query = _context.RestRoomPerson;
            query = query.AsNoTracking().OrderBy(rrp => rrp.Id);
            return await query.ToArrayAsync();
        }

        public async Task<RestRoomPerson> GetByIdAsync(int restRoomPersonId)
        {
            IQueryable<RestRoomPerson> query = _context.RestRoomPerson;
            query = query.AsNoTracking().Where(rrp => rrp.Id == restRoomPersonId);
            return await query.FirstOrDefaultAsync();
        }

        public async Task<RestRoomPerson[]> GetByRoomId(int roomId)
        {
            IQueryable<RestRoomPerson> query = _context.RestRoomPerson;
            query = query.Include(rrp => rrp.Person);
            query = query.AsNoTracking().Where(rrp => rrp.RestRoomId == roomId);
            return await query.ToArrayAsync();
        }

        public async Task<RestRoomPerson[]> GetByPersonId(int personId)
        {
            IQueryable<RestRoomPerson> query = _context.RestRoomPerson;
            query = query.AsNoTracking().Where(rrp => rrp.PersonId == personId);
            query = query.Include(rrp => rrp.RestTime);
            query = query.Include(rrp => rrp.RestRoom);
            return await query.ToArrayAsync();
        }
    }
}