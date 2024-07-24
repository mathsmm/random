using System;
using ExercicioComplementar.Modelos;
using ExercicioComplementar.Servicos.ClienteRepositorio;
using ExercicioComplementar.Servicos.ProdutoRepositorio;

namespace ExercicioComplementar
{
    class Program
    {
        static void Main(string[] args)
        {
            Cliente clienteDiego = new Cliente(1, "Diego Cugiki");
            Cliente clientePedro = new Cliente(2, "Pedro");

            ClienteRepositorioServico clienteRepositorio = new ClienteRepositorioServico();
            clienteRepositorio.Incluir(clienteDiego);
            clienteRepositorio.Incluir(clientePedro);

            Produto produtoArroz = new Produto(1, "Arroz", 5, clienteDiego.Id);
            Produto produtoFeijao = new Produto(2, "Feijão", 8, clienteDiego.Id);
            Produto produtoAcucar = new Produto(3, "Açucar", 6, clienteDiego.Id);
            Produto produtoMacarrao = new Produto(4, "Macarrão", 4, clienteDiego.Id);
            Produto produtoLeite = new Produto(5, "Leite", 3, clienteDiego.Id);
            Produto produtoDesodorante = new Produto(6, "Desodorante", 5, clientePedro.Id);
            Produto produtoOmo = new Produto(7, "Omo", 17, clientePedro.Id);
            Produto produtoPao = new Produto(8, "Pão", 5, clientePedro.Id);
            Produto produtoBatata = new Produto(9, "Batata", 9, clientePedro.Id);
            Produto pordutoCenoura = new Produto(10, "Cenoura", 4.5, clientePedro.Id);

            ProdutoRepositorioServico produtoRepositorio = new ProdutoRepositorioServico();
            produtoRepositorio.Incluir(produtoArroz);
            produtoRepositorio.Incluir(produtoFeijao);
            produtoRepositorio.Incluir(produtoAcucar);
            produtoRepositorio.Incluir(produtoMacarrao);
            produtoRepositorio.Incluir(produtoLeite);
            produtoRepositorio.Incluir(produtoDesodorante);
            produtoRepositorio.Incluir(produtoOmo);
            produtoRepositorio.Incluir(produtoPao);
            produtoRepositorio.Incluir(produtoBatata);
            produtoRepositorio.Incluir(pordutoCenoura);

            string produtosDoClienteDiego = clienteRepositorio.ObterClienteEListaDeProdutos(clienteDiego.Id, produtoRepositorio);
            string produtosDoClientePedro = clienteRepositorio.ObterClienteEListaDeProdutos(clientePedro.Id, produtoRepositorio);

            Console.WriteLine(produtosDoClienteDiego);
            Console.WriteLine(produtosDoClientePedro);

            produtoRepositorio.Excluir(produtoArroz.Id);
            produtoRepositorio.Excluir(produtoPao.Id);
            produtoRepositorio.Excluir(produtoLeite.Id);
            produtoRepositorio.Excluir(produtoAcucar.Id);

            produtosDoClienteDiego = clienteRepositorio.ObterClienteEListaDeProdutos(clienteDiego.Id, produtoRepositorio);
            produtosDoClientePedro = clienteRepositorio.ObterClienteEListaDeProdutos(clientePedro.Id, produtoRepositorio);

            Console.WriteLine(produtosDoClienteDiego);
            Console.WriteLine(produtosDoClientePedro);
        }
    }
}
