import { Person } from './Person';
import { RestRoom } from './RestRoom';
import { RestTime } from "./RestTime";

export class RestRoomPerson {
  
  constructor() {
    this.id = 0;
    this.restTimeId = 0;
    this.restTime = new RestTime();
    this.restRoomId = 0;
    this.restRoom = new RestRoom();
    this.personId = 0;
    this.person = new Person();
  }
  
  id: number;
  restTimeId: number;
  restTime: RestTime;
  restRoomId: number;
  restRoom: RestRoom;
  personId: number;
  person: Person;
}
