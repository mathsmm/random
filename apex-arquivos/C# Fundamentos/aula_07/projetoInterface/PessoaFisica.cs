using System;

namespace projetoInterface
{
    public class PessoaFisica : IPessoa
    // A classe PessoaFisica vai implementar IPessoa
    // É obrigado a "copiar" os métodos e funções da IPessoa
    {
        public string ObterNome()
        {
            return "Diego";
        }

        public void Apresentar()
        {
            Console.WriteLine("Apresentando a pessoa física!");
        }
    }
}