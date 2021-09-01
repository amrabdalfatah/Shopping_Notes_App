class Lists {
  final int id;
  final String name;
  final int priority;

  Lists({
    required this.id,
    required this.name,
    required this.priority,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'priority': priority,
    };
  }
}
