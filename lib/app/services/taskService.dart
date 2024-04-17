import 'dart:convert';
import 'package:pipd/app/data/task_data.dart';
import 'package:pipd/app/models/taskModel.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class TaskService {
  Future<String?> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/tasks.json');
  }

  Future<void> _initializeTasks() async {
    String data = jsonEncode(tasks.map((e) => e.toJson()).toList());
    final file = await _localFile;
    await file.writeAsString(data);
  }

  Future<void> addTask(Task task) async {
    final file = await _localFile;
    List<Task> taskList = await readTaskList();
    taskList.add(task);
    String data = jsonEncode(taskList.map((e) => e.toJson()).toList());
    await file.writeAsString(data);
  }

  Future<List<Task>> readTaskList() async {
    try {
      final file = await _localFile;
      if (!file.existsSync()) {
        await _initializeTasks();
      }
      String contents = await file.readAsString();
      List<dynamic> jsonList = jsonDecode(contents) as List<dynamic>;
      List<Task> taskList = jsonList.map((json) => Task.fromJson(json)).toList();
      return taskList;
    } catch (e) {
      throw Exception("Error reading tasks from disk: $e");
    }
  }
}
