namespace Moedas
{
    public class QuantidadeMoeda
    {
        private int QtdMoeda1Centavo { get; set; }
        private int QtdMoeda5Centavos { get; set; }
        private int QtdMoeda10Centavos { get; set; }
        private int QtdMoeda25Centavos { get; set; }
        private int QtdMoeda50Centavos { get; set; }
        private int QtdMoeda1Real { get; set; }

        public QuantidadeMoeda(int qtdMoeda1Centavo, int qtdMoeda5Centavos, int qtdMoeda10Centavos, int qtdMoeda25Centavos, int qtdMoeda50Centavos, int qtdMoeda1Real)
        {
            this.QtdMoeda1Centavo = qtdMoeda1Centavo;
            this.QtdMoeda5Centavos = qtdMoeda5Centavos;
            this.QtdMoeda10Centavos = qtdMoeda10Centavos;
            this.QtdMoeda25Centavos = qtdMoeda25Centavos;
            this.QtdMoeda50Centavos = qtdMoeda50Centavos;
            this.QtdMoeda1Real = qtdMoeda1Real;
        }

        private double ObterValorTotalDeMoedas()
        {
            return
                this.QtdMoeda1Centavo * 0.01 +
                this.QtdMoeda5Centavos * 0.05 +
                this.QtdMoeda10Centavos * 0.10 +
                this.QtdMoeda25Centavos * 0.25 +
                this.QtdMoeda50Centavos * 0.50 +
                this.QtdMoeda1Real * 1;
        }

        public string ObterMensagemDeValorTotal()
        {
            return $"O valor total de moedas é: R$ {ObterValorTotalDeMoedas()}";
        }
    }
}