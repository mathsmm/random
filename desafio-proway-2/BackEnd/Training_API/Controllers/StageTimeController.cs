using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Training_API.Data.Interfaces;
using Training_API.Models;

namespace Training_API.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class StageTimeController : ControllerBase
    {
        private readonly IRepository _repository;
        private readonly IStageTime _stageTime;
        public StageTimeController(IRepository repository, IStageTime stageTime)
        {
            this._repository = repository;
            this._stageTime = stageTime;
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            try
            {
                return Ok(
                    await _stageTime.GetAllAsync()
                );
            }
            catch (Exception ex)
            {
                return BadRequest($"When getting the stage time, an error ocurred: {ex.Message}");
            }
        }

        [HttpGet("id={stageTimeId}")]
        public async Task<IActionResult> GetById(int stageTimeId)
        {
            try
            {
                return Ok(
                    await _stageTime.GetByIdAsync(stageTimeId)
                );
            }
            catch (Exception ex)
            {
                return BadRequest($"When getting the stage time, an error ocurred: {ex.Message}");
            }
        }

        [HttpPost]
        public async Task<IActionResult> Post(StageTime stageTime)
        {
            try
            {
                _repository.Add(stageTime);
                if (await this._repository.SaveChangesAsync())
                {
                    return Ok(stageTime);
                }
            }
            catch (Exception ex)
            {
                return BadRequest($"When posting the stage time, an error ocurred: {ex.Message}");
            }
            return BadRequest();
        }

        [HttpPut("id={stageTimeId}")]
        public async Task<IActionResult> Put(int stageTimeId, StageTime stageTime)
        {
            try
            {
                var registeredStageTime = await _stageTime.GetByIdAsync(stageTimeId);
                if (registeredStageTime == null)
                {
                    return NotFound();
                }
                _repository.Update(stageTime);
                if (await _repository.SaveChangesAsync())
                {
                    return Ok(stageTime);
                }
            }
            catch (Exception ex)
            {
                return BadRequest($"When updating the stage time, an error ocurred: {ex.Message}");
            }
            return BadRequest();
        }

        [HttpDelete("id={stageTimeId}")]
        public async Task<IActionResult> Delete(int stageTimeId)
        {
            try
            {
                var registeredStageTime = await _stageTime.GetByIdAsync(stageTimeId);
                if (registeredStageTime == null)
                {
                    return NotFound();
                }
                _repository.Delete(registeredStageTime);
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
                return BadRequest($"When deleting the stage time, an error ocurred: {ex.Message}");
            }
            return BadRequest();
        }
    }
}