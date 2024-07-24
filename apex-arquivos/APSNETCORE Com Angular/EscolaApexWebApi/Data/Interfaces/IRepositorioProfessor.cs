using System.Threading.Tasks;
using EscolaApexWebApi.Models;

namespace EscolaApexWebApi.Data.Interfaces
{
    public interface IRepositorioProfessor
    {
        Task<Professor[]> ObterTodosAsync(bool incluirAluno);
        Task<Professor> ObterProfessorPeloIdAsync(int professorId, bool incluirAluno);
        Task<Professor[]> ObterTodosPeloAlunoIdAsync(int alunoId, bool incluirDisciplina);
    }
}