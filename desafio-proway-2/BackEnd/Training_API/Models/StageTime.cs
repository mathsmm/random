using System;

namespace Training_API.Models
{
    public class StageTime
    {
        public StageTime(int id, DateTime startingDateTime, DateTime endingDateTime)
        {
            this.Id = id;
            this.StartingDateTime = startingDateTime;
            this.EndingDateTime = endingDateTime;
        }
        public int Id { get; set; }
        public DateTime StartingDateTime { get; set; }
        public DateTime EndingDateTime { get; set; }
    }
}