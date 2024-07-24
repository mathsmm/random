import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { Person } from '../models/Person';

@Injectable({
  providedIn: 'root'
})
export class PersonService {

  baseURL = `${environment.urlApi}person`;

  constructor(private http: HttpClient) { }

  getAll() : Observable<Person[]> {
    return this.http.get<Person[]>(this.baseURL);
  }

  save(person: Person) {
    return this.http.post(this.baseURL, person);
  }

  edit(person: Person) {
    return this.http.put(`${this.baseURL}/id=${person.id}`, person);
  }

  delete(id: number) {
    return this.http.delete(`${this.baseURL}/id=${id}`);
  }

}
