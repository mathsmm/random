import { TrainingroomService } from './../services/trainingroom.service';
import { TrainingRoomPerson } from './../models/TrainingRoomPerson';
import { TrainingRoom } from './../models/TrainingRoom';
import { Component, OnInit } from '@angular/core';
import { TrainingroompersonService } from '../services/trainingroomperson.service';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-trainingroom',
  templateUrl: './trainingroom.component.html',
  styleUrls: ['./trainingroom.component.css']
})
export class TrainingroomComponent implements OnInit {

  public trainingRoomTitle = 'Training-Rooms';
  public selectedTrainingRoom: TrainingRoom = new TrainingRoom();

  trainingRoomForm = new FormGroup({
    id: new FormControl(''),
    name: new FormControl(''),
    capacity: new FormControl('')
  });

  public trainingRooms: TrainingRoom[] = [];
  public trainingRoomPeople: TrainingRoomPerson[] = [];

  constructor(private fb: FormBuilder,
              private trainingRoomService: TrainingroomService,
              private trainingRoomPersonService: TrainingroompersonService) {
    this.createForm();
  }

  getPeopleInRoom(roomId: number) {
    this.trainingRoomPersonService.getByRoomId(roomId).subscribe(
      (result: TrainingRoomPerson[]) => {
        this.trainingRoomPeople = result;
      },
      (error: any) => {
        console.log(error);
      }
    );
  }

  createForm() {
    this.trainingRoomForm = this.fb.group({
      id: [''],
      name: ['', Validators.required],
      capacity: ['', Validators.required]
    });
  }

  ngOnInit() {
    this.loadTrainingRooms();
  }

  loadTrainingRooms() {
    this.trainingRoomService.getAll().subscribe(
      (result: TrainingRoom[]) => {
        this.trainingRooms = result;
      },
      (error: any) => {
        console.log(error);
      }
    );
  }

  selectTrainingRoom(trainingRoom: TrainingRoom) {
    this.selectedTrainingRoom = trainingRoom;
    this.trainingRoomForm.patchValue(trainingRoom);
    this.getPeopleInRoom(trainingRoom.id);
  }

  newTrainingRoom() {
    this.selectedTrainingRoom = new TrainingRoom();
    this.selectedTrainingRoom.id = -1;
    this.trainingRoomForm.patchValue(this.selectedTrainingRoom);
  }

  saveTrainingRoom(trainingRoom: TrainingRoom) {
    if (this.selectedTrainingRoom.id === -1) {
      trainingRoom.id = 0;
      this.trainingRoomService.save(trainingRoom).subscribe(
        (result: any) => {
          console.log(result);
          this.selectedTrainingRoom = new TrainingRoom();
          this.loadTrainingRooms();
        },
        (error: any) => {
          console.log(error);
        }
      )
    } else {
      this.trainingRoomService.edit(trainingRoom).subscribe(
        (result: any) => {
          console.log(result);
          this.selectedTrainingRoom = result;
          this.loadTrainingRooms();
        },
        (error: any) => {
          console.log(error);
        }
      )
    }
  }

  deleteTrainingRoom(trainingRoom: TrainingRoom) {
    this.trainingRoomService.delete(trainingRoom.id).subscribe(
      (result: any) => {
        console.log(result);
        this.loadTrainingRooms();
      },
      (error: any) => {
        console.log(error);
      }
    )
  }

  onSubmit() {
    this.saveTrainingRoom(this.trainingRoomForm.value);
  }

  goBack() {
    this.selectedTrainingRoom = new TrainingRoom();
  }

}
