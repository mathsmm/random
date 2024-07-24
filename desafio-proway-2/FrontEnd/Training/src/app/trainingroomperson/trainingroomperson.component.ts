import { TrainingroompersonService } from './../services/trainingroomperson.service';
import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { TrainingRoomPerson } from '../models/TrainingRoomPerson';

@Component({
  selector: 'app-trainingroomperson',
  templateUrl: './trainingroomperson.component.html',
  styleUrls: ['./trainingroomperson.component.css']
})
export class TrainingroompersonComponent implements OnInit {

  public trainingRoomPersonTitle = 'Training-Room-People';
  public selectedTrainingRoomPerson: TrainingRoomPerson = new TrainingRoomPerson();

  trainingRoomPersonForm = new FormGroup({
    id: new FormControl(''),
    stageTimeId: new FormControl(''),
    trainingRoomId: new FormControl(''),
    personId: new FormControl('')
  });

  public trainingRoomPeople: TrainingRoomPerson[] = [];

  constructor(private fb: FormBuilder,
              private trainingRoomPersonService: TrainingroompersonService) {
    this.createForm();
  }

  createForm() {
    this.trainingRoomPersonForm = this.fb.group({
      id: [''],
      stageTimeId: ['', Validators.required],
      trainingRoomId: ['', Validators.required],
      personId: ['', Validators.required]
    });
  }

  ngOnInit() {
    this.loadTrainingRoomPeople();
  }

  loadTrainingRoomPeople() {
    this.trainingRoomPersonService.getAll().subscribe(
      (result: TrainingRoomPerson[]) => {
        this.trainingRoomPeople = result;
      },
      (error: any) => {
        console.log(error);
      }
    );
  }

  selectTrainingRoomPerson(trainingRoomPerson: TrainingRoomPerson) {
    this.selectedTrainingRoomPerson = trainingRoomPerson;
    this.trainingRoomPersonForm.patchValue(trainingRoomPerson);
  }

  newTrainingRoomPerson() {
    this.selectedTrainingRoomPerson = new TrainingRoomPerson();
    this.selectedTrainingRoomPerson.id = -1;
    this.trainingRoomPersonForm.patchValue(this.selectedTrainingRoomPerson);
  }

  saveTrainingRoomPerson(trainingRoomPerson: TrainingRoomPerson) {
    if (this.selectedTrainingRoomPerson.id === -1) {
      trainingRoomPerson.id = 0;
      this.trainingRoomPersonService.save(trainingRoomPerson).subscribe(
        (result: any) => {
          console.log(result);
          this.selectedTrainingRoomPerson = trainingRoomPerson;
          this.loadTrainingRoomPeople();
        },
        (error: any) => {
          console.log(error);
        }
      )
    } else {
      this.trainingRoomPersonService.edit(trainingRoomPerson).subscribe(
        (result: any) => {
          console.log(result);
          this.selectedTrainingRoomPerson = result;
          this.loadTrainingRoomPeople();
        },
        (error: any) => {
          console.log(error);
        }
      )
    }
  }

  deleteTrainingRoomPerson(trainingRoomPerson: TrainingRoomPerson) {
    this.trainingRoomPersonService.delete(trainingRoomPerson.id).subscribe(
      (result: any) => {
        console.log(result);
        this.loadTrainingRoomPeople();
      },
      (error: any) => {
        console.log(error);
      }
    )
  }

  onSubmit() {
    this.saveTrainingRoomPerson(this.trainingRoomPersonForm.value);
  }

  goBack() {
    this.selectedTrainingRoomPerson = new TrainingRoomPerson();
  }

}
