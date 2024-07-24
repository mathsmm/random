using System;

namespace array_multi_dimensional_exercicio
{
    class Program
    {
        static void Main(string[] args)
        {
            /*
                string[,] pessoas = new string[5, 2];

                for (int i = 0; i < pessoas.GetLength(0); i++)
                {
                    Console.Write($"Informe o nome da {i + 1}ª pessoa: ");
                    pessoas[i, 0] = Console.ReadLine();
                    Console.Write($"Informe a idade da {i + 1}ª pessoa: ");
                    pessoas[i, 1] = Console.ReadLine();
                }

                for (int i = 0; i < pessoas.GetLength(0); i++)
                {
                    Console.WriteLine($"{pessoas[i, 0]} - {pessoas[i, 1]}");
                }
            */

            string[,] pessoas = ObterListaDePessoasPreenchida();
            escreverListaDePessoas(pessoas);
            // OU:
            // escreverListaDePessoas(ObterListaDePessoasPreenchida());
        }

        public static string[,] ObterListaDePessoasPreenchida()
        {
            string[,] listaPessoas = new string[5, 2];

            for (int i = 0; i < listaPessoas.GetLength(0); i++)
            {
                Console.Write($"Informe o nome da {i + 1}ª pessoa: ");
                listaPessoas[i, 0] = Console.ReadLine();
                Console.Write($"Informe a idade da {i + 1}ª pessoa: ");
                listaPessoas[i, 1] = Console.ReadLine();
            }

            return listaPessoas;
        }

        public static void escreverListaDePessoas (string[,] listaBidimensionalPessoas)
        {
            for (int i = 0; i < listaBidimensionalPessoas.GetLength(0); i++)
            {
                Console.WriteLine($"Nome: {listaBidimensionalPessoas[i, 0]} - Idade: {listaBidimensionalPessoas[i, 1]}");
            }
        }
    }
}
