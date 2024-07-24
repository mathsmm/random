import { ProfessorService } from './../services/professor.service';
import { Professor } from './../models/Professor';
import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-professores',
  templateUrl: './professores.component.html',
  styleUrls: ['./professores.component.scss']
})
export class ProfessoresComponent implements OnInit {

  public tituloProfessor = 'Professores';
  public profSelected: Professor = new Professor();

  profForm = new FormGroup({
    id: new FormControl(''),
    nome: new FormControl(''),
    disciplina: new FormControl('')
  });

  public professores: Professor[] = [];

  constructor(private fb: FormBuilder,
              private professorServico: ProfessorService) {
    this.createForm();
  }

  createForm() {
    this.profForm = this.fb.group({
      id: [''],
      nome: ['', Validators.required]
    })
  }

  ngOnInit(): void {
    this.carregarProfessores();
  }

  carregarProfessores() {
    this.professorServico.obterTodos().subscribe(
      (resultado: Professor[]) => {
        this.professores = resultado;
      },
      (erro: any) => {
        console.log(erro);
      }
    );
  }

  profSelect(prof: Professor) {
    this.profSelected = prof;
    this.profForm.patchValue(prof);
  }

  novoProfessor() {
    this.profSelected = new Professor();
    this.profSelected.id = -1;
    this.profForm.patchValue(this.profSelected);
  }

  salvarProfessor(professor: Professor) {
    if (this.profSelected.id === -1) {
      professor.id = 0;
      this.professorServico.salvar(professor).subscribe(
        (resultado: any) => {
          console.log(resultado);
          this.profSelected = resultado;
          this.profForm.patchValue(resultado);
          this.carregarProfessores();
        },
        (erro: any) => {
          console.log(erro);
        }
      )
    } else {
      this.professorServico.editar(professor).subscribe(
        (resultado: any) => {
          console.log(resultado);
          this.profSelected = resultado;
          this.carregarProfessores();
        },
        (erro: any) => {
          console.log(erro);
        }
      )
    }
  }

  excluirProfessor(professor: Professor) {
    this.professorServico.deletar(professor.id).subscribe(
      (retorno: any) => {
        console.log(retorno);
        this.carregarProfessores();
      },
      (erro: any) => {
        console.log(erro);
      }
    )
  }

  onSubmit() {
    this.salvarProfessor(this.profForm.value);
  }

  voltar() {
    this.profSelected = new Professor();
  }

}
