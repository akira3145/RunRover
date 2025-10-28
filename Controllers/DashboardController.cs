
using Microsoft.AspNetCore.Mvc;
using Rover.Services;

namespace Rover.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class DashboardController : ControllerBase
    {
        private readonly MongoService _mongo;
        public DashboardController(MongoService mongo) => _mongo = mongo;

        [HttpGet("info")]
        public IActionResult Info() => Ok(new { db = _mongo.GetDatabaseName() });
    }
}
