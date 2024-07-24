namespace projetoClienteProduto
{
    public class Cliente
    {
        private string Nome { get; set; }
        private int Idade { get; set; }

        public Cliente(string nome, int idade)
        {
            this.Nome = nome;
            this.Idade = idade;
        }

        public string Apresentacao()
        {
            return $"{this.Nome} com a idade de {this.Idade}";
        }
    }
}