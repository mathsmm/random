using System;

namespace projeto02
{
    class Program
    {
        static void Main(string[] args)
        {
            // Array (lista):
            string[] listaNomes = 
            {
                "Diego", "Daniel", "Marcela", "Alexandre", "Matheus", "Felipe"
            };

            // Percorrendo a lista "manualmente":
            Console.WriteLine(listaNomes[0]);
            Console.WriteLine(listaNomes[1]);
            Console.WriteLine(listaNomes[2]);
            Console.WriteLine(listaNomes[3]);
            Console.WriteLine(listaNomes[4]);
            Console.WriteLine(listaNomes[5]);

            // Utilizando for com índice para percorrer a lista:
            for (int i = 0; i < listaNomes.Length; i++)
            {
                Console.WriteLine($"Índice: {i} - Nome: {listaNomes[i]}");
            }

            // Utilizando foreach com valor para percorrer a lista:
            foreach (string nome in listaNomes)
            {
                Console.WriteLine($"Nome: {nome}");
            }
        }
    }
}
