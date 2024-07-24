using System.Threading.Tasks;

namespace APIClienteProduto.Data.Repository.Interfaces
{
    public interface IRepository
    {
        // T -> Tipo genérico (convenção)
        // Entity (entidade)-> Tabela transformada em classe
        void Add<T>(T entity) where T : class;
        void Update<T>(T entity) where T : class;
        void Delete<T>(T entity) where T : class;
        Task<bool> SaveChangesAsync();
    }
}