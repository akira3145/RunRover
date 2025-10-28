
using Microsoft.AspNetCore.Mvc;
using Rover.Dtos;
using Rover.Models;
using Rover.Services;

namespace Rover.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AuthController : ControllerBase
    {
        private readonly MongoService _mongo;
        public AuthController(MongoService mongo)
        {
            _mongo = mongo;
        }

        [HttpPost("register")]
        public async Task<IActionResult> Register([FromBody] RegisterDto dto)
        {
            var user = new User
            {
                Email = dto.Email,
                Name = dto.Name,
                Address = dto.Address,
                PhoneNo = dto.PhoneNo,
                PasswordHash = dto.Password // for demo only; do not store plain passwords
            };
            await _mongo.CreateUserAsync(user);
            return Ok(new { message = "Registered", userId = user.Id });
        }
    }
}
