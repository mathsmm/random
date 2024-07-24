namespace projetoPolimorfismo
{
    public class Gerente : CalculoSalarioCargo
    {
        private double Salario { get; set; }

        public Gerente(double salario)
        {
            this.Salario = salario;
        }

        private double CalcularSalarioLiquido()
        {
            double valorIR = this.CalcularImpostoDeRenda(this.Salario);
            double valorVT = this.CalcularValeTransporte(this.Salario);
            return this.Salario - (valorIR + valorVT);
        }

        // Polimorfismo:
        private double CalcularImpostoDeRenda(double salario)
        {
            return salario * 0.10;
        }
        // Para o polimorfismo funcionar, a função deve ter o mesmo nome,
        // mesma quantidade de parâmetros e mesmos tipos de parâmetros.

        public string ObterSalario()
        {
            return $"Gerente, salário: {this.CalcularSalarioLiquido()}";
        }
    }
}