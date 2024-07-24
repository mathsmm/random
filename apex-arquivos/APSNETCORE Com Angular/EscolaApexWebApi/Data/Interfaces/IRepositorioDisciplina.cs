using System.Threading.Tasks;
using EscolaApexWebApi.Models;

namespace EscolaApexWebApi.Data.Interfaces
{
    public interface IRepositorioDisciplina
    {
        Task<Disciplina[]> ObterTodasAsync(bool incluirProfessor);
        Task<Disciplina> ObterDisciplinaPeloIdAsync(int disciplinaId, bool incluirProfessor);
    }
}