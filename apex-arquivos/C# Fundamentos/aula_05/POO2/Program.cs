using System;
using POO2.Pessoas;

namespace POO2
{
    class Program
    {
        static void Main(string[] args)
        {
            Pessoa objPessoa = new Pessoa(
                "Diego Cugiki",
                new DateTime(1986, 11, 21),
                'M'
            );

            string descricaoPessoa = objPessoa.ObterDescricao();

            Console.WriteLine(descricaoPessoa);
            Pessoa.ObterDescricaoStatic();
        }
    }
}
