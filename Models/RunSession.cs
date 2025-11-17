using System;
using System.Collections.Generic;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace Rover.Models
{
    public class RunSession
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public string Id { get; set; }

        // keep as string for now will be linked to user id after auth is added
        public string UserId { get; set; }

        public DateTime StartTime { get; set; }
        public DateTime? EndTime { get; set; }

        // meters
        public double TotalDistance { get; set; } = 0;

        public List<GeoPoint> Route { get; set; } = new();

        // "Active" or "Completed"
        public string Status { get; set; } = "Active";

        public DateTime CreatedAt { get; set; } = DateTime.UtcNow;

        public GeoPoint StartLocation { get; set; }
        public GeoPoint EndLocation { get; set; }
    }
}
