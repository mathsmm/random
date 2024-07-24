namespace projetoPolimorfismo
{
    public class Atendente : CalculoSalarioCargo
    {
        private double Salario { get; set; }

        public Atendente(double salario)
        {
            this.Salario = salario;
        }

        private double CalcularSalarioLiquido()
        {
            double valorIR = this.CalcularImpostoDeRenda(this.Salario);
            double valorVT = this.CalcularValeTransporte(this.Salario);
            return this.Salario - (valorIR + valorVT);
        }

        public string ObterSalario()
        {
            return $"Atendente, salário: {this.CalcularSalarioLiquido()}";
        }
    }
}