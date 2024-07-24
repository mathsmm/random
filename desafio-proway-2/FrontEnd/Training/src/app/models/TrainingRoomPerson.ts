import { Person } from './Person';
import { StageTime } from "./StageTime";
import { TrainingRoom } from "./TrainingRoom";

export class TrainingRoomPerson {
  
  constructor() {
    this.id = 0;
    this.stageTimeId = 0;
    this.stageTime = new StageTime();
    this.trainingRoomId = 0;
    this.trainingRoom = new TrainingRoom();
    this.personId = 0;
    this.person = new Person();
  }
  
  id: number;
  stageTimeId: number;
  stageTime: StageTime;
  trainingRoomId: number;
  trainingRoom: TrainingRoom;
  personId: number;
  person: Person;
}
