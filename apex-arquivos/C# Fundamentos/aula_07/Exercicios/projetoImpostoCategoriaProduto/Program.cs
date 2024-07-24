using System;

namespace projetoImpostoCategoriaProduto
{
    class Program
    {
        static void Main(string[] args)
        {
            Produto objProduto1 = new Produto("Headset", "Eletrônico", 110);
            Produto objProduto2 = new Produto("Camiseta", "Vestuário", 35.90);
            Produto objProduto3 = new Produto("Caneta", "Material Escolar", 1.75);

            Console.WriteLine(objProduto1.ObterMensagemDoProduto());
            Console.WriteLine(objProduto2.ObterMensagemDoProduto());
            Console.WriteLine(objProduto3.ObterMensagemDoProduto());
        }
    }
}
