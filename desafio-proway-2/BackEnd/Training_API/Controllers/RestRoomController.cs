using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Training_API.Data.Interfaces;
using Training_API.Models;

namespace Training_API.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class RestRoomController : ControllerBase
    {
        private readonly IRepository _repository;
        private readonly IRestRoom _restRoom;
        public RestRoomController(IRepository repository, IRestRoom restRoom)
        {
            this._repository = repository;
            this._restRoom = restRoom;
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            try
            {
                return Ok(
                    await _restRoom.GetAllAsync()
                );
            }
            catch (Exception ex)
            {
                return BadRequest($"When getting the rest rooms, an error ocurred: {ex.Message}");
            }
        }

        [HttpGet("id={restRoomId}")]
        public async Task<IActionResult> GetById(int restRoomId)
        {
            try
            {
                return Ok(
                    await _restRoom.GetByIdAsync(restRoomId, includePeople: true)
                );
            }
            catch (Exception ex)
            {
                return BadRequest($"When getting the rest room, an error ocurred: {ex.Message}");
            }
        }

        [HttpPost]
        public async Task<IActionResult> Post(RestRoom restRoom)
        {
            try
            {
                _repository.Add(restRoom);
                if (await this._repository.SaveChangesAsync())
                {
                    return Ok(restRoom);
                }
            }
            catch (Exception ex)
            {
                return BadRequest($"When posting the rest room, an error ocurred: {ex.Message}");
            }
            return BadRequest();
        }

        [HttpPut("id={restRoomId}")]
        public async Task<IActionResult> Put(int restRoomId, RestRoom restRoom)
        {
            try
            {
                var registeredRestRoom = await _restRoom.GetByIdAsync(restRoomId, includePeople: false);
                if (registeredRestRoom == null)
                {
                    return NotFound();
                }
                _repository.Update(restRoom);
                if (await _repository.SaveChangesAsync())
                {
                    return Ok(restRoom);
                }
            }
            catch (Exception ex)
            {
                return BadRequest($"When updating the rest room, an error ocurred: {ex.Message}");
            }
            return BadRequest();
        }

        [HttpDelete("id={restRoomId}")]
        public async Task<IActionResult> Delete(int restRoomId)
        {
            try
            {
                var registeredRestRoom = await _restRoom.GetByIdAsync(restRoomId, includePeople: false);
                if (registeredRestRoom == null)
                {
                    return NotFound();
                }
                _repository.Delete(registeredRestRoom);
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
                return BadRequest($"When deleting the rest room, an error ocurred: {ex.Message}");
            }
            return BadRequest();
        }
    }
}