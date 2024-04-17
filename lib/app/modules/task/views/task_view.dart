import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pipd/app/models/taskModel.dart';
import 'package:pipd/app/modules/task/controllers/task_controller.dart';
import 'package:pipd/app/routes/app_pages.dart';
import 'package:pipd/app/services/taskService.dart';
import 'package:pipd/widgets/taskWidget.dart';

class TaskView extends StatelessWidget {
  final TaskController _controller = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 206, 148),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.toNamed(Routes.MAIN);
          },
        ),
        title: Center(
          child: Image.asset(
            'assets/images/yar.png',
            height: AppBar().preferredSize.height - 10,
          ),
        ),
      ),
      body: Center(
        child: GetBuilder<TaskController>(
          builder: (_) => TaskWidget(
              task: _.taskList.isNotEmpty
                  ? _.taskList[_.currentTaskIndex]
                  : Task(
                      id: 0,
                      taskName: 'Название задания',
                      taskImage: 'assets/default_image.png')),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: _controller.previousTask,
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: _controller.nextTask,
            ),
          ],
        ),
      ),
    );
  }
}
