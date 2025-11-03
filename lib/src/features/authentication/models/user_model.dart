class Runner {
  final String id;
  final String name;
  final int age;
  final double targetPace; // runner's target pace in min/km

  Runner({
    required this.id,
    required this.name,
    required this.age,
    required this.targetPace,
  });

  factory Runner.fromJson(Map<String, dynamic> json) {
    return Runner(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      targetPace: json['targetPace'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'targetPace': targetPace,
    };
  }
}
