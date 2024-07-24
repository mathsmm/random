import { DialogService } from './../services/dialog.service';
import { Disciplina } from './../models/Disciplina';
import { ProfessorService } from './../services/professor.service';
import { DisciplinaService } from './../services/disciplina.service';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { Component, OnInit } from '@angular/core';
import { Professor } from '../models/Professor';

@Component({
  selector: 'app-disciplina',
  templateUrl: './disciplina.component.html',
  styleUrls: ['./disciplina.component.css']
})
export class DisciplinaComponent implements OnInit {

  public titulo = 'Disciplinas';
  public disciplinaSelected = new Disciplina();
  public disciplinas: Disciplina[] = [];
  public professores: Professor[] = [];
  public disciplinaForm = new FormGroup({
    id: new FormControl(''),
    nome: new FormControl(''),
    professorId: new FormControl('')
  });

  constructor(private fb: FormBuilder,
              private disciplinaServico: DisciplinaService,
              private professorServico: ProfessorService,
              private dialogoServico: DialogService) {
    this.criarForm();
  }

  ngOnInit(): void {
    this.carregarDisciplinas();
    this.carregarProfessores();
  }

  criarForm() {
    this.disciplinaForm = this.fb.group({
      id: [''],
      nome: ['', Validators.required],
      professorId: ['', Validators.required]
    });
  }

  carregarDisciplinas() {
    this.disciplinaServico.obterTodos().subscribe(
      (resultado: Disciplina[]) => {
        this.disciplinas = resultado;
      },
      (erro: any) => {
        console.log(erro);
      }
    );
  }

  carregarProfessores() {
    this.professorServico.obterTodos().subscribe(
      (resultado: Professor[]) => {
        this.professores = resultado;
      },
      (erro: any) => {
        console.log(erro);
      }
    )
  }

  disciplinaSelect(disciplina: Disciplina) {
    this.disciplinaSelected = disciplina;
    this.disciplinaForm.patchValue(disciplina);
  }

  novaDisciplina() {
    this.disciplinaSelected = new Disciplina();
    this.disciplinaSelected.id = -1;
    this.disciplinaForm.patchValue(this.disciplinaSelected);
  }

  salvarDisciplina(disciplina: Disciplina) {
    if (this.disciplinaSelected.id === -1) {
      disciplina.id = 0;
      this.disciplinaServico.salvar(disciplina).subscribe(
        (resultado: any) => {
          console.log(resultado);
          this.disciplinaSelected = resultado;
          this.carregarDisciplinas();
        },
        (erro: any) => {
          console.log(erro);
        }
      )
    } else {
      this.disciplinaServico.editar(disciplina).subscribe(
        (resultado: any) => {
          console.log(resultado);
          this.disciplinaSelected = resultado;
          this.carregarDisciplinas();
        },
        (erro: any) => {
          console.log(erro);
        }
      )
    }
  }

  public abrirDialogoDeConfirmacao(disciplina: Disciplina) {
    this.dialogoServico.confirmar(
      'Excluir - disciplina', 
      'Tens certeza que queres excluir?',
      'Ok',
      'Cancelar',
      'sm'
    )
    .then(
      (confirmou) => this.excluirDisciplina(disciplina, confirmou)
    )
    .catch(
      (erro: any) => console.log(erro)
    );
  }

  excluirDisciplina(disciplina: Disciplina, confirmado: boolean) {
    if (confirmado) {
      this.disciplinaServico.deletar(disciplina.id).subscribe(
        (retorno: any) => {
          console.log(retorno);
          this.carregarDisciplinas();
        },
        (erro: any) => {
          console.log(erro);
        }
      );
    }
  }

  onSubmit() {
    this.salvarDisciplina(this.disciplinaForm.value);
  }

  voltar() {
    this.disciplinaSelected = new Disciplina();
  }

}
