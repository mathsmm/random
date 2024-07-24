namespace projetoClienteProduto
{
    public class Produto
    {
        private string Descricao { get; set; }
        private double Valor { get; set; }
        private double Quantidade { get; set; }
        private Cliente Cliente { get; set; }

        public Produto(string descricao, double valor, double quantidade, Cliente cliente)
        {
            this.Descricao = descricao;
            this.Valor = valor;
            this.Quantidade = quantidade;
            this.Cliente = cliente;
        }

        private double CalcularValorTotal()
        {
            return this.Valor * this.Quantidade;
        }

        public string ObterMensagem()
        {
            return $"O Cliente {this.Cliente.Apresentacao()} comprou {this.Quantidade} produtos " + 
            $"com a descrição {this.Descricao}, e o valor total foi de R$ {CalcularValorTotal()} !";
        }
    }
}