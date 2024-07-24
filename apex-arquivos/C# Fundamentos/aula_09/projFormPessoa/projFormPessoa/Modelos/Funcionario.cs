using System;
using System.Collections.Generic;
using System.Text;

namespace projFormPessoa.Modelos
{
    class Funcionario
    {
        public int Id { get; set; }
        public string Nome { get; set; }
        public string Cpf { get; set; }
        public string DataNascimento { get; set; }

        public Funcionario(int id, string nome, string cpf, string dataNascimento)
        {
            this.Id = id;
            this.Nome = nome;
            this.Cpf = cpf;
            this.DataNascimento = dataNascimento;
        }

        public Funcionario(string nome, string cpf, string dataNascimento)
        {
            this.Nome = nome;
            this.Cpf = cpf;
            this.DataNascimento = dataNascimento;
        }
    }
}
