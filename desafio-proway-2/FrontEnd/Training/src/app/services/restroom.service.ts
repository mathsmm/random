import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { RestRoom } from '../models/RestRoom';

@Injectable({
  providedIn: 'root'
})
export class RestroomService {

  baseURL = `${environment.urlApi}RestRoom`;

  constructor(private http: HttpClient) { }

  getAll() : Observable<RestRoom[]> {
    return this.http.get<RestRoom[]>(this.baseURL);
  }

  save(restRoom: RestRoom) {
    return this.http.post(this.baseURL, restRoom);
  }

  edit(restRoom: RestRoom) {
    return this.http.put(`${this.baseURL}/id=${restRoom.id}`, restRoom);
  }

  delete(id: number) {
    return this.http.delete(`${this.baseURL}/id=${id}`);
  }

}
