import 'package:get/get.dart';
import 'package:pipd/app/models/taskModel.dart';
import 'package:pipd/app/services/taskService.dart';

class TaskController extends GetxController {
  final TaskService _taskService = TaskService();
  late List<Task> taskList = [];
  int currentTaskIndex = 0;

  @override
  void onInit() {
    super.onInit();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    taskList = await _taskService.readTaskList();
    update();
  }

  void nextTask() {
    currentTaskIndex = (currentTaskIndex + 1) % taskList.length;
    update();
  }

  void previousTask() {
    currentTaskIndex =
        (currentTaskIndex - 1 + taskList.length) % taskList.length;
    update();
  }

  void addTaskToUser() {
    // Здесь вы можете добавить код для добавления задания пользователю в json
    // Например, получить текущего пользователя и добавить задание к его записи
  }
}
