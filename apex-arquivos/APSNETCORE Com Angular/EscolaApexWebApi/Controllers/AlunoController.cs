using System;
using System.Threading.Tasks;
using EscolaApexWebApi.Data.Interfaces;
using EscolaApexWebApi.Models;
using Microsoft.AspNetCore.Mvc;

namespace EscolaApexWebApi.Controllers
{
    [ApiController]
    [Route("[controller]")]
    // Diz que a rota deste controlador será o próprio 
    // nome deste controlador. No caso, "Aluno".
    public class AlunoController : ControllerBase
    {
        private readonly IRepositorio _repositorio;
        private readonly IRepositorioAluno _repositorioAluno;

        public AlunoController(IRepositorio repositorio,
                               IRepositorioAluno repositorioAluno)
        {
            this._repositorio = repositorio;
            this._repositorioAluno = repositorioAluno;
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            try
            {
                return Ok(
                    await _repositorioAluno.ObterTodosAsync(incluirProfessor: false)
                );
            }
            catch (Exception ex)
            {
                return BadRequest($"Ao obter todos os alunos, ocorreu o erro: {ex.Message}");
            }
        }

        [HttpGet("alunoid={alunoId}")]
        public async Task<IActionResult> GetById(int alunoId)
        {
            try
            {
                return Ok(
                    await _repositorioAluno.ObterAlunoPeloIdAsync(alunoId, incluirProfessor: true)
                );
            }
            catch (Exception ex)
            {
                return BadRequest($"Ao obter o aluno, ocorreu o erro: {ex.Message}");
            }
        }

        [HttpGet("disciplinaid={disciplinaId}")]
        public async Task<IActionResult> GetByDisciplinaId(int disciplinaId)
        {
            try
            {
                return Ok(
                    await _repositorioAluno.ObterTodosPelaDisciplinaIdAsync(disciplinaId, incluirDisciplina: false)
                );
            }
            catch (Exception ex)
            {
                return BadRequest($"Ao obter todos os alunos pelo id da disciplina, ocorreu o erro: {ex.Message}");
            }
        }

        [HttpPost]
        public async Task<IActionResult> Post(Aluno aluno)
        {
            try
            {
                _repositorio.Adicionar(aluno);
                if (await this._repositorio.EfetuouAlteracoesAsync())
                {
                    return Ok(aluno);
                }
            }
            catch (Exception ex)
            {
                return BadRequest($"Ao salvar o aluno, ocorreu o erro: {ex.Message}");
            }
            return BadRequest();
        }

        [HttpPut("alunoid={alunoId}")]
        public async Task<IActionResult> Put(int alunoId, Aluno aluno)
        {
            try
            {
                var alunoCadastrado = await _repositorioAluno.ObterAlunoPeloIdAsync(alunoId, incluirProfessor: false);
                if (alunoCadastrado == null)
                {
                    return NotFound();
                }
                _repositorio.Atualizar(aluno);
                if (await _repositorio.EfetuouAlteracoesAsync())
                {
                    return Ok(aluno);
                }
            }
            catch (Exception ex)
            {
                return BadRequest($"Ao atualizar o aluno, ocorreu o erro: {ex.Message}");
            }
            return BadRequest();
        }

        [HttpDelete("alunoid={alunoId}")]
        public async Task<IActionResult> Delete(int alunoId)
        {
            try
            {
                var alunoCadastrado = await _repositorioAluno.ObterAlunoPeloIdAsync(alunoId, incluirProfessor: false);
                if (alunoCadastrado == null)
                {
                    return NotFound();
                }
                _repositorio.Deletar(alunoCadastrado);
                if (await _repositorio.EfetuouAlteracoesAsync())
                {
                    return Ok(
                        new {
                            message="Removido!"
                            // Aqui cria-se um objeto do tipo Dictionary com chave
                            // e valor para retornar em JSON no Postman
                        }
                    );
                }
            }
            catch (Exception ex)
            {
                return BadRequest($"Ao remover o aluno, ocorreu o erro: {ex.Message}");
            }
            return BadRequest();
        }
    }
}