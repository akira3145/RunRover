
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace Rover.Models
{
    public class History
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public string? Id { get; set; }

        // compatibility property requested by controllers
        [BsonIgnore]
        public string? HistoryId => Id;

        [BsonElement("userId")]
        public string? UserId { get; set; }

        [BsonElement("distanceMeters")]
        public double DistanceMeters { get; set; }

        [BsonElement("durationSeconds")]
        public double DurationSeconds { get; set; }

        [BsonElement("speed")]
        public double Speed { get; set; }

        [BsonElement("timestamp")]
        public DateTime Timestamp { get; set; } = DateTime.UtcNow;
    }
}
