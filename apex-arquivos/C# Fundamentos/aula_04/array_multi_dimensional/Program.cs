using System;

namespace array_multi_dimensional
{
    class Program
    {
        static void Main(string[] args)
        {
            string[,] pessoas = new string[6, 3];

            /* 
                        0               1          2
                        Nome            Idade      CPF
                    0   Diego           33         12312312
                    1   Jorge           57         34553453
                    2   Joaquina        34         47456456
            */

            pessoas[0, 0] = "Diego";
            pessoas[0, 1] = "33";
            pessoas[0, 2] = "12312312";

            pessoas[1, 0] = "Jorge";
            pessoas[1, 1] = "57";
            pessoas[1, 2] = "34553453";

            pessoas[2, 0] = "Joaquina";
            pessoas[2, 1] = "34";
            pessoas[2, 2] = "47456456";

            for (int i = 0; i < pessoas.GetLength(0); i++)
            {
                Console.WriteLine($"Nome: {pessoas[i, 0]} - Idade: {pessoas[i, 1]} - CPF: {pessoas[i, 2]}");
            }
        }
    }
}