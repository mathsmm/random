using System;

namespace MenorNumero
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Informe o primeiro número: ");
            double num1 = Convert.ToDouble(Console.ReadLine());
            Console.Write("Informe o segundo número: ");
            double num2 = Convert.ToDouble(Console.ReadLine());
            Console.Write("Informe o terceiro número: ");
            double num3 = Convert.ToDouble(Console.ReadLine());

            Numero objNumero = new Numero(num1, num2, num3);
            Console.WriteLine(objNumero.ObterMensagemMenorNumero());
        }
    }
}
