using System;

namespace projeto03
{
    class Program
    {
        static void Main(string[] args)
        {
            string[] listaNomes = new string[6];

            for (int i = 0; i < listaNomes.Length; i++)
            {
                Console.WriteLine($"Informe o {i + 1}º nome: ");
                listaNomes[i] = Console.ReadLine();
            }

            foreach (string nome in listaNomes)
            {
                Console.WriteLine(nome);
            }
        }
    }
}
