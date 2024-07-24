using System;

namespace aula_03
{
    class Program
    {
        static void Main(string[] args)
        {
            double n1 = 4.55;
            double n2 = 50;

            double resultadoSoma = Somar(n1, n2);
            Console.WriteLine($"Soma = {resultadoSoma}");

            double resultadoSubtracao = Subtrair(n1, n2);
            Console.WriteLine($"Subtração = {resultadoSubtracao}");

            double resultadoMultiplicacao = Multiplicar(n1, n2);
            Console.WriteLine($"Multiplicação = {resultadoMultiplicacao}");

            double resultadoDivisao = Dividir(n1, n2);
            Console.WriteLine($"Divisão = {resultadoDivisao}");
        }

        public static double Somar(double numero1, double numero2) 
        {
            return numero1 + numero2;
        }

        public static double Subtrair(double numero1, double numero2) 
        {
            return numero1 - numero2;
        }

        public static double Multiplicar(double numero1, double numero2) 
        {
            return numero1 * numero2;
        }

        public static double Dividir(double numero1, double numero2) 
        {
            return numero1 / numero2;
        }
    }
}