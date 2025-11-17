using Microsoft.Extensions.Configuration;
using MongoDB.Driver;
using Rover.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace RunRover.Services
{
    public class RunSessionService
    {
        private readonly IMongoCollection<RunSession> _runSessions;

        public RunSessionService(IConfiguration config)
        {
            var conn = config["MongoDB:ConnectionString"] ?? config["ConnectionStrings:MongoDb"];
            if (string.IsNullOrWhiteSpace(conn))
                throw new ArgumentException("MongoDB connection string not found in configuration.");

            var dbName = config["MongoDB:Database"] ?? "runroverdb";
            var client = new MongoClient(conn);
            var database = client.GetDatabase(dbName);
            _runSessions = database.GetCollection<RunSession>("RunSessions");
        }

        public async Task<RunSession> StartRunAsync(string userId, GeoPoint start)
        {
            var session = new RunSession
            {
                UserId = userId,
                StartTime = DateTime.UtcNow,
                StartLocation = start,
                Route = new List<GeoPoint> { start }
            };

            await _runSessions.InsertOneAsync(session);
            return session;
        }

        public async Task<bool> UpdateRunAsync(string id, GeoPoint newPoint)
        {
            var session = await _runSessions.Find(s => s.Id == id).FirstOrDefaultAsync();
            if (session == null) return false;

            // add point
            session.Route.Add(newPoint);

            if (session.Route.Count > 1)
            {
                var prev = session.Route[session.Route.Count - 2];
                session.TotalDistance += Haversine(prev, newPoint);
            }

            var replaceResult = await _runSessions.ReplaceOneAsync(s => s.Id == id, session);
            return replaceResult.IsAcknowledged;
        }

        public async Task<RunSession> EndRunAsync(string id, GeoPoint end)
        {
            var session = await _runSessions.Find(s => s.Id == id).FirstOrDefaultAsync();
            if (session == null) return null;

            session.Status = "Completed";
            session.EndTime = DateTime.UtcNow;
            session.EndLocation = end;

            if (!session.Route.Any() || session.Route.Last().Timestamp != end.Timestamp)
                session.Route.Add(end);

            if (session.Route.Count > 1)
            {
                var prev = session.Route[session.Route.Count - 2];
                session.TotalDistance += Haversine(prev, end);
            }

            await _runSessions.ReplaceOneAsync(s => s.Id == id, session);
            return session;
        }

        public async Task<List<RunSession>> GetHistoryAsync(string userId)
        {
            return await _runSessions.Find(s => s.UserId == userId).SortByDescending(s => s.StartTime).ToListAsync();
        }

        public async Task<RunSession> GetByIdAsync(string id)
        {
            return await _runSessions.Find(s => s.Id == id).FirstOrDefaultAsync();
        }

        private double Haversine(GeoPoint a, GeoPoint b)
        {
            double R = 6371000; // earth radius in meters
            var lat1 = DegreesToRadians(a.Latitude);
            var lat2 = DegreesToRadians(b.Latitude);
            var dLat = lat2 - lat1;
            var dLon = DegreesToRadians(b.Longitude - a.Longitude);

            var sinDLat = Math.Sin(dLat / 2);
            var sinDLon = Math.Sin(dLon / 2);

            var h = sinDLat * sinDLat +
                    Math.Cos(lat1) * Math.Cos(lat2) *
                    sinDLon * sinDLon;

            return R * 2 * Math.Asin(Math.Min(1, Math.Sqrt(h)));
        }

        private double DegreesToRadians(double deg) => deg * Math.PI / 180.0;
    }
}
