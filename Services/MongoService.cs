using MongoDB.Driver;
using MongoDB.Bson;
using Microsoft.Extensions.Configuration;
using System.Collections.Generic;
using System.Threading.Tasks;
using Rover.Models;
using Route = Rover.Models.Route;

namespace Rover.Services
{
    public class MongoService
    {
        private readonly IMongoDatabase _database;

        public MongoService(IConfiguration configuration)
        {
            var connectionString = configuration.GetConnectionString("MongoDb")
                ?? "mongodb://localhost:27017";
            var databaseName = configuration["MongoDbDatabase"]
                ?? "runroverdb";

            var client = new MongoClient(connectionString);
            _database = client.GetDatabase(databaseName);
        }

        // ===========================
        // Collections
        // ===========================
        private IMongoCollection<User> Users => _database.GetCollection<User>("Users");
        private IMongoCollection<Route> Routes => _database.GetCollection<Route>("Routes");
        private IMongoCollection<History> History => _database.GetCollection<History>("History");

        // ===========================
        // General / Diagnostics
        // ===========================
        public string GetDatabaseName() => _database.DatabaseNamespace.DatabaseName;

        public async Task PingInsertAsync(string? message = null)
        {
            var doc = new BsonDocument
            {
                { "ping", message ?? "insert" },
                { "time", System.DateTime.UtcNow }
            };
            await _database.GetCollection<BsonDocument>("Ping").InsertOneAsync(doc);
        }

        public async Task<BsonDocument?> PingReadAsync()
        {
            return await _database.GetCollection<BsonDocument>("Ping")
                .Find(new BsonDocument())
                .Sort(Builders<BsonDocument>.Sort.Descending("_id"))
                .FirstOrDefaultAsync();
        }

        // ===========================
        // USERS
        // ===========================
        public async Task<List<User>> GetAllUsersAsync()
        {
            return await Users.Find(_ => true).ToListAsync();
        }

        public async Task<User?> GetUserByIdAsync(string id)
        {
            return await Users.Find(u => u.Id == id).FirstOrDefaultAsync();
        }

        public async Task<User?> GetUserByEmailAsync(string email)
        {
            return await Users.Find(u => u.Email == email).FirstOrDefaultAsync();
        }

        public async Task<User> CreateUserAsync(User user)
        {
            await Users.InsertOneAsync(user);
            return user;
        }

        public async Task SetUserWithIdAsync(User user)
        {
            await Users.InsertOneAsync(user);
        }

        public async Task UpdateUserAsync(User user)
        {
            await Users.ReplaceOneAsync(u => u.Id == user.Id, user);
        }

        // Overload to support (id, user)
        public async Task UpdateUserAsync(string id, User updatedUser)
        {
            updatedUser.Id = id;
            await Users.ReplaceOneAsync(u => u.Id == id, updatedUser);
        }

        public async Task DeleteUserAsync(string id)
        {
            await Users.DeleteOneAsync(u => u.Id == id);
        }

        // ===========================
        // ROUTES
        // ===========================
        public async Task<Route> CreateRouteAsync(Route route)
        {
            await Routes.InsertOneAsync(route);
            return route;
        }

        public async Task<List<Route>> GetRoutesByUserIdAsync(string userId)
        {
            return await Routes.Find(r => r.UserId == userId).ToListAsync();
        }

        public async Task<Route?> GetRouteByIdAsync(string id)
        {
            return await Routes.Find(r => r.Id == id).FirstOrDefaultAsync();
        }

        // ===========================
        // HISTORY
        // ===========================
        public async Task<History> CreateHistoryAsync(History history)
        {
            await History.InsertOneAsync(history);
            return history;
        }
    }
}
