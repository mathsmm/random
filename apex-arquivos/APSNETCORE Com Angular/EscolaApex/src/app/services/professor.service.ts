import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { Professor } from '../models/Professor';

@Injectable({
  providedIn: 'root'
})
export class ProfessorService {

  urlBase = `${environment.urlApi}professor`;

  constructor(private http: HttpClient) { }

  obterTodos() : Observable<Professor[]> {
    return this.http.get<Professor[]>(this.urlBase);
  }

  salvar(professor: Professor) {
    return this.http.post(this.urlBase, professor);
  }

  deletar(id: number) {
    return this.http.delete(`${this.urlBase}/professorid=${id}`);
  }

  editar(professor: Professor) {
    return this.http.put(`${this.urlBase}/professorid=${professor.id}`, professor);
  }
}
