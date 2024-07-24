using System;

namespace array_par_impar
{
    class Program
    {
        static void Main(string[] args)
        {
            int[] listaDeNumeros = new int[5];

            for (int i = 0; i < listaDeNumeros.Length; i++)
            {
                Console.Write($"Informe o {i + 1}º número: ");
                listaDeNumeros[i] = Convert.ToInt32(Console.ReadLine());
            }

            int contadorPares = 0;
            int contadorImpares = 0;

            foreach (int numero in listaDeNumeros)
            {
                if (numero % 2 == 0)
                {
                    contadorPares++;
                }
                else
                {
                    contadorImpares++;
                }
            }

            Console.WriteLine($"Quantidade de números pares: {contadorPares}");
            Console.WriteLine($"Quantidade de números ímpares: {contadorImpares}");
        }
    }
}
