using System;

namespace projeto02
{
    class Program
    {
        static void Main(string[] args)
        {
            double[] listaNotas = new double[4];

            for (int i = 0; i < listaNotas.Length; i++)
            {
                Console.Write($"Informe a {i + 1}ª nota: ");
                listaNotas[i] = Convert.ToDouble(Console.ReadLine());
            }

            double somaDasNotas = 0;

            foreach (double nota in listaNotas)
            {
                somaDasNotas += nota;
            }

            double mediaDasNotas = somaDasNotas / listaNotas.Length;

            Console.WriteLine($"A média das notas é: {mediaDasNotas}");
        }
    }
}
