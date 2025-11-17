using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace Rover.Models
{
    public class User
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public string Id { get; set; } = null!;

        [BsonElement("email")]
        public string Email { get; set; } = null!;

        [BsonElement("name")]
        public string? Name { get; set; }

        [BsonElement("address")]
        public string? Address { get; set; }

        [BsonElement("phoneNo")]
        public string? PhoneNo { get; set; }

        // Nullable for Google-only users
        [BsonElement("passwordHash")]
        public string? PasswordHash { get; set; }
    }
}
