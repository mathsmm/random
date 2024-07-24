using System.Linq;
using System.Threading.Tasks;
using EscolaApexWebApi.Data.Interfaces;
using EscolaApexWebApi.Models;
using Microsoft.EntityFrameworkCore;

namespace EscolaApexWebApi.Data.Services
{
    public class RepositorioProfessor : IRepositorioProfessor
    {
        private readonly DataContext _contexto;

        public RepositorioProfessor(DataContext contexto)
        {
            this._contexto = contexto;
        }

        public async Task<Professor[]> ObterTodosAsync(bool incluirAluno)
        {
            IQueryable<Professor> consulta = _contexto.Professor;

            if (incluirAluno)
            {
                consulta = consulta.Include(p => p.Disciplinas)
                                   .ThenInclude(d => d.AlunosDisciplinas)
                                   .ThenInclude(ad => ad.Aluno);
            }

            consulta = consulta.AsNoTracking().OrderBy(p => p.Id);

            return await consulta.ToArrayAsync();
        }

        public async Task<Professor> ObterProfessorPeloIdAsync(int professorId, bool incluirAluno)
        {
            IQueryable<Professor> consulta = _contexto.Professor;

            if (incluirAluno)
            {
                consulta = consulta.Include(p => p.Disciplinas)
                                   .ThenInclude(d => d.AlunosDisciplinas)
                                   .ThenInclude(ad => ad.Aluno);
            }

            consulta = consulta.AsNoTracking()
                               .OrderBy(p => p.Id)
                               .Where(p => p.Id == professorId);

            return await consulta.FirstOrDefaultAsync();
        }

        public async Task<Professor[]> ObterTodosPeloAlunoIdAsync(int alunoId, bool incluirDisciplina)
        {
            IQueryable<Professor> consulta = _contexto.Professor;

            if (incluirDisciplina)
            {
                consulta = consulta.Include(p => p.Disciplinas);
            }

            consulta = consulta.AsNoTracking()
                               .OrderBy(p => p.Id)
                               .Where(
                                   p => p.Disciplinas.Any(
                                       d => d.AlunosDisciplinas.Any(
                                           ad => ad.AlunoId == alunoId)
                                       )
                                   );
                                // .Any só aceita listas (IEnumerable<>s), por isso não dá para
                                // colocar "ad => ad.Aluno.Any(...)"

            return await consulta.ToArrayAsync();
        }
    }
}