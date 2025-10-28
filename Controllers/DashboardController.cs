using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Rover.Models;

namespace Rover.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    [Authorize]
    public class DashboardController : ControllerBase
    {
        private readonly ApiDbContext _db;
        public DashboardController(ApiDbContext db) => _db = db;

        // Basic overview for a user
        [HttpGet("overview/{userId}")]
        public async Task<IActionResult> Overview(int userId)
        {
            var totalDistance = await _db.Histories.Where(h => h.UsersId == userId).SumAsync(h => (double?)h.DistanceMeters) ?? 0;
            var totalRuns = await _db.Histories.CountAsync(h => h.UsersId == userId);
            var avgSpeed = await _db.Histories.Where(h => h.UsersId == userId && h.DurationSeconds > 0).AverageAsync(h => (double?)h.Speed) ?? 0;

            return Ok(new
            {
                totalDistanceMeters = totalDistance,
                totalRuns,
                averageSpeed = avgSpeed
            });
        }
    }
}
