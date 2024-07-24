namespace projetoDescontoLoja
{
    public class Loja
    {
        private string Produto { get; set; }
        private string FormaPagamento { get; set; }
        private double Valor { get; set; }

        public Loja(string produto, string formaPagamento, double valor)
        {
            this.Produto = produto;
            this.FormaPagamento = formaPagamento;
            this.Valor = valor;
        }

        public double CalcularDesconto()
        {
            if (this.Valor > 100 && this.FormaPagamento == "A vista")
            {
                return this.Valor * 0.10;
            }
            else if (this.Valor > 200)
            {
                return this.Valor * 0.15;
            }
            else if (this.Valor <= 100)
            {
                return this.Valor * 0.05;
            }
            else
            {
                return 0;
            }
        }

        public string ObterMensagemDesconto()
        {
            double desconto = CalcularDesconto();
            double total = this.Valor - desconto;
            return $"O produto {this.Produto} terá um desconto de {desconto} e o total será de {total}";
        }
    }
}