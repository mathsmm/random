namespace projetoDB.Pessoa
{
    public class PessoaModelo
    {
        public PessoaModelo(int id, string nome, string cpf)
        {
            this.Id = id;
            this.Nome = nome;
            this.Cpf = cpf;
        }
        public int Id { get; set; }
        public string Nome { get; set; }
        public string Cpf { get; set; }
    }
}