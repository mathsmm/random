using System.Linq;
using System.Threading.Tasks;
using EscolaApexWebApi.Data.Interfaces;
using EscolaApexWebApi.Models;
using Microsoft.EntityFrameworkCore;

namespace EscolaApexWebApi.Data.Services
{
    public class RepositorioAluno : IRepositorioAluno
    {
        private readonly DataContext _contexto;

        public RepositorioAluno(DataContext contexto)
        {
            this._contexto = contexto;
        }

        public async Task<Aluno[]> ObterTodosAsync(bool incluirProfessor)
        {
            IQueryable<Aluno> consulta = _contexto.Aluno;

            if (incluirProfessor)
            {
                consulta = consulta.Include(a => a.AlunosDisciplinas)
                                   .ThenInclude(ad => ad.Disciplina)
                                   .ThenInclude(d => d.Professor);
            }

            consulta = consulta.AsNoTracking().OrderBy(a => a.Id);
            // AsNoTracking - "fazer sem nenhuma ação" (tira a permissão
            // de alterar ou deletar os registros)

            return await consulta.ToArrayAsync();
        }

        public async Task<Aluno[]> ObterTodosPelaDisciplinaIdAsync(int disciplinaId, bool incluirDisciplina)
        {
            IQueryable<Aluno> consulta = _contexto.Aluno;

            if (incluirDisciplina)
            {
                consulta = consulta.Include(a => a.AlunosDisciplinas)
                                   .ThenInclude(ad => ad.Disciplina);
            }

            consulta = consulta.AsNoTracking()
                               .OrderBy(a => a.Id)
                               .Where(
                                   a => a.AlunosDisciplinas.Any(
                                       ad => ad.DisciplinaId == disciplinaId
                                   )
                               );
            return await consulta.ToArrayAsync();
        }

        public async Task<Aluno> ObterAlunoPeloIdAsync(int alunoId, bool incluirProfessor)
        {
            // Aui defino em qual tabela desejo efetuar a consulta
            IQueryable<Aluno> consulta = _contexto.Aluno;
            // IQueryable - faz uma consulta em tal tabela na base de dados, com o tipo lista.

            // aqui estou dizendo que irei utilizar INNER JOIN na minha consulta
            // onde necessito ter as informações de FK que foram definidas nos Models
            if (incluirProfessor)
            {
                consulta = consulta.Include(a => a.AlunosDisciplinas)
                                   .ThenInclude(ad => ad.Disciplina)
                                   .ThenInclude(d => d.Professor);
            }
            // Este if é útil para incluir o professor!

            // aqui ordeno o resultado da consulta pelo ID do professor
            // depois disso filtro na lista de professores o professor pelo ID
            consulta = consulta.AsNoTracking()
                               .OrderBy(a => a.Id)
                               .Where(a => a.Id == alunoId);

            return await consulta.FirstOrDefaultAsync();
        }
    }
}