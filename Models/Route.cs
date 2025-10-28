
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace Rover.Models
{
    public class Route
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public string? Id { get; set; }

        [BsonElement("userId")]
        public string UserId { get; set; } = string.Empty;

        [BsonElement("routeName")]
        public string RouteName { get; set; } = string.Empty;

        [BsonElement("pathJson")]
        public string PathJson { get; set; } = string.Empty;

        [BsonElement("distance")]
        public double Distance { get; set; }

        [BsonElement("difficulty")]
        public string Difficulty { get; set; } = string.Empty;
    }
}
