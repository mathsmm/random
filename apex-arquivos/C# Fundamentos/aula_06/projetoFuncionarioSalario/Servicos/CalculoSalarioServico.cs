using System;

namespace projetoFuncionarioSalario.Servicos
{
    public class CalculoSalarioServico
    {
        // Propriedades da classe CalculoSalarioServico:
        private double Salario { get; set; }
        private int QuantidadeDeFaltas { get; set; }

        // Construtor:
        public CalculoSalarioServico(double salario, int quantidadeDeFaltas)
        {
            this.Salario = salario;
            this.QuantidadeDeFaltas = quantidadeDeFaltas;
        }

        // Funções:
        private double ObterValorValeTransporte()
        {
            return this.Salario * 0.06;
        }

        private double ObterValorImpostoDeRenda()
        {
            if (this.Salario <= 1500)
            {
                return this.Salario * 0.05;
            }
            return this.Salario * 0.10;
        }

        private double ObterValorPremioPorFalta()
        {
            return this.QuantidadeDeFaltas == 0 ? 100 : 0;
        }

        private double ObterSalarioLiquido(
            double valorValeTransporte,
            double valorImpostoRenda,
            double valorPremioPorFalta
        )
        {
            return this.Salario + valorPremioPorFalta - valorImpostoRenda - valorValeTransporte;
        }

        public string ObterDemonstrativo()
        {
            double valorVT = Math.Round(ObterValorValeTransporte(), 2);
            double valorIR = Math.Round(ObterValorImpostoDeRenda(), 2);
            double valorPF = Math.Round(ObterValorPremioPorFalta(), 2);
            double liquido = Math.Round(ObterSalarioLiquido(valorVT, valorIR, valorPF), 2);

            return $"Valor Imposto de Renda: R${valorIR}\n" + 
                   $"Valor Vale Transporte: R${valorVT}\n" + 
                   $"Valor Prêmio por Falta: R${valorPF}\n" + 
                   $"Salário líquido: R${liquido}\n";
        }
    }
}