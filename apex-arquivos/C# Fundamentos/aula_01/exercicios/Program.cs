using System;

namespace exercicios
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Informe tua idade: ");
            int idade = Convert.ToInt32(Console.ReadLine());
            string mensagemRetorno = "";

            if (idade >= 10 && idade <= 15)
            {
                mensagemRetorno = "Você é da modalidade juvenil!";
            }
            else if (idade > 15 && idade <= 18)
            {
                mensagemRetorno = "Você é da modalidade juvenil 2!";
            }
            else if (idade >18)
            {
                mensagemRetorno = "Você é da modalidade adulto!";
            }
            else
            {
                mensagemRetorno = "Você não tem idade para nadar!";
            }

            Console.WriteLine(mensagemRetorno);
        }
    }
}
