using System;
using DAL.Models;
using DAL.Services;
using Microsoft.AspNetCore.Mvc;

namespace ApiBeer.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private UserService _service;

        public UserController()
        {
            _service = new UserService();
        }

        [HttpGet]
        public IActionResult GetAll()
        {
            return Ok(_service.GetAll());
        }

        [HttpGet("{Id:int}")]
        public IActionResult GetById(int Id)
        {
            return Ok(_service.GetById(Id));
        }

        [HttpPost]
        public IActionResult Add(User user)
        {
            try
            {
                _service.Insert(user);
            } catch (Exception e)
            {
                return BadRequest(e.Message);
            }

            return Ok("Insertion effectué");
        }

        [HttpDelete("{Id:int}")]
        public IActionResult Delete(int Id)
        {
            if (_service.Delete(Id))
            {
                return Ok("Suppression effectuée");
            } else
            {
                return BadRequest("Id non trouvé");
            }
        }

        [HttpPut]
        public IActionResult Update(User user)
        {
            try
            {
                _service.Update(user);
            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }
            
            return Ok("Update effectuée");
        }

    }
}
