using System.Linq;
using System.Threading.Tasks;
using EscolaApexWebApi.Data.Interfaces;
using EscolaApexWebApi.Models;
using Microsoft.EntityFrameworkCore;


namespace EscolaApexWebApi.Data.Services
{
    public class RepositorioDisciplina : IRepositorioDisciplina
    {
        private readonly DataContext _contexto;
        public RepositorioDisciplina(DataContext contexto)
        {
            this._contexto = contexto;
        }

        public async Task<Disciplina[]> ObterTodasAsync(bool incluirProfessor)
        {
            IQueryable<Disciplina> query = _contexto.Disciplina;

            if (incluirProfessor)
            {
                query = query.Include(d => d.Professor);
            }

            query = query.AsNoTracking()
                         .OrderBy(c => c.Id);

            return await query.ToArrayAsync();
        }

        public async Task<Disciplina> ObterDisciplinaPeloIdAsync(int disciplinaId, bool incluirProfessor)
        {
            IQueryable<Disciplina> query = _contexto.Disciplina;

            if (incluirProfessor)
            {
                query = query.Include(d => d.Professor);
            }

            query = query.AsNoTracking()
                         .OrderBy(d => d.Id)
                         .Where(d => d.Id == disciplinaId);
            
            return await query.FirstOrDefaultAsync();
        }
    }
}