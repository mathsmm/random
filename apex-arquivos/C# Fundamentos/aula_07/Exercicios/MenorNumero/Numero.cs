namespace MenorNumero
{
    public class Numero
    {
        protected double Numero1 { get; set; }
        protected double Numero2 { get; set; }
        protected double Numero3 { get; set; }

        public Numero(double numero1, double numero2, double numero3)
        {
            this.Numero1 = numero1;
            this.Numero2 = numero2;
            this.Numero3 = numero3;
        }

        private double [] ObterListaDosNumeros()
        {
            double[] listaNumeros =
            {
                this.Numero1,
                this.Numero2,
                this.Numero3
            };
            return listaNumeros;
        }

        private double ObterMenorNumero(double[] listaNumeros)
        {
            double menor = listaNumeros[0];
            for (int i = 0; i < listaNumeros.Length; i++)
            {
                if (listaNumeros[i] < menor)
                {
                    menor = listaNumeros[i];
                }
            }
            return menor;
        }

        public string ObterMensagemMenorNumero()
        {
            return $"O menor número é: {ObterMenorNumero(ObterListaDosNumeros())}";
        }
    }
}