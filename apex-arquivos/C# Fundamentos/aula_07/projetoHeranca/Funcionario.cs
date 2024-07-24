using System;

namespace projetoHeranca
{
    public class Funcionario : Pessoa
    // -> ":" faz com que a classe Funcionario herde a classe Pessoa
    {
        public string Cargo { get; set; }
        public double Salario { get; set; }

        public Funcionario(string nome, int idade, string cargo, double salario) : base()
        {
            // Atribuindo valores para a classe Pessoa:
            this.Nome = nome;
            this.Idade = idade;
            // Atribuindo valores para a classe Funcionario:
            this.Cargo = cargo;
            this.Salario = salario;

            this.Exibir();
            this.Apresentacao();
        }

        private void Apresentacao()
        {
            Console.WriteLine($"Cargo: {this.Cargo}");
            Console.WriteLine($"Salário: {this.Salario}");
        }
    }
}