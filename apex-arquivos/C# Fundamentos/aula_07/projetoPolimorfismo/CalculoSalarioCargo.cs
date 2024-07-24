namespace projetoPolimorfismo
{
    public class CalculoSalarioCargo
    {
        protected double CalcularValeTransporte(double salario)
        {
            return salario * 0.06;
        }

        protected double CalcularImpostoDeRenda(double salario)
        {
            return salario * 0.05;
        }
    }
}