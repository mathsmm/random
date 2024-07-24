using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Mvc;
using System.Linq;
using System.Collections.Generic;
using System;
using WebAPI1.Models;
using WebAPI1.Context;

namespace WebAPI1.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ProdutoController : ControllerBase
    {
        private readonly ContextApp _contexto;

        public ProdutoController(ContextApp contexto)
        {
            this._contexto = contexto;
        }

        [HttpGet]
        public IEnumerable<Produto> Get()
        {
            return this._contexto.Produto.ToList();
        }

        [HttpGet("id={id}")]
        public Produto Get(int id)
        {
            return this._contexto.Produto.FirstOrDefault(p => p.Id == id);
        }

        [HttpGet("descricao={descricao}")]
        public Produto Get(string descricao)
        {
            return this._contexto.Produto.FirstOrDefault(p => p.Descricao == descricao);
        }

        [HttpPost]
        public IActionResult Post([FromBody]Produto produto)
        {
            try
            {
                this._contexto.Produto.Add(produto);
                this._contexto.SaveChanges();

                return Ok("Cadastrado com sucesso!");
            }
            catch (Exception ex)
            {
                return BadRequest();
                throw;
            }
        }

        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody]Produto produto)
        {
            if (produto.Id == id)
            {
                this._contexto.Entry(produto).State = EntityState.Modified;
                this._contexto.SaveChanges();

                return Ok("Registro atualizado com sucesso!");
            }
            else
            {
                return BadRequest("O id do produto não é equivalente!");
            }
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            var produto = this._contexto.Produto.FirstOrDefault(p => p.Id == id);

            if (produto != null)
            {
                this._contexto.Produto.Remove(produto);
                this._contexto.SaveChanges();

                return Ok("Registro removido com sucesso!");
            }
            else
            {
                return BadRequest("Produto não localizado!");
            }
        }
    }
}