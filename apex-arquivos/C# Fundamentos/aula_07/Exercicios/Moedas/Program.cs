using System;

namespace Moedas
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Informe a quantidade de moedas de 1 centavo: ");
            int qtdCent1 = Convert.ToInt32(Console.ReadLine());
            Console.Write("Informe a quantidade de moedas de 5 centavos: ");
            int qtdCent5 = Convert.ToInt32(Console.ReadLine());
            Console.Write("Informe a quantidade de moedas de 10 centavos: ");
            int qtdCent10 = Convert.ToInt32(Console.ReadLine());
            Console.Write("Informe a quantidade de moedas de 25 centavos: ");
            int qtdCent25 = Convert.ToInt32(Console.ReadLine());
            Console.Write("Informe a quantidade de moedas de 50 centavos: ");
            int qtdCent50 = Convert.ToInt32(Console.ReadLine());
            Console.Write("Informe a quantidade de moedas de 1 real: ");
            int qtdReal1 = Convert.ToInt32(Console.ReadLine());

            QuantidadeMoeda objQtdMoeda = new QuantidadeMoeda(
                qtdCent1,
                qtdCent5,
                qtdCent10,
                qtdCent25,
                qtdCent50,
                qtdReal1
            );

            Console.WriteLine(objQtdMoeda.ObterMensagemDeValorTotal());
        }
    }
}
