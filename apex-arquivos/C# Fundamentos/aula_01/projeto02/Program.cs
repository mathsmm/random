using System;

namespace projeto02
{
    class Program
    {
        static void Main(string[] args)
        {
            // Obter uma idade
            Console.WriteLine("Informe a sua idade: ");

            int idade = Convert.ToInt32(Console.ReadLine());
            /*
                Como o ReadLine retorna uma string, usa-se 
                o Convert. para converter a string ao tipo
                da variável, no caso int.
            */

            // Verificar se é maior ou menor de idade
            // Condicional

            if (idade >= 18)
            {
                Console.WriteLine("Maior de idade");
            }
            else
            {
                Console.WriteLine("Menor de idade");
            }

            /*
            OU:
            string mensagemIdade = idade >= 18 ? "Maior de idade" : "Menor de idade";
            Console.WriteLine(mensagemIdade);
            (if ternário)
            */
        }
    }
}
