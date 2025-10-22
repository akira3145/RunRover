using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using Rover.Dtos;
using Rover.Models;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace Rover.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AuthController : ControllerBase
    {
        private readonly ApiDbContext _db;
        private readonly IConfiguration _config;
        private readonly PasswordHasher<Users> _hasher;

        public AuthController(ApiDbContext db, IConfiguration config)
        {
            _db = db;
            _config = config;
            _hasher = new PasswordHasher<Users>();
        }

        [HttpPost("register")]
        public async Task<IActionResult> Register([FromBody] RegisterDto dto)
        {
            var existing = await _db.Users.FirstOrDefaultAsync(u => u.email == dto.Email);
            if (existing != null) return BadRequest(new { message = "Email already exists" });

            var user = new Users
            {
                email = dto.Email,
                name = dto.Name,
                address = dto.Address,
                phoneNo = dto.PhoneNo
            };
            user.passwordHash = _hasher.HashPassword(user, dto.Password);

            _db.Users.Add(user);
            await _db.SaveChangesAsync();

            return Ok(new { message = "Registered", userId = user.userId });
        }

        [HttpPost("login")]
        public async Task<IActionResult> Login([FromBody] LoginDto dto)
        {
            var user = await _db.Users.FirstOrDefaultAsync(u => u.email == dto.Email);
            if (user == null) return Unauthorized(new { message = "Invalid credentials" });

            var result = _hasher.VerifyHashedPassword(user, user.passwordHash, dto.Password);
            if (result == PasswordVerificationResult.Failed) return Unauthorized(new { message = "Invalid credentials" });

            // generate JWT
            var token = GenerateJwt(user);
            return Ok(new { token });
        }

        [HttpPost("forgot-password")]
        public async Task<IActionResult> ForgotPassword([FromBody] ForgotPasswordDto dto)
        {
            var user = await _db.Users.FirstOrDefaultAsync(u => u.email == dto.Email);
            if (user == null) return NotFound(new { message = "No user with that email" });

            // For demo: create a simple one-time token (in a real app you should store token and expiration and email it)
            var resetToken = Guid.NewGuid().ToString();
            // TODO: save this token to database with expiry and send via email
            return Ok(new { message = "Reset token created (you should email it to user)", resetToken });
        }

        private string GenerateJwt(Users user)
        {
            var jwtSection = _config.GetSection("Jwt");
            var key = jwtSection.GetValue<string>("Key");
            var issuer = jwtSection.GetValue<string>("Issuer");
            var audience = jwtSection.GetValue<string>("Audience");
            var expiresMinutes = jwtSection.GetValue<int>("ExpiresMinutes");

            var claims = new[]
            {
                new Claim(JwtRegisteredClaimNames.Sub, user.userId.ToString()),
                new Claim(JwtRegisteredClaimNames.Email, user.email ?? ""),
                new Claim("name", user.name ?? "")
            };

            var keyBytes = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(key));
            var creds = new SigningCredentials(keyBytes, SecurityAlgorithms.HmacSha256);

            var token = new JwtSecurityToken(issuer, audience, claims,
                expires: DateTime.UtcNow.AddMinutes(expiresMinutes), signingCredentials: creds);

            return new JwtSecurityTokenHandler().WriteToken(token);
        }
    }
}
