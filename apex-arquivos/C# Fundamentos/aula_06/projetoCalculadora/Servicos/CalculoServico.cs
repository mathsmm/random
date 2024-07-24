namespace projetoCalculadora.Servicos
{
    public class CalculoServico
    {
        private double Numero1 { get; set; }
        private double Numero2 { get; set; }

        public CalculoServico(double numero1, double numero2)
        {
            this.Numero1 = numero1;
            this.Numero2 = numero2;
        }

        public double Somar()
        {
            return this.Numero1 + this.Numero2;
        }

        public double Subtrair()
        {
            return this.Numero1 - this.Numero2;
        }

        public double Multiplicar()
        {
            return this.Numero1 * this.Numero2;
        }

        public double Dividir()
        {
            return this.Numero1 / this.Numero2;
        }
    }
}