using System.Threading.Tasks;
using APIClienteProduto.Models;

namespace APIClienteProduto.Data.Repository.Interfaces
{
    public interface IRepositoryClient
    {
        Task<Client[]> GetAllAsync(bool includeProduct);
        Task<Client> GetByIdAsync(int clientId, bool includeProduct);
    }
}