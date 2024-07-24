import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { Disciplina } from '../models/Disciplina';

@Injectable({
  providedIn: 'root'
})
export class DisciplinaService {

  urlBase = `${environment.urlApi}disciplina`;

  constructor(private http: HttpClient) { }

  obterTodos(): Observable<Disciplina[]>{
    return this.http.get<Disciplina[]>(this.urlBase);
  }

  salvar(disciplina: Disciplina) {
    return this.http.post(this.urlBase, disciplina);
  }

  deletar(id: number) {
    return this.http.delete(`${this.urlBase}/disciplinaid=${id}`);
  }

  editar(disciplina: Disciplina) {
    return this.http.put(`${this.urlBase}/disciplinaid=${disciplina.id}`, disciplina);
  }

}
