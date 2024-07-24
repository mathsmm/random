import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { RestRoomPerson } from '../models/RestRoomPerson';

@Injectable({
  providedIn: 'root'
})
export class RestroompersonService {

  baseURL = `${environment.urlApi}RestRoomPerson`;

  constructor(private http: HttpClient) { }

  getAll() : Observable<RestRoomPerson[]> {
    return this.http.get<RestRoomPerson[]>(this.baseURL);
  }

  getByRoomId(roomId: number) : Observable<RestRoomPerson[]> {
    return this.http.get<RestRoomPerson[]>(`${this.baseURL}/roomid=${roomId}`);
  }

  getByPersonId(personId: number) : Observable<RestRoomPerson[]> {
    return this.http.get<RestRoomPerson[]>(`${this.baseURL}/personid=${personId}`);
  }

  save(restRoomPerson: RestRoomPerson) {
    return this.http.post(this.baseURL, restRoomPerson);
  }

  edit(restRoomPerson: RestRoomPerson) {
    return this.http.put(`${this.baseURL}/id=${restRoomPerson.id}`, restRoomPerson);
  }

  delete(id: number) {
    return this.http.delete(`${this.baseURL}/id=${id}`);
  }

}
