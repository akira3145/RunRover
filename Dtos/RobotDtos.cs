namespace Rover.Dtos
{
    public record SetSpeedDto(int UserId, double Speed);
    public record SetRouteDto(int UserId, string RouteName, string PathJson);
    public record HistoryDto(int UserId, double DistanceMeters, double DurationSeconds, double Speed);
}
