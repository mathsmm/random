using System;

namespace array_par_impar
{
    class Program
    {
        static void Main(string[] args)
        {
            int[] listaDeNumeros = ObterListaDeNumeroPreenchida();
            int quantidadePar = ObterQuantidadeDeNumerosPares(listaDeNumeros);
            int quantidadeImpar = ObterQuantidadeDeNumerosImpares(listaDeNumeros);
            Console.WriteLine($"Quantidade de pares: {quantidadePar}");
            Console.WriteLine($"Quantidade de ímpares: {quantidadeImpar}");
        }
    
        public static int[] ObterListaDeNumeroPreenchida()
        {
            int[] listaDeNumeros = new int[5];

            for (int i = 0; i < listaDeNumeros.Length; i++)
            {
                Console.Write($"Informe o {i + 1}º número: ");
                listaDeNumeros[i] = Convert.ToInt32(Console.ReadLine());
            }
            return listaDeNumeros;
        }
    
        public static int ObterQuantidadeDeNumerosPares(int[] plistaDeNumeros)
        {
            int quantidadePar = 0;

            foreach (int numero in plistaDeNumeros)
            {
                if (numero % 2 == 0)
                {
                    quantidadePar++;
                }
            }
            return quantidadePar;
        }

        public static int ObterQuantidadeDeNumerosImpares(int[] plistaDeNumeros)
        {
            int quantidadeImpar = 0;

            foreach (int numero in plistaDeNumeros)
            {
                if (numero % 2 != 0)
                {
                    quantidadeImpar++;
                }
            }
            return quantidadeImpar;
        }
    }
}