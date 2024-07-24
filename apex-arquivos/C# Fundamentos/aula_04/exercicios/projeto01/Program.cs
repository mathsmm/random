using System;

namespace projeto01
{
    class Program
    {
        static void Main(string[] args)
        {
            int nPComMaisDe90kg = 0;
            int idadesSomadas = 0;

            for (int i = 1; i <= 7; i++)
            {
                Console.Write($"Informe a idade da pessoa {i}: ");
                int idade = Convert.ToInt32(Console.ReadLine());

                Console.Write($"Informe o peso da pessoa {i}: ");
                double peso = Convert.ToDouble(Console.ReadLine());

                idadesSomadas += idade;

                if (peso > 90)
                {
                    nPComMaisDe90kg++;
                }
            }
            double mediaIdades = idadesSomadas / 7;

            Console.WriteLine($"Número de pessoas com mais de 90 quilos: {nPComMaisDe90kg}");
            Console.WriteLine($"Média das idades: {mediaIdades}");
        }
    }
}
