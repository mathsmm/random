using System.Collections.Generic;
using System.Threading.Tasks;
using Training_API.Models;

namespace Training_API.Data.Interfaces
{
    public interface ITrainingRoom
    {
        Task<TrainingRoom[]> GetAllAsync();
        Task<TrainingRoom> GetByIdAsync(int trainingRoomId, bool includePeople);
        List<int> ReturnRoomIdList();
        int ReturnTrainingRoomCapacity(int trainingRoomId);
    }
}