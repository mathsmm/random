using System;
using System.Threading.Tasks;
using EscolaApexWebApi.Data.Interfaces;
using EscolaApexWebApi.Models;
using Microsoft.AspNetCore.Mvc;

namespace EscolaApexWebApi.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class DisciplinaController : ControllerBase
    {
        private readonly IRepositorio _repositorio;
        private readonly IRepositorioDisciplina _repositorioDisciplina;

        public DisciplinaController(IRepositorio repositorio,
                                    IRepositorioDisciplina repositorioDisciplina)
        {
            this._repositorio = repositorio;
            this._repositorioDisciplina = repositorioDisciplina;
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            try
            {
                return Ok(
                    await _repositorioDisciplina.ObterTodasAsync(incluirProfessor: true)
                );
            }
            catch (Exception ex)
            {
                return BadRequest($"Ao obter todas as disciplinas, ocorreu o erro: {ex.Message}");
            }
        }

        [HttpGet("disciplinaid={disciplinaId}")]
        public async Task<IActionResult> GetById(int disciplinaId)
        {
            try
            {
                return Ok(
                    await _repositorioDisciplina.ObterDisciplinaPeloIdAsync(disciplinaId, incluirProfessor: true)
                );
            }
            catch (Exception ex)
            {
                return BadRequest($"Ao obter a disciplina pelo id, ocorreu o erro: {ex.Message}");
            }
        }

         [HttpPost]
        public async Task<IActionResult> Post(Disciplina model)
        {
            try
            {
                _repositorio.Adicionar(model);

                if(await _repositorio.EfetuouAlteracoesAsync())
                {
                    return Ok(model);
                } 
            }
            catch (Exception ex)
            {
                return BadRequest($"Ao salvar a disciplina, ocorreu o erro: {ex.Message}");
            }

            return BadRequest();
        }

        [HttpPut("disciplinaid={disciplinaId}")]
        public async Task<IActionResult> Put(int disciplinaId, Disciplina model)
        {
            try
            {
                var disciplina = await _repositorioDisciplina.ObterDisciplinaPeloIdAsync(disciplinaId, incluirProfessor: false);
                if(disciplina == null)
                {
                    return NotFound();
                }

                _repositorio.Atualizar(model);

                if(await _repositorio.EfetuouAlteracoesAsync())
                {
                    return Ok(model);
                }
            }
            catch (Exception ex)
            {
                return BadRequest($"Ao editar a disciplina, ocorreu o erro: {ex.Message}");
            }

            return BadRequest();
        }

        [HttpDelete("disciplinaid={disciplinaId}")]
        public async Task<IActionResult> Delete(int disciplinaId)
        {
            try
            {
                var disciplina = await _repositorioDisciplina.ObterDisciplinaPeloIdAsync(disciplinaId, incluirProfessor: false);
                if (disciplina == null) return NotFound();

                _repositorio.Deletar(disciplina);

                if(await _repositorio.EfetuouAlteracoesAsync())
                {
                    return Ok(
                        new {
                            message = "Deletado!"
                        } 
                    );
                }
            }
            catch (Exception ex)
            {
                return BadRequest($"Ao deletar a disciplina, ocorreu o erro: {ex.Message}");
            }

            return BadRequest();
        }
    }
}