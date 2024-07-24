using System;

namespace projeto01
{
    class Program
    {
        static void Main(string[] args)
        {
            int nPComMaisDe90kg = 0;
            int idadesSomadas = 0;

            Console.Write("Informe a quantidade de pessoas: ");
            int quantidadePessoas = Convert.ToInt32(Console.ReadLine());

            for (int i = 1; i <= quantidadePessoas; i++)
            {
                Console.Write($"Informe a idade da pessoa {i}: ");
                int idade = Convert.ToInt32(Console.ReadLine());

                if (idade < 0)
                {
                    Console.WriteLine("Informe um número acima de zero!");
                    i--;
                    continue;
                }

                Console.Write($"Informe o peso da pessoa {i}: ");
                double peso = Convert.ToDouble(Console.ReadLine());

                if (peso < 0)
                {
                    Console.WriteLine("Informe um número acima de zero!");
                    i--;
                    continue;
                }

                idadesSomadas += idade;

                if (peso > 90)
                {
                    nPComMaisDe90kg++;
                }
            }

            double mediaIdades = idadesSomadas / quantidadePessoas;

            Console.WriteLine($"Número de pessoas com mais de 90 quilos: {nPComMaisDe90kg}");
            Console.WriteLine($"Média das idades: {mediaIdades}");
        }
    }
}
