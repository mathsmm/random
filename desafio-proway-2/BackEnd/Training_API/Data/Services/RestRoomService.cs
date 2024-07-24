using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Training_API.Data.Interfaces;
using Training_API.Models;

namespace Training_API.Data.Services
{
    public class RestRoomService : IRestRoom
    {
        private readonly DataContext _context;
        public RestRoomService(DataContext context)
        {
            this._context = context;
        }

        public async Task<RestRoom[]> GetAllAsync()
        {
            IQueryable<RestRoom> query = _context.RestRoom;
            query = query.AsNoTracking().OrderBy(p => p.Id);
            return await query.ToArrayAsync();
        }

        public async Task<RestRoom> GetByIdAsync(int restRoomId, bool includePeople)
        {
            IQueryable<RestRoom> query = _context.RestRoom;
            if (includePeople)
            {
                query = query.Include(rr => rr.RestRoomPeople)
                             .ThenInclude(rrp => rrp.Person);
            }
            query = query.AsNoTracking().Where(p => p.Id == restRoomId);
            return await query.FirstOrDefaultAsync();
        }
    }
}