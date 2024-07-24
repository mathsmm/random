import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { StageTime } from '../models/StageTime';

@Injectable({
  providedIn: 'root'
})
export class StagetimeService {

  baseURL = `${environment.urlApi}StageTime`;

  constructor(private http: HttpClient) { }

  getAll() : Observable<StageTime[]> {
    return this.http.get<StageTime[]>(this.baseURL);
  }

  save(stageTime: StageTime) {
    return this.http.post(this.baseURL, stageTime);
  }

  edit(stageTime: StageTime) {
    return this.http.put(`${this.baseURL}/id=${stageTime.id}`, stageTime);
  }

  delete(id: number) {
    return this.http.delete(`${this.baseURL}/id=${id}`);
  }

}
