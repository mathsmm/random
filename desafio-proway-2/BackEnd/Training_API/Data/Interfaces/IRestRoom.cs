using System.Collections.Generic;
using System.Threading.Tasks;
using Training_API.Models;

namespace Training_API.Data.Interfaces
{
    public interface IRestRoom
    {
        Task<RestRoom[]> GetAllAsync();
        Task<RestRoom> GetByIdAsync(int restRoomId, bool includePeople);
    }
}