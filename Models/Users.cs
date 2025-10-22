using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;

namespace Rover.Models
{
    public class Users
    {
        [Key]
        public int userId { get; set; }

        [Required]
        public string email { get; set; } = "";

        [Required]
        public string passwordHash { get; set; } = ""; // store hashed password

        public string name { get; set; } = "";

        public string address { get; set; } = "";

        // phone as string (safe)
        public string phoneNo { get; set; } = "";

        // navigation
        public ICollection<Route> Routes { get; set; } = new List<Route>();
        public ICollection<History> Histories { get; set; } = new List<History>();

    }
}
