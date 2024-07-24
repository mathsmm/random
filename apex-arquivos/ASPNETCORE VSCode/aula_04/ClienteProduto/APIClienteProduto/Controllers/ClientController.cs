using System;
using System.Threading.Tasks;
using APIClienteProduto.Data.Repository.Interfaces;
using APIClienteProduto.Models;
using Microsoft.AspNetCore.Mvc;

namespace APIClienteProduto.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ClientController : ControllerBase
    {
        private readonly IRepositoryClient _repositoryClient;
        private readonly IRepository _repository;

        public ClientController(IRepositoryClient repositoryClient, IRepository repository)
        {
            this._repositoryClient = repositoryClient;
            this._repository = repository;
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            try
            {
                var result = await _repositoryClient.GetAllAsync(includeProduct: true);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest($"Erro: {ex.Message}");
            }
        }

        [HttpGet("{clientId}")]
        public async Task<IActionResult> GetById(int clientId)
        {
            try
            {
                var result = await this._repositoryClient.GetByIdAsync(clientId, true);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest($"Erro: {ex.Message}");
            }
        }

        [HttpPost]
        public async Task<IActionResult> Post(Client modelClient)
        {
            try
            {
                _repository.Add(modelClient);

                if (!await _repository.SaveChangesAsync())
                {
                    return BadRequest("Didn't save the client!");
                }
                return Ok(modelClient);
            }
            catch (Exception ex)
            {
                return BadRequest($"Erro: {ex.Message}");
            }
        }

        [HttpPut("{clientId}")]
        public async Task<IActionResult> Put(int clientId, Client modelClient)
        {
            try
            {
                var client = await _repositoryClient.GetByIdAsync(clientId, false);

                if (client == null)
                {
                    return NotFound("Didn't find any client!");
                }

                _repository.Update(modelClient);

                if (!await _repository.SaveChangesAsync())
                {
                    return BadRequest("Didn't save the client!");
                }
                return Ok(modelClient);
            }
            catch (Exception ex)
            {
                return BadRequest($"Erro: {ex.Message}");
            }
        }

        [HttpDelete("{clientId}")]
        public async Task<IActionResult> Delete(int clientId)
        {
            try
            {
                var client = await _repositoryClient.GetByIdAsync(clientId, false);

                if (client == null)
                {
                    return NotFound();
                }

                _repository.Delete(client);

                if (!await _repository.SaveChangesAsync())
                {
                    return BadRequest();
                }
                return Ok("Successful!");
            }
            catch (Exception ex)
            {
                return BadRequest($"Erro: {ex}");
            }
        }
    }
}