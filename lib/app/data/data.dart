class UserData {
  final String firstName;
  final String lastName;
  final String middleName;
  final int age;

  UserData({
    required this.firstName,
    required this.lastName,
    required this.middleName,
    required this.age,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      middleName: json['middleName'] ?? '',
      age: json['age'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'middleName': middleName,
      'age': age,
    };
  }
}
