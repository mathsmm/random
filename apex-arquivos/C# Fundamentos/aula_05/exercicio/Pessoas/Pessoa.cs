namespace exercicio.Pessoas
{
    public class Pessoa
    {
        private string Nome { get ; set; }
        private int Idade { get ; set; }

        public Pessoa(string nome, int idade)
        {
            this.Nome = nome;
            this.Idade = idade;
        }

        public string ObterDescricao()
        {
            return $"Nome: {this.Nome} - Idade: {this.Idade}";
        }
    }
}