using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Rover.Models;
using RunRover.Services;
using System.Collections.Generic;

namespace Rover.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class RunController : ControllerBase
    {
        private readonly RunSessionService _service;

        public RunController(RunSessionService service)
        {
            _service = service;
        }

        // POST /api/run/start
        [HttpPost("start")]
        public async Task<IActionResult> Start([FromBody] StartRunRequest req)
        {
            if (req == null || req.StartPoint == null)
                return BadRequest("Invalid payload.");

            // userId can be null/placeholder now; will be filled by auth later
            var session = await _service.StartRunAsync(req.UserId, req.StartPoint);
            return Ok(session);
        }

        // POST /api/run/update/{id}
        [HttpPost("update/{id}")]
        public async Task<IActionResult> Update(string id, [FromBody] GeoPoint point)
        {
            if (point == null) return BadRequest("Point required.");
            var ok = await _service.UpdateRunAsync(id, point);
            if (!ok) return NotFound();
            return Ok(new { message = "updated" });
        }

        // POST /api/run/end/{id}
        [HttpPost("end/{id}")]
        public async Task<IActionResult> End(string id, [FromBody] GeoPoint point)
        {
            if (point == null) return BadRequest("Point required.");
            var session = await _service.EndRunAsync(id, point);
            if (session == null) return NotFound();
            return Ok(session);
        }

        // GET /api/run/history/{userId}
        [HttpGet("history/{userId}")]
        public async Task<IActionResult> History(string userId)
        {
            var sessions = await _service.GetHistoryAsync(userId);
            return Ok(sessions);
        }

        // GET /api/run/{id}
        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(string id)
        {
            var session = await _service.GetByIdAsync(id);
            if (session == null) return NotFound();
            return Ok(session);
        }
    }

    public class StartRunRequest
    {
        public string UserId { get; set; }
        public GeoPoint StartPoint { get; set; }
    }
}
