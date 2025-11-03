class Rover {
  final String id;
  final double speed;        // current speed in m/s or km/h
  final double batteryLevel; // %
  final String status;       // e.g., "idle", "running", "charging"
  final double distance;     // total distance covered

  Rover({
    required this.id,
    required this.speed,
    required this.batteryLevel,
    required this.status,
    required this.distance,
  });

  factory Rover.fromJson(Map<String, dynamic> json) {
    return Rover(
      id: json['id'],
      speed: json['speed'],
      batteryLevel: json['batteryLevel'],
      status: json['status'],
      distance: json['distance'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'speed': speed,
      'batteryLevel': batteryLevel,
      'status': status,
      'distance': distance,
    };
  }
}
