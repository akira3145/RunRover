using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Rover.Models
{
    public class Route
    {
        [Key]
        public int RouteId { get; set; }

        public string Name { get; set; } = "";

        // coordinates or serialized path (JSON) - adapt as needed
        public string PathJson { get; set; } = "";

        public DateTime CreatedAt { get; set; } = DateTime.UtcNow;

        // owner
        public int UsersId { get; set; }
        [ForeignKey(nameof(UsersId))]
        public Users User { get; set; }
    }
}

