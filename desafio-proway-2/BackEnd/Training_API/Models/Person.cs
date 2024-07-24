using System.Collections.Generic;

namespace Training_API.Models
{
    public class Person
    {
        public Person(int id, string name, string surname)
        {
            this.Id = id;
            this.Name = name;
            this.Surname = surname;
        }
        public int Id { get; set; }
        public string Name { get; set; }
        public string Surname { get; set; }
        public IEnumerable<TrainingRoomPerson> TrainingRoomPeople { get; set; }
        // public TrainingRoomPerson TrainingRoomPerson { get; set; }
        public IEnumerable<RestRoomPerson> RestRoomPeople { get; set; }
        // public RestRoomPerson RestRoomPerson { get; set; }
    }
}