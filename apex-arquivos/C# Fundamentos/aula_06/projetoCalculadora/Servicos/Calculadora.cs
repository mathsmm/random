using projetoCalculadora.Servicos;

namespace projetoCalculadora.Servicos
{
    public class Calculadora
    {
        private double Numero1 { get; set; }
        private double Numero2 { get; set; }
        private string Operacao { get; set; }

        public Calculadora(double numero1, double numero2, string operacao)
        {
            this.Numero1 = numero1;
            this.Numero2 = numero2;
            this.Operacao = operacao;
        }

        public double EfetuarCalculo()
        {
            CalculoServico objCalculo = new CalculoServico(this.Numero1, this.Numero2);
            // double resultado = 0;
            switch (this.Operacao)
            {
                // case "+": resultado = objCalculo.Somar(); break;
                // case "-": resultado = objCalculo.Subtrair(); break;
                // case "*": resultado = objCalculo.Multiplicar(); break;
                // case "/": resultado = objCalculo.Dividir(); break;
                // default: break;
                // OU:
                case "+": return objCalculo.Somar();
                case "-": return objCalculo.Subtrair();
                case "*": return objCalculo.Multiplicar();
                case "/": return objCalculo.Dividir();
                default: return 0;
            }
            // return resultado;
        }
    }
}