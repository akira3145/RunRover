using Microsoft.AspNetCore.Mvc;
using Rover.Models;
using Rover.Services;
using System.Threading.Tasks;
using Route = Rover.Models.Route;

namespace Rover.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class RobotController : ControllerBase
    {
        private readonly MongoService _mongoService;

        public RobotController(MongoService mongoService)
        {
            _mongoService = mongoService;
        }

        [HttpGet("route/{userId}")]
        public async Task<IActionResult> GetUserRoutes(string userId)
        {
            var routes = await _mongoService.GetRoutesByUserIdAsync(userId);
            return Ok(routes);
        }

        [HttpPost("route")]
        public async Task<IActionResult> CreateRoute([FromBody] Route route)
        {
            var created = await _mongoService.CreateRouteAsync(route);
            return Ok(created);
        }

        [HttpPost("history")]
        public async Task<IActionResult> CreateHistory([FromBody] History history)
        {
            var created = await _mongoService.CreateHistoryAsync(history);
            return Ok(created);
        }
    }
}
