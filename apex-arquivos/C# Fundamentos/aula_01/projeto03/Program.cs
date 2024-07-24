using System;

namespace projeto03
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Informe uma cidade: ");
            string nomeDaCidade = Console.ReadLine().ToUpper();
            /*
            Como o C# é case sensitive até dentro de strings, usa-se
            o ToUpper para converter todas as letras que o usuário
            digitar para maiúsculas, a fim de fazer a validação em
            maiúsculo no switch.
            */

            switch(nomeDaCidade)
            {
                case "BLUMENAU":
                    Console.WriteLine("É a cidade da Oktoberfest!");
                    break;

                case "FLORIANÓPOLIS":
                    Console.WriteLine("É a capital de Santa Catarina!");
                    break;

                default:
                    Console.WriteLine("Cidade não listada!");
                    break;
            }
        }
    }
}
