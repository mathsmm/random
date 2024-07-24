using System;
using POO.Pessoas;

namespace POO
{
    class Program
    {
        static void Main(string[] args)
        {
            // Tipo     nomeDaVariavel     valor
            // string   numero             = 0;

            Pessoa objPessoa = new Pessoa();
            /*objPessoa -> contém instância da classe Pessoa*/

            objPessoa.Nome = "Diego Cugiki";
            objPessoa.DataNascimento = new DateTime(1986, 11, 21);
            objPessoa.Sexo = 'M';

            string descricaoPessoa = objPessoa.ObterDescricao();

            Console.WriteLine(descricaoPessoa);
        }
    }
}
