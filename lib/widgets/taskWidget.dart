import 'package:flutter/material.dart';
import 'package:pipd/app/models/taskModel.dart';

class TaskWidget extends StatelessWidget {
  final Task task;

  TaskWidget({required this.task});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text(
            task.taskName,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            'Описание задания',
            style: TextStyle(fontSize: 18),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Image.asset(
            task.taskImage,
            height: 200,
            width: 200,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
