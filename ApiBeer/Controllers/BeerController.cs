using System;
using DAL.Models;
using DAL.Services;
using Microsoft.AspNetCore.Mvc;

namespace ApiBeer.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BeerController : ControllerBase
    {
        private BeerService _service;

        public BeerController()
        {
            _service = new BeerService();
        }

        [HttpGet]
        public IActionResult GetAll()
        {
            try
            {
                return Ok(_service.GetAll());
            } catch (Exception e)
            {
                return BadRequest(e.Message);
            }
        }

        [HttpGet("{Id:int}")]
        public IActionResult GetById(int Id)
        {
            return Ok(_service.GetById(Id));
        }

        [HttpPost]
        public IActionResult Add(Beer beer)
        {
            try
            {
                _service.Insert(beer);
            }
            catch (Exception e)
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
            }
            else
            {
                return BadRequest("Id non trouvé");
            }
        }

        [HttpPut]
        public IActionResult Update(Beer beer)
        {
            try
            {
                _service.Update(beer);
            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }

            return Ok("Update effectuée");
        }
    }
}
