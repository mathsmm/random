using System;

namespace projeto01
{
    class Program
    {
        static void Main(string[] args)
        {
            int contadorA = 0;
            bool contadorEhMenorOuIgualA3 = contadorA <= 3;
            // Variável booleana aceita true, false ou uma condição.

            while (contadorEhMenorOuIgualA3) 
            {
                Console.WriteLine($"Contador: {contadorA}");

                contadorA++;
                contadorEhMenorOuIgualA3 = contadorA <= 3;
            }

            //------------------------------------------------------------

            bool continuar = true;

            while(continuar) 
            {
                Console.WriteLine("Escolha uma opção: S ou N");
                string resposta = Console.ReadLine().ToUpper();

                // if (resposta == "S") 
                // {
                //     continuar = true;
                // }
                // else 
                // {
                //     continuar = false;
                // }

                // OU: 

                continuar = resposta == "S";
            }

            //------------------------------------------------------------

            int contadorB = 1;

            while (contadorB <= 50)
            {
                Console.WriteLine("Estou percorrendo o laço WHILE");
                contadorB++;
            }

            //------------------------------------------------------------

            Console.WriteLine("(WHILE) Escreva o primeiro número inteiro. Ele deve ser menor que o próximo: ");
            int numero1A = Convert.ToInt32(Console.ReadLine());

            Console.WriteLine("(WHILE) Escreva o segundo número inteiro. Ele deve ser maior que o anterior: ");
            int numero2A = Convert.ToInt32(Console.ReadLine());

            bool numero1MenorQueNumero2 = true;
            // OU:
            // bool numero1MenorQueNumero2 = numero1 <= numero2;

            while(numero1MenorQueNumero2) 
            {
                Console.WriteLine(numero1A);
                numero1A++;
                numero1MenorQueNumero2 = numero1A <= numero2A;
            }

            //------------------------------------------------------------

            for (int i = 1; i <= 10; i++)
            {
                Console.WriteLine($"Estou utilizando FOR no índice: {i}");
            }

            //------------------------------------------------------------

            Console.WriteLine("(FOR) Escreva o primeiro número inteiro. Ele deve ser menor que o próximo: ");
            int numero1B = Convert.ToInt32(Console.ReadLine());

            Console.WriteLine("(FOR) Escreva o segundo número inteiro. Ele deve ser maior que o anterior: ");
            int numero2B = Convert.ToInt32(Console.ReadLine());

            for (int i = numero1B; i <= numero2B; i++)
            {
                Console.WriteLine(i);
            }
        }
    }
}
