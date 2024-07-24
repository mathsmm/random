import { RestroompersonService } from './../services/restroomperson.service';
import { RestRoomPerson } from './../models/RestRoomPerson';
import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-restroomperson',
  templateUrl: './restroomperson.component.html',
  styleUrls: ['./restroomperson.component.css']
})
export class RestroompersonComponent implements OnInit {

  public restRoomPersonTitle = 'Rest-Room-People';
  public selectedRestRoomPerson: RestRoomPerson = new RestRoomPerson();

  restRoomPersonForm = new FormGroup({
    id: new FormControl(''),
    restTimeId: new FormControl(''),
    restRoomId: new FormControl(''),
    personId: new FormControl('')
  });

  public restRoomPeople: RestRoomPerson[] = [];

  constructor(private fb: FormBuilder,
              private restRoomPersonService: RestroompersonService) {
    this.createForm();
  }

  createForm() {
    this.restRoomPersonForm = this.fb.group({
      id: [''],
      restTimeId: ['', Validators.required],
      restRoomId: ['', Validators.required],
      personId: ['', Validators.required]
    });
  }

  ngOnInit() {
    this.loadRestRoomPeople();
  }

  loadRestRoomPeople() {
    this.restRoomPersonService.getAll().subscribe(
      (result: RestRoomPerson[]) => {
        this.restRoomPeople = result;
      },
      (error: any) => {
        console.log(error);
      }
    );
  }

  selectRestRoomPerson(restRoomPerson: RestRoomPerson) {
    this.selectedRestRoomPerson = restRoomPerson;
    this.restRoomPersonForm.patchValue(restRoomPerson);
  }

  newRestRoomPerson() {
    this.selectedRestRoomPerson = new RestRoomPerson();
    this.selectedRestRoomPerson.id = -1;
    this.restRoomPersonForm.patchValue(this.selectedRestRoomPerson);
  }

  saveRestRoomPerson(restRoomPerson: RestRoomPerson) {
    if (this.selectedRestRoomPerson.id === -1) {
      restRoomPerson.id = 0;
      this.restRoomPersonService.save(restRoomPerson).subscribe(
        (result: any) => {
          console.log(result);
          this.selectedRestRoomPerson = new RestRoomPerson();
          this.loadRestRoomPeople();
        },
        (error: any) => {
          console.log(error);
        }
      )
    } else {
      this.restRoomPersonService.edit(restRoomPerson).subscribe(
        (result: any) => {
          console.log(result);
          this.selectedRestRoomPerson = result;
          this.loadRestRoomPeople();
        },
        (error: any) => {
          console.log(error);
        }
      )
    }
  }

  deleteRestRoomPerson(restRoomPerson: RestRoomPerson) {
    this.restRoomPersonService.delete(restRoomPerson.id).subscribe(
      (result: any) => {
        console.log(result);
        this.loadRestRoomPeople();
      },
      (error: any) => {
        console.log(error);
      }
    )
  }

  onSubmit() {
    this.saveRestRoomPerson(this.restRoomPersonForm.value);
  }

  goBack() {
    this.selectedRestRoomPerson = new RestRoomPerson();
  }

}
