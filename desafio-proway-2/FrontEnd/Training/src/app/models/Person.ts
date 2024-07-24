import { RestRoomPerson } from "./RestRoomPerson";
import { TrainingRoomPerson } from "./TrainingRoomPerson";

export class Person {
  
  constructor () {
    this.id = 0;
    this.name = '';
    this.surname = '';
  }
  
  id: number;
  name: string;
  surname: string;
}
