import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { RestTime } from '../models/RestTime';

@Injectable({
  providedIn: 'root'
})
export class ResttimeService {

  baseURL = `${environment.urlApi}RestTime`;

  constructor(private http: HttpClient) { }

  getAll() : Observable<RestTime[]> {
    return this.http.get<RestTime[]>(this.baseURL);
  }

  save(restTime: RestTime) {
    return this.http.post(this.baseURL, restTime);
  }

  edit(restTime: RestTime) {
    return this.http.put(`${this.baseURL}/id=${restTime.id}`, restTime);
  }

  delete(id: number) {
    return this.http.delete(`${this.baseURL}/id=${id}`);
  }

}
