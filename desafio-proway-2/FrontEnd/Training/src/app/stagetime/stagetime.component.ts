import { StagetimeService } from './../services/stagetime.service';
import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { StageTime } from '../models/StageTime';

@Component({
  selector: 'app-stagetime',
  templateUrl: './stagetime.component.html',
  styleUrls: ['./stagetime.component.css']
})
export class StagetimeComponent implements OnInit {

  public stageTimeTitle = 'Stage-Times';
  public selectedStageTimes: StageTime = new StageTime();

  stageTimeForm = new FormGroup({
    id: new FormControl(''),
    startingDateTime: new FormControl(''),
    endingDateTime: new FormControl(''),
  });

  public stageTimes: StageTime[] = [];

  constructor(private fb: FormBuilder,
              private stageTimeService: StagetimeService) {
    this.createForm();
  }

  createForm() {
    this.stageTimeForm = this.fb.group({
      id: [''],
      startingDateTime: ['', Validators.required],
      endingDateTime: ['', Validators.required]
    });
  }

  ngOnInit() {
    this.loadStageTimes();
  }

  loadStageTimes() {
    this.stageTimeService.getAll().subscribe(
      (result: StageTime[]) => {
        this.stageTimes = result;
      },
      (error: any) => {
        console.log(error);
      }
    );
  }

  selectStageTime(stageTime: StageTime) {
    this.selectedStageTimes = stageTime;
    this.stageTimeForm.patchValue(stageTime);
  }

  newStageTime() {
    this.selectedStageTimes = new StageTime();
    this.selectedStageTimes.id = -1;
    this.stageTimeForm.patchValue(this.selectedStageTimes);
  }

  saveStageTime(stageTime: StageTime) {
    if (this.selectedStageTimes.id === -1) {
      stageTime.id = 0;
      this.stageTimeService.save(stageTime).subscribe(
        (result: any) => {
          console.log(result);
          this.selectedStageTimes = stageTime;
          this.loadStageTimes();
        },
        (error: any) => {
          console.log(error);
        }
      )
    } else {
      this.stageTimeService.edit(stageTime).subscribe(
        (result: any) => {
          console.log(result);
          this.selectedStageTimes = result;
          this.loadStageTimes();
        },
        (error: any) => {
          console.log(error);
        }
      )
    }
  }

  deleteStageTime(stageTime: StageTime) {
    this.stageTimeService.delete(stageTime.id).subscribe(
      (result: any) => {
        console.log(result);
        this.loadStageTimes();
      },
      (error: any) => {
        console.log(error);
      }
    )
  }

  onSubmit() {
    this.saveStageTime(this.stageTimeForm.value);
  }

  goBack() {
    this.selectedStageTimes = new StageTime();
  }

}
