using System.Threading.Tasks;
using Training_API.Models;

namespace Training_API.Data.Interfaces
{
    public interface IStageTime
    {
        Task<StageTime[]> GetAllAsync();
        Task<StageTime> GetByIdAsync(int stageTimeId);
    }
}