import { RestRoomPerson } from './../models/RestRoomPerson';
import { TrainingRoomPerson } from './../models/TrainingRoomPerson';
import { RestroompersonService } from './../services/restroomperson.service';
import { TrainingroompersonService } from './../services/trainingroomperson.service';
import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { Person } from '../models/Person';
import { PersonService } from '../services/person.service';

@Component({
  selector: 'app-person',
  templateUrl: './person.component.html',
  styleUrls: ['./person.component.css']
})
export class PersonComponent implements OnInit {

  public personTitle = 'People';
  public selectedPerson: Person = new Person();

  personForm = new FormGroup({
    id: new FormControl(''),
    name: new FormControl(''),
    surname: new FormControl('')
  });

  public people: Person[] = [];
  public trainingRoomPeople: TrainingRoomPerson[] = [];
  public restRoomPeople: RestRoomPerson[] = [];

  constructor(private fb: FormBuilder,
              private personService: PersonService,
              private trainingRoomPersonService: TrainingroompersonService,
              private restRoomPersonService: RestroompersonService) {
    this.createForm();
  }

  getTRPeople(personId: number) {
    this.trainingRoomPersonService.getByPersonId(personId).subscribe(
      (result: TrainingRoomPerson[]) => {
        this.trainingRoomPeople = result;
      },
      (error: any) => {
        console.log(error);
      }
    );
  }

  getRRPeople(personId: number) {
    this.restRoomPersonService.getByPersonId(personId).subscribe(
      (result: RestRoomPerson[]) => {
        this.restRoomPeople = result;
      },
      (error: any) => {
        console.log(error);
      }
    );
  }

  createForm() {
    this.personForm = this.fb.group({
      id: [''],
      name: ['', Validators.required],
      surname: ['', Validators.required]
    });
  }

  ngOnInit() {
    this.loadPeople();
  }

  loadPeople() {
    this.personService.getAll().subscribe(
      (result: Person[]) => {
        this.people = result;
      },
      (error: any) => {
        console.log(error);
      }
    );
  }

  selectPerson(person: Person) {
    this.selectedPerson = person;
    this.personForm.patchValue(person);
    this.getTRPeople(person.id);
    this.getRRPeople(person.id);
  }

  newPerson() {
    this.selectedPerson = new Person();
    this.selectedPerson.id = -1;
    this.personForm.patchValue(this.selectedPerson);
  }

  savePerson(person: Person) {
    if (this.selectedPerson.id === -1) {
      person.id = 0;
      this.personService.save(person).subscribe(
        (result: any) => {
          console.log(result);
          this.selectedPerson = result;
          this.loadPeople();
        },
        (error: any) => {
          console.log(error);
        }
      )
    } else {
      this.personService.edit(person).subscribe(
        (result: any) => {
          console.log(result);
          this.selectedPerson = result;
          this.loadPeople();
        },
        (error: any) => {
          console.log(error);
        }
      )
    }
  }

  deletePerson(person: Person) {
    this.personService.delete(person.id).subscribe(
      (result: any) => {
        console.log(result);
        this.loadPeople();
      },
      (error: any) => {
        console.log(error);
      }
    )
  }

  onSubmit() {
    this.savePerson(this.personForm.value);
  }

  goBack() {
    this.selectedPerson = new Person();
  }

}
