using System;

namespace exercicios_web
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Informe o valor da compra, em reais: ");
            double valorCompra = Convert.ToDouble(Console.ReadLine());

            double valorParcela = valorCompra / 5;

            Console.WriteLine($"5 parcelas de {valorParcela} reais.");
        }
    }
}