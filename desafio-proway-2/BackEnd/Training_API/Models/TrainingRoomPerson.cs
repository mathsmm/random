namespace Training_API.Models
{
    public class TrainingRoomPerson
    {
        public TrainingRoomPerson(int id, int stageTimeId, int trainingRoomId, int personId)
        {
            this.Id = id;
            this.StageTimeId = stageTimeId;
            this.TrainingRoomId = trainingRoomId;
            this.PersonId = personId;
        }
        public int Id { get; set; }
        public int StageTimeId { get; set; }
        public StageTime StageTime { get; set; }
        public int TrainingRoomId { get; set; }
        public TrainingRoom TrainingRoom { get; set; }
        public int PersonId { get; set; }
        public Person Person { get; set; }
    }
}