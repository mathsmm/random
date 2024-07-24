using System;

namespace projeto02
{
    class Program
    {
        static void Main(string[] args)
        {
            string[] listaNomes = new string[3];

            for (int i = 0; i < listaNomes.Length; i++)
            {
                Console.Write($"Informe o nome da {i + 1}ª pessoa: ");
                listaNomes[i] = Console.ReadLine();
            }

            foreach (string nome in listaNomes)
            {
                Console.WriteLine(nome);
            }
        }
    }
}
