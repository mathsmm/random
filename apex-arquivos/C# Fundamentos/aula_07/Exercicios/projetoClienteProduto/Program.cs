using System;

namespace projetoClienteProduto
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Informe o nome do cliente: ");
            string nome = Console.ReadLine();
            Console.Write("Informe a idade do cliente: ");
            int idade = Convert.ToInt32(Console.ReadLine());

            Cliente objCliente = new Cliente(nome, idade);

            Console.Write("Informe a descrição do produto: ");
            string descricao = Console.ReadLine();
            Console.Write("Informe o valor do produto: ");
            double valor = Convert.ToDouble(Console.ReadLine());
            Console.Write("Informe a quantidade do produto: ");
            double quantidade = Convert.ToDouble(Console.ReadLine());

            Produto objProduto = new Produto(descricao, valor, quantidade, objCliente);

            Console.WriteLine(objProduto.ObterMensagem());
        }
    }
}
