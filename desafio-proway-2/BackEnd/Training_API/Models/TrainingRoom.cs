using System.Collections.Generic;

namespace Training_API.Models
{
    public class TrainingRoom
    {
        public TrainingRoom(int id, string name, int capacity)
        {
            this.Id = id;
            this.Name = name;
            this.Capacity = capacity;
        }
        public int Id { get; set; }
        public string Name { get; set; }
        public int Capacity { get; set; }
        public IEnumerable<TrainingRoomPerson> TrainingRoomPeople { get; set; }
    }
}