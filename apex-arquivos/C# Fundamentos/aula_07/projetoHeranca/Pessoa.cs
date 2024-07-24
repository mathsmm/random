using System;

namespace projetoHeranca
{
    public class Pessoa
    {
        protected string Nome { get; set; }
        protected int Idade { get; set; }

        public Pessoa()
        {
            Console.WriteLine("Estou executando o construtor de Pessoa!");
        }

        protected void Exibir()
        {
            Console.WriteLine($"Nome: {this.Nome}");
            Console.WriteLine($"Idade: {this.Idade}");
        }
    }
}