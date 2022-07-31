import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/todo_app/models/task_model.dart';
import 'package:todo_app/todo_app/providers/provider.dart';

class TaskWidget extends StatelessWidget {
  TaskModel taskModel;

  TaskWidget(this.taskModel);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: CheckboxListTile(
        value: taskModel.isComplete,
        onChanged: (v) {
          Provider.of<DBProvider>(context, listen: false)
              .updateComplete(taskModel);
        },
        title: Text(taskModel.title!),
      ),
    );
  }
}
