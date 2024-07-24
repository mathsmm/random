using System;

namespace exercicio1
{
    class Program
    {
        static void Main(string[] args)
        {
            int[,] listaNumeros = new int[4, 4]
            {
                { 1, 2, 3, 40 },
                { 3, 4, 10, 30 },
                { 5, 6, 35, 67 },
                { 7, 8, 90, 91 }
            };
            EscreverMaiorNumeroDeCadaLinha(listaNumeros);
            EscreverMediaNumeroDeCadaColuna(listaNumeros);
        }

        public static void EscreverMaiorNumeroDeCadaLinha(int[,] listaDeNumeros)
        {
            int maiorDaLinha = 0;

            for (int iL = 0; iL < listaDeNumeros.GetLength(0); iL++)
            {
                for (int iC = 0; iC < listaDeNumeros.GetLength(1); iC++)
                {
                    if (listaDeNumeros[iL, iC] > maiorDaLinha)
                    {
                        maiorDaLinha = listaDeNumeros[iL, iC];
                    }
                }
                Console.WriteLine($"Maior número da linha {iL + 1}: {maiorDaLinha}");
                maiorDaLinha = 0;
            }
        }

        public static void EscreverMediaNumeroDeCadaColuna(int[,] listaDeNumeros)
        {
            double somaColuna = 0;
            double mediaColuna = 0;

            for (int iC = 0; iC < listaDeNumeros.GetLength(1); iC++)
            {
                for (int iL = 0; iL < listaDeNumeros.GetLength(0); iL++)
                {
                    somaColuna += listaDeNumeros[iL, iC];
                }
                mediaColuna = somaColuna / listaDeNumeros.GetLength(0);
                Console.WriteLine($"Média da coluna {iC + 1}: {mediaColuna}");
                somaColuna = 0;
                mediaColuna = 0;
            }
        }
    }
}
