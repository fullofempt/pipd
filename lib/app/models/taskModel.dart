class Task {
  final int id;
  final String taskName;
  final String taskImage;

  Task({required this.id, required this.taskName, required this.taskImage});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      taskName: json['taskName'],
      taskImage: json['taskImage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'taskName': taskName,
      'taskImage': taskImage,
    };
  }
}
