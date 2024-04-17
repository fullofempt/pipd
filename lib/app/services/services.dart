import 'dart:convert';
import 'package:pipd/app/data/data.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import 'package:pipd/app/data/task_data.dart';

class DataService {
  Future<String?> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/userData.json');
  }

  Future<void> _initializeUserData() async {
    final initialData = jsonEncode([]);
    final file = await _localFile;
    await file.writeAsString(initialData);
  }

  Future<void> writeUserData(UserData userData) async {
    final file = await _localFile;
    List<UserData> dataList = await readUserDataList();
    dataList.add(userData);
    String data = jsonEncode(dataList.map((e) => e.toJson()).toList());
    file.writeAsStringSync(data);
  }

  Future<void> saveUserData(UserData userData) async {
    final file = await _localFile;
    List<UserData> dataList = await readUserDataList();
    dataList.add(userData);
    String data = jsonEncode(dataList.map((e) => e.toJson()).toList());
    await file.writeAsString(data);
  }

  Future<void> deleteUserData(int index) async {
    final file = await _localFile;
    List<UserData> dataList = await readUserDataList();
    dataList.removeAt(index);
    String data = jsonEncode(dataList.map((e) => e.toJson()).toList());
    await file.writeAsString(data);
  }

  Future<List<UserData>> readUserDataList() async {
    try {
      final file = await _localFile;
      if (!file.existsSync()) {
        return [];
      }
      String contents = await file.readAsString();
      List<dynamic> jsonList = jsonDecode(contents) as List<dynamic>;
      List<UserData> dataList =
          jsonList.map((json) => UserData.fromJson(json)).toList();
      return dataList;
    } catch (e) {
      throw Exception("Error reading userData from disk: $e");
    }
  }

  Future<String?> readUserData() async {
    try {
      final file = await _localFile;
      if (!file.existsSync()) {
        return null;
      }
      String contents = await file.readAsString();
      return contents;
    } catch (e) {
      throw Exception("Error reading userData from disk: $e");
    }
  }

  // Future<void> addTaskToUser(int userId, int taskId, int answer) async {
  //   final file = await _localFile;
  //   List<UserData> dataList = await readUserDataList();
  //   UserData user = dataList.firstWhere((user) => user.id == userId);
  //   TaskData taskData = TaskData(
  //     id: taskId,
  //     taskName: tasks.firstWhere((task) => task.id == taskId).taskName,
  //     taskImage: tasks.firstWhere((task) => task.id == taskId).taskImage,
  //     answer: answer,
  //   );
  //   user.tasks.add(taskData);
  //   user.totalScore += answer;
  //   String data = jsonEncode(dataList.map((e) => e.toJson()).toList());
  //   await file.writeAsString(data);
  // }

  // Future<int> getTotalScore(int userId) async {
  //   List<UserData> dataList = await readUserDataList();
  //   UserData user = dataList.firstWhere((user) => user.id == userId);
  //   return user.totalScore;
  // }
}
