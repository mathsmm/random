using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Training_API.Data.Interfaces;
using Training_API.Models;

namespace Training_API.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class TrainingRoomController : ControllerBase
    {
        private readonly IRepository _repository;
        private readonly ITrainingRoom _trainingRoom;
        public TrainingRoomController(IRepository repository, ITrainingRoom trainingRoom)
        {
            this._repository = repository;
            this._trainingRoom = trainingRoom;
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            try
            {
                return Ok(
                    await _trainingRoom.GetAllAsync()
                );
            }
            catch (Exception ex)
            {
                return BadRequest($"When getting the training rooms, an error ocurred: {ex.Message}");
            }
        }

        [HttpGet("id={trainingRoomId}")]
        public async Task<IActionResult> GetById(int trainingRoomId)
        {
            try
            {
                return Ok(
                    await _trainingRoom.GetByIdAsync(trainingRoomId, includePeople: true)
                );
            }
            catch (Exception ex)
            {
                return BadRequest($"When getting the training room, an error ocurred: {ex.Message}");
            }
        }

        [HttpPost]
        public async Task<IActionResult> Post(TrainingRoom trainingRoom)
        {
            try
            {
                _repository.Add(trainingRoom);
                if (await this._repository.SaveChangesAsync())
                {
                    return Ok(trainingRoom);
                }
            }
            catch (Exception ex)
            {
                return BadRequest($"When posting the training room, an error ocurred: {ex.Message}");
            }
            return BadRequest();
        }

        [HttpPut("id={trainingRoomId}")]
        public async Task<IActionResult> Put(int trainingRoomId, TrainingRoom trainingRoom)
        {
            try
            {
                var registeredTrainingRoom = await _trainingRoom.GetByIdAsync(trainingRoomId, includePeople: false);
                if (registeredTrainingRoom == null)
                {
                    return NotFound();
                }
                _repository.Update(trainingRoom);
                if (await _repository.SaveChangesAsync())
                {
                    return Ok(trainingRoom);
                }
            }
            catch (Exception ex)
            {
                return BadRequest($"When updating the training room, an error ocurred: {ex.Message}");
            }
            return BadRequest();
        }

        [HttpDelete("id={trainingRoomId}")]
        public async Task<IActionResult> Delete(int trainingRoomId)
        {
            try
            {
                var registeredTrainingRoom = await _trainingRoom.GetByIdAsync(trainingRoomId, includePeople: false);
                if (registeredTrainingRoom == null)
                {
                    return NotFound();
                }
                _repository.Delete(registeredTrainingRoom);
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
                return BadRequest($"When deleting the training room, an error ocurred: {ex.Message}");
            }
            return BadRequest();
        }
    }
}