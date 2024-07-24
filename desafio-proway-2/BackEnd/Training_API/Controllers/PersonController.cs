using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Training_API.Data.Interfaces;
using Training_API.Models;

namespace Training_API.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class PersonController : ControllerBase
    {
        private readonly IRepository _repository;
        private readonly IPerson _person;
        public PersonController(IRepository repository, IPerson person)
        {
            this._repository = repository;
            this._person = person;
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            try
            {
                return Ok(
                    await _person.GetAllAsync()
                );
            }
            catch (Exception ex)
            {
                return BadRequest($"When getting the people, an error ocurred: {ex.Message}");
            }
        }

        [HttpGet("id={personId}")]
        public async Task<IActionResult> GetById(int personId)
        {
            try
            {
                return Ok(
                    await _person.GetByIdAsync(personId, includeRooms: true)
                );
            }
            catch (Exception ex)
            {
                return BadRequest($"When getting the person, an error ocurred: {ex.Message}");
            }
        }

        [HttpPost]
        public async Task<IActionResult> Post(Person person)
        {
            try
            {
                _repository.Add(person);
                if (await this._repository.SaveChangesAsync())
                {
                    return Ok(person);
                }
            }
            catch (Exception ex)
            {
                return BadRequest($"When posting the person, an error ocurred: {ex.Message}");
            }
            return BadRequest();
        }

        [HttpPut("id={personId}")]
        public async Task<IActionResult> Put(int personId, Person person)
        {
            try
            {
                var registeredPerson = await _person.GetByIdAsync(personId, includeRooms: false);
                if (registeredPerson == null)
                {
                    return NotFound();
                }
                _repository.Update(person);
                if (await _repository.SaveChangesAsync())
                {
                    return Ok(person);
                }
            }
            catch (Exception ex)
            {
                return BadRequest($"When updating the person, an error ocurred: {ex.Message}");
            }
            return BadRequest();
        }

        [HttpDelete("id={personId}")]
        public async Task<IActionResult> Delete(int personId)
        {
            try
            {
                var registeredPerson = await _person.GetByIdAsync(personId, includeRooms: false);
                if (registeredPerson == null)
                {
                    return NotFound();
                }
                _repository.Delete(registeredPerson);
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
                return BadRequest($"When deleting the person, an error ocurred: {ex.Message}");
            }
            return BadRequest();
        }
    }
}