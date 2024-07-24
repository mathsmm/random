using System.Text;
using System.Linq;
using System.Collections.Generic;
using ExercicioComplementar.Repositorio;
using ExercicioComplementar.Modelos;
using ExercicioComplementar.Servicos.ProdutoRepositorio;

namespace ExercicioComplementar.Servicos.ClienteRepositorio
{
    public class ClienteRepositorioServico : IRepositorioCliente
    {
        public List<Cliente> ListaDeClientes { get; set; }

        public ClienteRepositorioServico()
        {
            this.ListaDeClientes = new List<Cliente>();
        }

        public void Incluir(Cliente cliente)
        {
            this.ListaDeClientes.Add(cliente);
        }
        public void Excluir(int id)
        {
            this.ListaDeClientes.RemoveAll(c => c.Id == id);
        }
        public List<Cliente> ObterTodos()
        {
            return this.ListaDeClientes;
        }
        public Cliente ObterPeloId(int id)
        {
            return this.ListaDeClientes.Where(c => c.Id == id).FirstOrDefault();
        }
        public string ObterClienteEListaDeProdutos(int idCliente, ProdutoRepositorioServico produtoServico)
        {
            StringBuilder sb = new StringBuilder();
            List<Produto> lp = produtoServico.ObterPeloIdDoCliente(idCliente);
            sb.Append($"-------------------------------------------------------\n");
            sb.Append($"CLIENTE\n");
            sb.Append($"-------------------------------------------------------\n");
            sb.Append($"**** ID: {ObterPeloId(idCliente).Id} - Nome: {ObterPeloId(idCliente).Nome}\n");
            sb.Append($"-------------------------------------------------------\n");
            sb.Append($"PRODUTOS\n");
            sb.Append($"-------------------------------------------------------\n");
            foreach (var item in lp)
            {
                sb.Append($"**** ID: {item.Id} - Descrição: {item.Descricao} - Valor: {item.Valor}\n");
            }
            sb.Append($"-------------------------------------------------------\n");
            return $"{sb}";
        }
    }
}