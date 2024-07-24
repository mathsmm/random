using System;

namespace exercicio3
{
    class Program
    {
        static void Main(string[] args)
        {
            int [,] listaNumeros = ObterListaDeNumerosPreenchidaPeloUsuario();
            EscreverMediaDaListaDeNumeros(ObterMediaDaListaDeNumeros(listaNumeros));
        }

        public static int[,] ObterListaDeNumerosPreenchidaPeloUsuario()
        {
            int [,] listaDeNumeros = new int [2, 4];
            for (int l = 0; l < listaDeNumeros.GetLength(0); l++)
            {
                for (int c = 0; c < listaDeNumeros.GetLength(1); c++)
                {
                    Console.Write($"Informe o número da linha {l + 1} e coluna {c + 1}: ");
                    listaDeNumeros[l, c] = Convert.ToInt32(Console.ReadLine());
                }
            }
            return listaDeNumeros;
        }

        public static double ObterMediaDaListaDeNumeros(int[,] listaDeNumeros)
        {
            double somaDosNumeros = 0;

            for (int l = 0; l < listaDeNumeros.GetLength(0); l++)
            {
                for (int c = 0; c < listaDeNumeros.GetLength(1); c++)
                {
                    somaDosNumeros += listaDeNumeros[l, c];
                }
            }
            // return somaDosNumeros / (listaDeNumeros.GetLength(0) + 1 + listaDeNumeros.GetLength(1) + 1);
            return somaDosNumeros / (listaDeNumeros.Length);
        }

        public static void EscreverMediaDaListaDeNumeros(double media)
        {
            Console.WriteLine($"A média dos números da lista é: {media}");
        }
    }
}
