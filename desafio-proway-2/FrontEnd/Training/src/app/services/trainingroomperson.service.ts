import { TrainingRoomPerson } from './../models/TrainingRoomPerson';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class TrainingroompersonService {

  baseURL = `${environment.urlApi}TrainingRoomPerson`;

  constructor(private http: HttpClient) { }

  getAll() : Observable<TrainingRoomPerson[]> {
    return this.http.get<TrainingRoomPerson[]>(this.baseURL);
  }

  getByRoomId(roomId: number) : Observable<TrainingRoomPerson[]> {
    return this.http.get<TrainingRoomPerson[]>(`${this.baseURL}/roomid=${roomId}`);
  }

  getByPersonId(personId: number) : Observable<TrainingRoomPerson[]> {
    return this.http.get<TrainingRoomPerson[]>(`${this.baseURL}/personid=${personId}`);
  }

  save(trainingRoomPerson: TrainingRoomPerson) {
    return this.http.post(this.baseURL, trainingRoomPerson);
  }

  edit(trainingRoomPerson: TrainingRoomPerson) {
    return this.http.put(`${this.baseURL}/id=${trainingRoomPerson.id}`, trainingRoomPerson);
  }

  delete(id: number) {
    return this.http.delete(`${this.baseURL}/id=${id}`);
  }

}
