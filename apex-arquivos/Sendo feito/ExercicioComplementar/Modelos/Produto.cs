namespace ExercicioComplementar.Modelos
{
    public class Produto
    {
        public int Id { get; set; }
        public string Descricao { get; set; }
        public double Valor { get; set; }
        public int IdCliente { get; set; }

        public Produto(int id, string descricao, double valor, int idCliente)
        {
            this.Id = id;
            this.Descricao = descricao;
            this.Valor = valor;
            this.IdCliente = idCliente;
        }
    }
}