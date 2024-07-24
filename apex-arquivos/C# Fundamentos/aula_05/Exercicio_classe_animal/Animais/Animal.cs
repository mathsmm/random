namespace Exercicio_classe_animal.Animais
{
    public class Animal
    {
        private string Nome { get; set; }
        private int Idade { get; set; }
        private string Tipo { get; set; }

        public Animal(string nome, int idade, string tipo)
        {
            this.Nome = nome;
            this.Idade = idade;
            this.Tipo = tipo;
        }

        public string ObterMensagemDeDescricao()
        {
            return $"O animal {this.Tipo} tem o nome {this.Nome} e {this.Idade} anos de idade.";
        }
    }
}