class Session {
  final String id;
  final String runnerId;
  final double totalDistance;
  final double averageSpeed;
  final DateTime startTime;
  final DateTime endTime;

  Session({
    required this.id,
    required this.runnerId,
    required this.totalDistance,
    required this.averageSpeed,
    required this.startTime,
    required this.endTime,
  });

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      id: json['id'],
      runnerId: json['runnerId'],
      totalDistance: json['totalDistance'],
      averageSpeed: json['averageSpeed'],
      startTime: DateTime.parse(json['startTime']),
      endTime: DateTime.parse(json['endTime']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'runnerId': runnerId,
      'totalDistance': totalDistance,
      'averageSpeed': averageSpeed,
      'startTime': startTime.toIso8601String(),
      'endTime': endTime.toIso8601String(),
    };
  }
}
