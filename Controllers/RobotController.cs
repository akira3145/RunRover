using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Rover.Dtos;
using Rover.Models;

namespace Rover.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    [Authorize]
    public class RobotController : ControllerBase
    {
        private readonly ApiDbContext _db;
        public RobotController(ApiDbContext db) => _db = db;

        // Set robot speed
        [HttpPost("set-speed")]
        public async Task<IActionResult> SetSpeed([FromBody] SetSpeedDto dto)
        {
            // In a real system this would call a service that instructs the robot (MQTT / HTTP / socket)
            // We'll just create a small history record denoting speed change
            var user = await _db.Users.FindAsync(dto.UserId);
            if (user == null) return NotFound();

            var history = new History
            {
                UsersId = dto.UserId,
                Speed = dto.Speed,
                DistanceMeters = 0,
                DurationSeconds = 0
            };
            _db.Histories.Add(history);
            await _db.SaveChangesAsync();

            return Ok(new { message = "Speed updated (simulated)", dto.Speed });
        }

        // Save a route
        [HttpPost("set-route")]
        public async Task<IActionResult> SetRoute([FromBody] SetRouteDto dto)
        {
            var user = await _db.Users.FindAsync(dto.UserId);
            if (user == null) return NotFound();

            var route = new Rover.Models.Route
            {
                Name = dto.RouteName,
                PathJson = dto.PathJson,
                UsersId = dto.UserId
            };
            _db.Routes.Add(route);
            await _db.SaveChangesAsync();

            return Ok(new { message = "Route saved", routeId = route.RouteId });
        }

        // Get routes for a user
        [HttpGet("routes/{userId}")]
        public async Task<IActionResult> GetRoutes(int userId)
        {
            var routes = await _db.Routes.Where(r => r.UsersId == userId).ToListAsync();
            return Ok(routes);
        }

        // Save history record (distance & time after a run)
        [HttpPost("history")]
        public async Task<IActionResult> SaveHistory([FromBody] HistoryDto dto)
        {
            var user = await _db.Users.FindAsync(dto.UserId);
            if (user == null) return NotFound();

            var history = new History
            {
                UsersId = dto.UserId,
                DistanceMeters = dto.DistanceMeters,
                DurationSeconds = dto.DurationSeconds,
                Speed = dto.Speed
            };
            _db.Histories.Add(history);
            await _db.SaveChangesAsync();

            return Ok(new { message = "History saved", historyId = history.HistoryId });
        }
    }
}
