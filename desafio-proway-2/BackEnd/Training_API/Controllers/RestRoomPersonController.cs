using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Training_API.Data.Interfaces;
using Training_API.Models;

namespace Training_API.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class RestRoomPersonController : ControllerBase
    {
        private readonly IRepository _repository;
        private readonly IRestRoomPerson _restRoomPerson;
        public RestRoomPersonController(IRepository repository, IRestRoomPerson restRoomPerson)
        {
            this._repository = repository;
            this._restRoomPerson = restRoomPerson;
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            try
            {
                return Ok(
                    await _restRoomPerson.GetAllAsync()
                );
            }
            catch (Exception ex)
            {
                return BadRequest($"When getting the restroom_person, an error ocurred: {ex.Message}");
            }
        }

        [HttpGet("id={restRoomPersonId}")]
        public async Task<IActionResult> GetById(int restRoomPersonId)
        {
            try
            {
                return Ok(
                    await _restRoomPerson.GetByIdAsync(restRoomPersonId)
                );
            }
            catch (Exception ex)
            {
                return BadRequest($"When getting the restroom_person, an error ocurred: {ex.Message}");
            }
        }

        [HttpGet("roomid={restRoomId}")]
        public async Task<IActionResult> GetByRoomId(int restRoomId)
        {
            try
            {
                return Ok(
                    await _restRoomPerson.GetByRoomId(restRoomId)
                );
            }
            catch (Exception ex)
            {
                return BadRequest($"When getting the restroom_person, an error ocurred: {ex.Message}");
            }
        }

        [HttpGet("personid={personId}")]
        public async Task<IActionResult> GetByPersonId(int personId)
        {
            try
            {
                return Ok(
                    await _restRoomPerson.GetByPersonId(personId)
                );
            }
            catch (Exception ex)
            {
                return BadRequest($"When getting the restroom_person, an error ocurred: {ex.Message}");
            }
        }

        [HttpPost]
        public async Task<IActionResult> Post(RestRoomPerson restRoomPerson)
        {
            try
            {
                _repository.Add(restRoomPerson);
                if (await this._repository.SaveChangesAsync())
                {
                    return Ok(restRoomPerson);
                }
            }
            catch (Exception ex)
            {
                return BadRequest($"When posting the restroom_person, an error ocurred: {ex.Message}");
            }
            return BadRequest();
        }

        [HttpPut("id={restRoomPersonId}")]
        public async Task<IActionResult> Put(int restRoomPersonId, RestRoomPerson restRoomPerson)
        {
            try
            {
                var registeredRestRoomPerson = await _restRoomPerson.GetByIdAsync(restRoomPersonId);
                if (registeredRestRoomPerson == null)
                {
                    return NotFound();
                }
                _repository.Update(restRoomPerson);
                if (await _repository.SaveChangesAsync())
                {
                    return Ok(restRoomPerson);
                }
            }
            catch (Exception ex)
            {
                return BadRequest($"When updating the restroom_person, an error ocurred: {ex.Message}");
            }
            return BadRequest();
        }

        [HttpDelete("id={restRoomPersonId}")]
        public async Task<IActionResult> Delete(int restRoomPersonId)
        {
            try
            {
                var registeredRestRoomPerson = await _restRoomPerson.GetByIdAsync(restRoomPersonId);
                if (registeredRestRoomPerson == null)
                {
                    return NotFound();
                }
                _repository.Delete(registeredRestRoomPerson);
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
                return BadRequest($"When deleting the restroom_person, an error ocurred: {ex.Message}");
            }
            return BadRequest();
        }
    }
}