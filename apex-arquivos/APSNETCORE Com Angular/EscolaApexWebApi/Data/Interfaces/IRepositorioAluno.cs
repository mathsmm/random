using System.Threading.Tasks;
using EscolaApexWebApi.Models;

namespace EscolaApexWebApi.Data.Interfaces
{
    public interface IRepositorioAluno
    {
        Task<Aluno[]> ObterTodosAsync(bool incluirProfessor);
        Task<Aluno[]> ObterTodosPelaDisciplinaIdAsync(int disciplinaId, bool incluirDisciplina);
        Task<Aluno> ObterAlunoPeloIdAsync(int alunoId, bool incluirProfessor);
    }
}