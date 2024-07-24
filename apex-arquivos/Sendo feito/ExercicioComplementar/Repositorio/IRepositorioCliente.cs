using System.Collections.Generic;
using ExercicioComplementar.Modelos;
using ExercicioComplementar.Servicos.ProdutoRepositorio;

namespace ExercicioComplementar.Repositorio
{
    public interface IRepositorioCliente
    {
        void Incluir(Cliente cliente);
        void Excluir(int id);
        List<Cliente> ObterTodos();
        Cliente ObterPeloId(int id);
        string ObterClienteEListaDeProdutos(int idCliente, ProdutoRepositorioServico produtoServico);
    }
}