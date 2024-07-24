using System;

namespace POO2.Pessoas
{
    public class Pessoa
    {
        private string Nome { get ; set; }
        private DateTime DataNascimento { get ; set; }
        private char Sexo { get ; set; }

        public Pessoa(string nome, DateTime dataNascimento, char sexo)
        {
            this.Nome = nome;
            this.DataNascimento = dataNascimento;
            this.Sexo = sexo;
        }

        public string ObterDescricao()
        {
            return $"Nome: {this.Nome} - Data de nascimento: {this.DataNascimento}";
        }

        public static void ObterDescricaoStatic()
        {
            Console.WriteLine("Você está acessando um método estático!");
        }
    }
}
