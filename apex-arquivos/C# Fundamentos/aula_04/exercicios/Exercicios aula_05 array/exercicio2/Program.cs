using System;

namespace exercicio2
{
    class Program
    {
        // não está terminado
        static void Main(string[] args)
        {
            double[,] listaNumeros = new double[2, 5];
            ObterListaPreenchidaPeloUsuario(listaNumeros);
            EscreverListaPreenchidaPeloUsuario(listaNumeros);
        }

        public static double[,] ObterListaPreenchidaPeloUsuario (double[,] listaDeNumeros)
        {
            for (int l = 0; l < listaDeNumeros.GetLength(0); l++)
            {
                for (int c = 0; c < listaDeNumeros.GetLength(1); c++)
                {
                    Console.Write($"Informe o número da linha {l + 1} e da coluna {c + 1}: ");
                    listaDeNumeros[l, c] = Convert.ToDouble(Console.ReadLine());
                }
            }
            return listaDeNumeros;
        }

        public static void EscreverListaPreenchidaPeloUsuario(double[,] listaDeNumeros)
        {
            for (int l = 0; l < listaDeNumeros.GetLength(0); l++)
            {
                for (int c = 0; c < listaDeNumeros.GetLength(1); c++)
                {
                    Console.WriteLine($"Valor: {listaDeNumeros[l, c]} está na linha {l + 1} e na coluna {c + 1}");
                }
            }
        }
    }
}
