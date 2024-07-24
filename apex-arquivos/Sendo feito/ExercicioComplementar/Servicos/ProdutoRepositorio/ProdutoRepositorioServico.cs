using System.Linq;
using System.Collections.Generic;
using ExercicioComplementar.Repositorio;
using ExercicioComplementar.Modelos;

namespace ExercicioComplementar.Servicos.ProdutoRepositorio
{
    public class ProdutoRepositorioServico : IRepositorioProduto
    {
        public List<Produto> ListaDeProdutos { get; set; }

        public ProdutoRepositorioServico()
        {
            this.ListaDeProdutos = new List<Produto>();
        }

        public void Incluir(Produto produto)
        {
            this.ListaDeProdutos.Add(produto);
        }
        public void Excluir(int id)
        {
            this.ListaDeProdutos.RemoveAll(p => p.Id == id);
        }
        public List<Produto> ObterTodos()
        {
            return this.ListaDeProdutos;
        }
        public Produto ObterPeloId(int id)
        {
            return this.ListaDeProdutos.Where(p => p.Id == id).FirstOrDefault();
        }
        public List<Produto> ObterPeloIdDoCliente(int idCliente)
        {
            return this.ListaDeProdutos.Where(p => p.IdCliente == idCliente).ToList();
        }
    }
}