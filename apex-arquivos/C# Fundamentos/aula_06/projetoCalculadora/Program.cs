using System;
using projetoCalculadora.Servicos;

namespace projetoCalculadora
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Informe o primeiro número: ");
            double num1 = Convert.ToDouble(Console.ReadLine());

            Console.Write("Informe o segundo número: ");
            double num2 = Convert.ToDouble(Console.ReadLine());

            Console.Write("Informe a operação (+, -, *, /): ");
            string operacao = Console.ReadLine();

            Calculadora objCalculadora = new Calculadora(num1, num2, operacao);

            Console.WriteLine($"O resultado é: {objCalculadora.EfetuarCalculo()}");
        }
    }
}
