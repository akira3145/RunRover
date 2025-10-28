using Microsoft.AspNetCore.Mvc;
using MongoDB.Bson;
using MongoDB.Bson.Serialization;
using Rover.Services;
using System.Threading.Tasks;

namespace Rover.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class TestController : ControllerBase
    {
        private readonly MongoService _mongoService;

        public TestController(MongoService mongoService)
        {
            _mongoService = mongoService;
        }

        [HttpGet("ping")]
        public async Task<IActionResult> PingDatabase()
        {
            // insert a test record sa mongodb
            await _mongoService.PingInsertAsync("test ping");

            // Retrieve the inserted record(s)
            var readResult = await _mongoService.PingReadAsync();

            // Convert BSON document(s) to plain JSON, then deserialize into a .NET object 
            var jsonResult = readResult.ToJson();
            var plainObject = BsonSerializer.Deserialize<object>(jsonResult);

            // Return clean, serializable JSON
            return Ok(new
            {
                message = "Ping successful",
                result = plainObject
            });
        }
    }
}
