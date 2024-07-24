import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { TrainingRoom } from '../models/TrainingRoom';

@Injectable({
  providedIn: 'root'
})
export class TrainingroomService {

  baseURL = `${environment.urlApi}TrainingRoom`;

  constructor(private http: HttpClient) { }

  getAll() : Observable<TrainingRoom[]> {
    return this.http.get<TrainingRoom[]>(this.baseURL);
  }

  save(trainingRoom: TrainingRoom) {
    return this.http.post(this.baseURL, trainingRoom);
  }

  edit(trainingRoom: TrainingRoom) {
    return this.http.put(`${this.baseURL}/id=${trainingRoom.id}`, trainingRoom);
  }

  delete(id: number) {
    return this.http.delete(`${this.baseURL}/id=${id}`);
  }

}
