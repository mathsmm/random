using System;

namespace projetoInterface
{
    public class PessoaJuridica : IPessoa
    {
        public string ObterNome()
        {
            return "Matheus";
        }

        public void Apresentar()
        {
            Console.WriteLine("Apresentando a pessoa jurídica!");
        }
    }
}