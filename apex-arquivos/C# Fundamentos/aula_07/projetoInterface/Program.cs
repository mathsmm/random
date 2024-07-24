using System;

namespace projetoInterface
{
    class Program
    {
        static void Main(string[] args)
        {
            IPessoa pessoaFisica = new PessoaFisica();
            Console.WriteLine(pessoaFisica.ObterNome());
            pessoaFisica.Apresentar();

            IPessoa pessoaJuridica = new PessoaJuridica();
            Console.WriteLine(pessoaJuridica.ObterNome());
            pessoaJuridica.Apresentar();
        }
    }
}
