using System.Collections.Generic;
using ExercicioComplementar.Modelos;

namespace ExercicioComplementar.Repositorio
{
    public interface IRepositorioProduto
    {
        void Incluir(Produto produto);
        void Excluir(int id);
        List<Produto> ObterTodos();
        Produto ObterPeloId(int id);
        List<Produto> ObterPeloIdDoCliente(int idCliente);
    }
}