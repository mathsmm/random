using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Training_API.Data.Interfaces;
using Training_API.Models;

namespace Training_API.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class RestTimeController : ControllerBase
    {
        private readonly IRepository _repository;
        private readonly IRestTime _restTime;
        public RestTimeController(IRepository repository, IRestTime restTime)
        {
            this._repository = repository;
            this._restTime = restTime;
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            try
            {
                return Ok(
                    await _restTime.GetAllAsync()
                );
            }
            catch (Exception ex)
            {
                return BadRequest($"When getting the rest time, an error ocurred: {ex.Message}");
            }
        }

        [HttpGet("id={restTimeId}")]
        public async Task<IActionResult> GetById(int restTimeId)
        {
            try
            {
                return Ok(
                    await _restTime.GetByIdAsync(restTimeId)
                );
            }
            catch (Exception ex)
            {
                return BadRequest($"When getting the rest time, an error ocurred: {ex.Message}");
            }
        }

        [HttpPost]
        public async Task<IActionResult> Post(RestTime restTime)
        {
            try
            {
                _repository.Add(restTime);
                if (await this._repository.SaveChangesAsync())
                {
                    return Ok(restTime);
                }
            }
            catch (Exception ex)
            {
                return BadRequest($"When posting the rest time, an error ocurred: {ex.Message}");
            }
            return BadRequest();
        }

        [HttpPut("id={restTimeId}")]
        public async Task<IActionResult> Put(int restTimeId, RestTime restTime)
        {
            try
            {
                var registeredRestTime = await _restTime.GetByIdAsync(restTimeId);
                if (registeredRestTime == null)
                {
                    return NotFound();
                }
                _repository.Update(restTime);
                if (await _repository.SaveChangesAsync())
                {
                    return Ok(restTime);
                }
            }
            catch (Exception ex)
            {
                return BadRequest($"When updating the rest time, an error ocurred: {ex.Message}");
            }
            return BadRequest();
        }

        [HttpDelete("id={restTimeId}")]
        public async Task<IActionResult> Delete(int restTimeId)
        {
            try
            {
                var registeredRestTime = await _restTime.GetByIdAsync(restTimeId);
                if (registeredRestTime == null)
                {
                    return NotFound();
                }
                _repository.Delete(registeredRestTime);
                if (await _repository.SaveChangesAsync())
                {
                    return Ok(
                        new {
                            message="Deleted!"
                        }
                    );
                }
            }
            catch (Exception ex)
            {
                return BadRequest($"When deleting the rest time, an error ocurred: {ex.Message}");
            }
            return BadRequest();
        }
    }
}