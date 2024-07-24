using System;
using exercicio.Pessoas;

namespace exercicio
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Informe o nome da pessoa: ");
            string nomeInformado = Console.ReadLine();
            Console.Write("Informe a idade da pessoa: ");
            int idadeInformada = Convert.ToInt32(Console.ReadLine());

            Pessoa objPessoa = new Pessoa(
                nomeInformado,
                idadeInformada
            );

            string descricaoPessoa = objPessoa.ObterDescricao();
            Console.WriteLine(descricaoPessoa);
        }
    }
}
