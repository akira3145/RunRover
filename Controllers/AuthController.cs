using Microsoft.AspNetCore.Mvc;
using Rover.Dtos;
using Rover.Models;
using Rover.Services;
using BCrypt.Net;
using Google.Apis.Auth;

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

        // Register
        [HttpPost("register")]
        public async Task<IActionResult> Register([FromBody] RegisterDto dto)
        {
            var existingUser = await _mongo.GetUserByEmailAsync(dto.Email);
            if (existingUser != null)
                return BadRequest(new { message = "Email already exists" });

            var hashedPassword = BCrypt.Net.BCrypt.HashPassword(dto.Password);

            var user = new User
            {
                Email = dto.Email,
                Name = dto.Name,
                Address = dto.Address,
                PhoneNo = dto.PhoneNo,
                PasswordHash = hashedPassword
            };

            await _mongo.CreateUserAsync(user);
            return Ok(new { message = "Registered", userId = user.Id });
        }

        // Login
        [HttpPost("login")]
        public async Task<IActionResult> Login([FromBody] LoginDto dto)
        {
            var user = await _mongo.GetUserByEmailAsync(dto.Email);
            if (user == null) return Unauthorized(new { message = "Invalid email" });

            if (user.PasswordHash == null)
                return BadRequest(new { message = "User registered via Google. Please use Google login." });

            bool validPassword = BCrypt.Net.BCrypt.Verify(dto.Password, user.PasswordHash);
            if (!validPassword) return Unauthorized(new { message = "Invalid password" });

            return Ok(new { message = "Login successful", userId = user.Id });
        }

        // google login verifeir frontend ata
        [HttpPost("google-token")]
        public async Task<IActionResult> GoogleTokenLogin([FromBody] GoogleTokenDto dto)
        {
            GoogleJsonWebSignature.ValidationSettings settings = new GoogleJsonWebSignature.ValidationSettings()
            {
                Audience = new List<string> { "LAGAY DITO GOOGLE CLIENT ID" }
            };

            GoogleJsonWebSignature.Payload payload;
            try
            {
                payload = await GoogleJsonWebSignature.ValidateAsync(dto.IdToken, settings);
            }
            catch
            {
                return Unauthorized(new { message = "Invalid Google token" });
            }

            var email = payload.Email;

            var user = await _mongo.GetUserByEmailAsync(email);
            if (user == null)
            {
                user = new User
                {
                    Email = email,
                    Name = payload.Name,
                    PasswordHash = null // Google-user, no password
                };

                await _mongo.CreateUserAsync(user);
            }

            return Ok(new { message = "Google login successful", userId = user.Id });
        }
    }
}
