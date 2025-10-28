
namespace Rover.Dtos
{
    public record SetRouteDto(string UserId, string RouteName, string PathJson);
    public record HistoryDto(string UserId, double DistanceMeters, double DurationSeconds, double Speed);
}
