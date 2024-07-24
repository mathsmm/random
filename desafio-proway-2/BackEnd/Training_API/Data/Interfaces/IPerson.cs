using System.Threading.Tasks;
using Training_API.Models;

namespace Training_API.Data.Interfaces
{
    public interface IPerson
    {
        Task<Person[]> GetAllAsync();
        Task<Person> GetByIdAsync(int personId, bool includeRooms);
    }
}