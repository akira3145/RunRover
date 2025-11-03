class Command {
  final String action;   // e.g. "start", "stop", "setSpeed"
  final double? value;   // optional (for things like speed)

  Command({
    required this.action,
    this.value,
  });

  Map<String, dynamic> toJson() {
    return {
      'action': action,
      'value': value,
    };
  }
}
