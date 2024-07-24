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
    public class ClienteController : ControllerBase
    {

        private readonly ContextApp _contexto;

        public ClienteController(ContextApp contexto)
        {
            this._contexto = contexto;
        }

        [HttpGet]
        public IEnumerable<Cliente> Get()
        {
            return this._contexto.Cliente.ToList();
        }

        [HttpGet("id={id}")]
        public Cliente Get(int id)
        {
            return this._contexto.Cliente.FirstOrDefault(c => c.Id == id);
        }

        [HttpGet("nome={nome}")]
        public Cliente Get(string nome)
        {
            return this._contexto.Cliente.FirstOrDefault(c => c.Nome == nome);
        }

        [HttpPost]
        public IActionResult Post([FromBody]Cliente cliente)
        {
            try
            {
                this._contexto.Cliente.Add(cliente);
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
        public IActionResult Put(int id, [FromBody]Cliente cliente)
        {
            if (cliente.Id == id)
            {
                this._contexto.Entry(cliente).State = EntityState.Modified;
                this._contexto.SaveChanges();

                return Ok("Registro atualizado com sucesso!");
            }
            else
            {
                return BadRequest("O id do cliente não é equivalente!");
            }
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            var cliente = this._contexto.Cliente.FirstOrDefault(c => c.Id == id);

            if (cliente != null)
            {
                this._contexto.Cliente.Remove(cliente);
                this._contexto.SaveChanges();

                return Ok("Registro removido com sucesso");
            }
            else
            {
                return BadRequest("Cliente não localizado!");
            }
        }
    }
}