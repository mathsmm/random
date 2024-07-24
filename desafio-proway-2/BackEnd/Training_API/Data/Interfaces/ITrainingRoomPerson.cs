using System.Collections.Generic;
using System.Threading.Tasks;
using Training_API.Models;

namespace Training_API.Data.Interfaces
{
    public interface ITrainingRoomPerson
    {
        Task<TrainingRoomPerson[]> GetAllAsync();
        Task<TrainingRoomPerson> GetByIdAsync(int trainingRoomPersonId);
        Task<TrainingRoomPerson[]> GetByRoomId(int roomId);
        Task<TrainingRoomPerson[]> GetByPersonId(int personId);
        List<int> ReturnPeopleQuantityPerRoomList(int stageTimeId);
        int ReturnPeopleQuantityInRoom(int trainingRoomid);
    }
}