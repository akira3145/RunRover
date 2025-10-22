using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Rover.Models
{
    public class History
    {
        [Key]
        public int HistoryId { get; set; }

        public DateTime Timestamp { get; set; } = DateTime.UtcNow;

        // distance in meters
        public double DistanceMeters { get; set; }

        // duration in seconds
        public double DurationSeconds { get; set; }

        // speed used (could be average)
        public double Speed { get; set; }

        public int UsersId { get; set; }
        [ForeignKey(nameof(UsersId))]
        public Users User { get; set; }
    }
}
