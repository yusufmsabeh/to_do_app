import 'package:flutter/material.dart';
import 'package:todo_app/todo_app/data/data_repo.dart';
import 'package:todo_app/todo_app/views/widgets/task_widget.dart';

class InCompleteTasksScreen extends StatelessWidget {
  List tasks;
  Function function;
  InCompleteTasksScreen(this.function, this.tasks);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount: tasks.where((element) => !element.isComplete!).length,
        itemBuilder: (context, index) {
          return TaskWidget(
              tasks.where((element) => !element.isComplete!).toList()[index],
              function);
        });
  }
}
