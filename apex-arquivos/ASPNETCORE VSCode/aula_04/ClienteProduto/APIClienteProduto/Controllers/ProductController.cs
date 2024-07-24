using System;
using System.Threading.Tasks;
using APIClienteProduto.Data.Repository.Interfaces;
using APIClienteProduto.Models;
using Microsoft.AspNetCore.Mvc;

namespace APIClienteProduto.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ProductController : ControllerBase
    {
        private readonly IRepositoryProduct _repositoryProduct;
        private readonly IRepository _repository;
        public ProductController(IRepositoryProduct repositoryProduct, IRepository repository)
        {
            this._repositoryProduct = repositoryProduct;
            this._repository = repository;
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            try
            {
                var result = await _repositoryProduct.GetAllAsync();
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest($"Erro: {ex.Message}");
            }
        }

        [HttpGet("{productId}")]
        public async Task<IActionResult> GetById(int productId)
        {
            try
            {
                var result = await _repositoryProduct.GetByIdAsync(productId);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest($"Erro: {ex.Message}");
            }
        }

        [HttpGet("client={clientId}")]
        public async Task<IActionResult> GetByClientId(int clientId)
        {
            try
            {
                var result = await this._repositoryProduct.GetByClientIdAsync(clientId);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest($"Erro: {ex.Message}");
            }
        }

        [HttpPost]
        public async Task<IActionResult> Post(Product modelProduct)
        {
            try
            {
                _repository.Add(modelProduct);

                if (!await _repository.SaveChangesAsync())
                {
                    return BadRequest("Didn't save the product!");
                }
                return Ok(modelProduct);
            }
            catch (Exception ex)
            {
                return BadRequest($"Erro: {ex.Message}");
            }
        }

        [HttpPut("{productId}")]
        public async Task<IActionResult> Put(int productId, Product modelProduct)
        {
            try
            {
                var product = await _repositoryProduct.GetByIdAsync(productId);

                if (product == null)
                {
                    return NotFound("Didn't find any product!");
                }

                _repository.Update(modelProduct);

                if (!await _repository.SaveChangesAsync())
                {
                    return BadRequest("Didn't save the product!");
                }
                return Ok(modelProduct);
            }
            catch (Exception ex)
            {
                return BadRequest($"Erro: {ex.Message}");
            }
        }

        [HttpDelete("{productId}")]
        public async Task<IActionResult> Delete (int productId)
        {
            try
            {
                var product = await _repositoryProduct.GetByIdAsync(productId);

                if (product == null)
                {
                    return NotFound();
                }

                _repository.Delete(product);

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