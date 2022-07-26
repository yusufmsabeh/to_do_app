import 'package:flutter/material.dart';
import 'package:todo_app/todo_app/data/data_repo.dart';
import 'package:todo_app/todo_app/views/widgets/task_widget.dart';
import 'package:lottie/lottie.dart';

class CompleteTasksScreen extends StatelessWidget {
  List tasks;

  Function function;
  CompleteTasksScreen(this.function, this.tasks);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return tasks.where((element) => element.isComplete!).isEmpty
        ? Lottie.asset('assets/animations/empty.json')
        : ListView.builder(
            itemCount: tasks.where((element) => element.isComplete!).length,
            itemBuilder: (context, index) {
              return TaskWidget(
                  tasks.where((element) => element.isComplete!).toList()[index],
                  function);
            });
  }
}
