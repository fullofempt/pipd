class UserData {
  final String middleName;
  final String firstName;
  final String lastName;
  final int age;

  UserData({
    required this.middleName,
    required this.firstName,
    required this.lastName,
    required this.age,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      middleName: json['middleName'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      age: json['age'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'middleName': middleName,
      'firstName': firstName,
      'lastName': lastName,
      'age': age,
    };
  }
}
class TaskData {
  final int id;
  final String taskName;
  final String taskImage;
  int answer;

  TaskData({
    required this.id,
    required this.taskName,
    required this.taskImage,
    required this.answer,
  });

  factory TaskData.fromJson(Map<String, dynamic> json) {
    return TaskData(
      id: json['id'],
      taskName: json['taskName'],
      taskImage: json['taskImage'],
      answer: json['answer'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'taskName': taskName,
      'taskImage': taskImage,
      'answer': answer,
    };
  }
}

