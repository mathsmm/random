using System;

namespace exercicio_console_calculadora
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Digite o primeiro número: ");
            double n1 = Convert.ToDouble(Console.ReadLine());

            Console.WriteLine("Digite o segundo número: ");
            double n2 = Convert.ToDouble(Console.ReadLine());

            Console.WriteLine("Digite a operação ((+ Adição)--(- Subtração)--(* Multiplicação)--(/ Divisão)): ");
            string operacao = Console.ReadLine();

            string mensagemRetorno = null;

            switch(operacao)
            {
                case "+": mensagemRetorno = "O resultado é: " + (n1 + n2); break;
                case "-": mensagemRetorno = "O resultado é: " + (n1 - n2); break;
                case "*": mensagemRetorno = "O resultado é: " + (n1 * n2); break;
                case "/": mensagemRetorno = "O resultado é: " + (n1 / n2); break;
                default:  mensagemRetorno = "Operação inválida";           break;
            }

            Console.WriteLine(mensagemRetorno);
        }
    }
}