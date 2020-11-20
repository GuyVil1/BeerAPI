using System;
using DAL.Models;
using DAL.Services;
using Microsoft.AspNetCore.Mvc;

namespace ApiBeer.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BrandController : ControllerBase
    {
        private BrandService _service;

        public BrandController()
        {
            _service = new BrandService();
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
        public IActionResult Add(Brand brand)
        {
            try
            {
                _service.Insert(brand);
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
        public IActionResult Update(Brand brand)
        {
            try
            {
                _service.Update(brand);
            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }

            return Ok("Update effectuée");
        }
    }
}
