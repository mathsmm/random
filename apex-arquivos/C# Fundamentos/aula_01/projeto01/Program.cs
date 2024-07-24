// Importar biblioteca
using System;

// Local onde está a nossa classe no projeto
// Diretório onde está localizada a nossa classe
namespace projeto01
{
    // Início do nosso sistema
    class Program
    {
        // Responsável por executar o nosso programa
        static void Main(string[] args)
        {
            /*
            WriteLine = Escreve e coloca o cursor na nova linha
            Write     = Escreve e mantém o cursor após o texto
            */
            Console.WriteLine("Hello World!");

            /*
            ReadLine  = Executa uma ação após apertar Enter
            ReadKey   = Executa uma ação enquanto estiver digitando
            Read      = Percorre cada caractere
            */

            Console.Write("Como é seu nome: ");

            string nome = Console.ReadLine();

            Console.WriteLine("Olá, " + nome);
        }
    }
}
