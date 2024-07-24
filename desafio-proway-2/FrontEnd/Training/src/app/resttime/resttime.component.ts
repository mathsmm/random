import { ResttimeService } from './../services/resttime.service';
import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { RestTime } from '../models/RestTime';

@Component({
  selector: 'app-resttime',
  templateUrl: './resttime.component.html',
  styleUrls: ['./resttime.component.css']
})
export class ResttimeComponent implements OnInit {

  public restTimeTitle = 'Rest-Times';
  public selectedRestTime: RestTime = new RestTime();

  restTimeForm = new FormGroup({
    id: new FormControl(''),
    startingDateTime: new FormControl(''),
    endingDateTime: new FormControl(''),
  });

  public restTimes: RestTime[] = [];

  constructor(private fb: FormBuilder,
              private restTimeService: ResttimeService) {
    this.createForm();
  }

  createForm() {
    this.restTimeForm = this.fb.group({
      id: [''],
      startingDateTime: ['', Validators.required],
      endingDateTime: ['', Validators.required]
    });
  }

  ngOnInit() {
    this.loadRestTimes();
  }

  loadRestTimes() {
    this.restTimeService.getAll().subscribe(
      (result: RestTime[]) => {
        this.restTimes = result;
      },
      (error: any) => {
        console.log(error);
      }
    );
  }

  selectRestTime(restTime: RestTime) {
    this.selectedRestTime = restTime;
    this.restTimeForm.patchValue(restTime);
  }

  newRestTime() {
    this.selectedRestTime = new RestTime();
    this.selectedRestTime.id = -1;
    this.restTimeForm.patchValue(this.selectedRestTime);
  }

  saveRestTime(restTime: RestTime) {
    if (this.selectedRestTime.id === -1) {
      restTime.id = 0;
      this.restTimeService.save(restTime).subscribe(
        (result: any) => {
          console.log(result);
          this.selectedRestTime = restTime;
          this.loadRestTimes();
        },
        (error: any) => {
          console.log(error);
        }
      )
    } else {
      this.restTimeService.edit(restTime).subscribe(
        (result: any) => {
          console.log(result);
          this.selectedRestTime = result;
          this.loadRestTimes();
        },
        (error: any) => {
          console.log(error);
        }
      )
    }
  }

  deleteRestTime(restTime: RestTime) {
    this.restTimeService.delete(restTime.id).subscribe(
      (result: any) => {
        console.log(result);
        this.loadRestTimes();
      },
      (error: any) => {
        console.log(error);
      }
    )
  }

  onSubmit() {
    this.saveRestTime(this.restTimeForm.value);
  }

  goBack() {
    this.selectedRestTime = new RestTime();
  }

}
