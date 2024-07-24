using System.Threading.Tasks;
using APIClienteProduto.Models;

namespace APIClienteProduto.Data.Repository.Interfaces
{
    public interface IRepositoryProduct
    {
        Task<Product[]> GetAllAsync();
        Task<Product> GetByIdAsync(int productId);
        Task<Product[]> GetByClientIdAsync(int clientId);
    }
}