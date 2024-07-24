namespace Training_API.Models
{
    public class RestRoomPerson
    {
        public RestRoomPerson(int id, int restTimeId, int restRoomId, int personId)
        {
            this.Id = id;
            this.RestTimeId = restTimeId;
            this.RestRoomId = restRoomId;
            this.PersonId = personId;
        }
        public int Id { get; set; }
        public int RestTimeId { get; set; }
        public RestTime RestTime { get; set; }
        public int RestRoomId { get; set; }
        public RestRoom RestRoom { get; set; }
        public int PersonId { get; set; }
        public Person Person { get; set; }
    }
}