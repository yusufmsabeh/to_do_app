import 'package:flutter/material.dart';
import 'package:todo_app/todo_app/models/task_model.dart';

class TaskWidget extends StatelessWidget {
  TaskModel taskModel;
  Function function;
  TaskWidget(this.taskModel, this.function);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: CheckboxListTile(
        value: taskModel.isComplete,
        onChanged: (v) {
          function(taskModel);
        },
        title: Text(taskModel.title!),
      ),
    );
  }
}
