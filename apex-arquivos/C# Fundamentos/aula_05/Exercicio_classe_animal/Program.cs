using System;
using Exercicio_classe_animal.Animais;

namespace Exercicio_classe_animal
{
    class Program
    {
        static void Main(string[] args)
        {
            Animal objAnimal = new Animal(
                "Bob",
                3,
                "cachorro"
            );

            Console.WriteLine(objAnimal.ObterMensagemDeDescricao());
        }
    }
}
