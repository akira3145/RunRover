using Microsoft.AspNetCore.Mvc;
using Rover.Models;
using Rover.Services;

namespace Rover.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly MongoService _mongoService;

        public UsersController(MongoService mongoService)
        {
            _mongoService = mongoService;
        }

        // GET: api/Users
        [HttpGet]
        public async Task<ActionResult<IEnumerable<User>>> GetUsers()
        {
            var users = await _mongoService.GetAllUsersAsync();
            return Ok(users);
        }

        // GET: api/Users/{id}
        [HttpGet("{id}")]
        public async Task<ActionResult<User>> GetUser(string id)
        {
            var user = await _mongoService.GetUserByIdAsync(id);

            if (user == null)
                return NotFound(new { message = "User not found" });

            return Ok(user);
        }

        // POST: api/Users
        [HttpPost]
        public async Task<ActionResult<User>> PostUser(User user)
        {
            await _mongoService.SetUserWithIdAsync(user);
            return CreatedAtAction(nameof(GetUser), new { id = user.Id }, user);
        }

        // PUT: api/Users/{id}
        [HttpPut("{id}")]
        public async Task<IActionResult> PutUser(string id, User updatedUser)
        {
            var existingUser = await _mongoService.GetUserByIdAsync(id);
            if (existingUser == null)
                return NotFound(new { message = "User not found" });

            // update only relevant fields
            existingUser.Name = updatedUser.Name;
            existingUser.Email = updatedUser.Email;
            existingUser.Address = updatedUser.Address;
            existingUser.PhoneNo = updatedUser.PhoneNo;

            await _mongoService.UpdateUserAsync(id, existingUser);
            return NoContent();
        }

        // DELETE: api/Users/{id}
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteUser(string id)
        {
            var user = await _mongoService.GetUserByIdAsync(id);
            if (user == null)
                return NotFound(new { message = "User not found" });

            await _mongoService.DeleteUserAsync(id);
            return NoContent();
        }
    }
}
