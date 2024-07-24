using System;

namespace projeto02
{
    class Program
    {
        static void Main(string[] args)
        {
            int contadorBlumenau = 0;
            int contadorTimbo = 0;
            int contadorIndaial = 0;
            int totalVotos = 0;
            int opcaoVoto = 0;

            // OU:
            /* 
            int contadorBlumenau, contadorTimbo, 
                contadorIndaial, totalVotos, opcaoVoto = 0;
            */

            do
            {
                Console.WriteLine("(1) Blumenau");
                Console.WriteLine("(2) Timbó");
                Console.WriteLine("(3) Indaial");
                Console.WriteLine("(4) Finalizar");

                opcaoVoto = Convert.ToInt32(Console.ReadLine());

                if (opcaoVoto != 4)
                {
                    totalVotos++;
                }

                switch (opcaoVoto)
                {
                    case 1: contadorBlumenau++; break;
                    case 2: contadorTimbo++; break;
                    case 3: contadorIndaial++; break;
                }
            }
            while (opcaoVoto != 4);

            Console.WriteLine($"Blumenau recebeu {contadorBlumenau} votos.");
            Console.WriteLine($"Indaial recebeu {contadorIndaial} votos.");
            Console.WriteLine($"Timbó recebeu {contadorTimbo} votos.");
            Console.WriteLine($"Número total de votos: {totalVotos}.");
        }
    }
}
