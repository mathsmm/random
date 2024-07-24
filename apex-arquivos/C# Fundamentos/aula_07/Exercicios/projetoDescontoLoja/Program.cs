using System;

namespace projetoDescontoLoja
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Informe o nome do produto: ");
            string produto = Console.ReadLine();
            Console.Write("Informe a forma de pagamento ('A vista' ou outra): ");
            string formaPagamento = Console.ReadLine();
            Console.Write("Informe o valor do produto: ");
            double valor = Convert.ToDouble(Console.ReadLine());

            Loja objLoja = new Loja(produto, formaPagamento, valor);

            Console.WriteLine(objLoja.ObterMensagemDesconto());
        }
    }
}
