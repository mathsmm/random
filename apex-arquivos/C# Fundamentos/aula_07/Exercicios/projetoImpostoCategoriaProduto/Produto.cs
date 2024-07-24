namespace projetoImpostoCategoriaProduto
{
    public class Produto
    {
        private string Nome { get; set; }
        private string Categoria { get; set; }
        private double Valor { get; set; }

        public Produto(string nome, string categoria, double valor)
        {
            this.Nome = nome;
            this.Categoria = categoria;
            this.Valor = valor;
        }

        public double CalcularImpostoPorCategoria()
        {
            if (this.Categoria == "Eletrônico")
            {
                return this.Valor * 0.20;
            }
            else if (this.Categoria == "Vestuário")
            {
                return this.Valor * 0.10;
            }
            else
            {
                return this.Valor * 0.05;
            }
        }

        public double CalcularValorTotalComImposto(double imposto)
        {
            return this.Valor + imposto;
        }

        public string ObterMensagemDoProduto()
        {
            double valorImposto = CalcularImpostoPorCategoria();
            double valorTotalComImpostos = CalcularValorTotalComImposto(valorImposto);
            // Criei variáveis para chamar as funções somente uma vez
            return 
                $"O produto {this.Nome} terá um imposto de R$ {valorImposto}.\n" + 
                $"Valor do produto com os impostos: R$ {valorTotalComImpostos}";
        }
    }
}