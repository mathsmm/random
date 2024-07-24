using System;

namespace projeto04
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Informe um valor: ");
            double valor = Convert.ToDouble(Console.ReadLine());
            double valorDesconto = valor * 0.15;
            double valorComDesconto = valor - valorDesconto;

            Console.WriteLine("Valor com 15% de desconto: " + valorComDesconto);
        }
    }
}
