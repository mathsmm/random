using System.Threading.Tasks;
using Training_API.Models;

namespace Training_API.Data.Interfaces
{
    public interface IRestTime
    {
        Task<RestTime[]> GetAllAsync();
        Task<RestTime> GetByIdAsync(int restTimeId);
    }
}