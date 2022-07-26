import 'package:flutter/material.dart';
import 'package:todo_app/todo_app/data/DB.dart';
import 'package:todo_app/todo_app/data/data_repo.dart';
import 'package:todo_app/todo_app/models/task_model.dart';

class NewTaskScreen extends StatelessWidget {
  Function function;
  NewTaskScreen(this.function);
  String content = "";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            TextField(
              onChanged: (v) {
                content = v;
              },
            ),
            ElevatedButton(
                onPressed: () async {
                  await Connection.connection
                      .insertOneTask(TaskModel(title: content));
                  function();
                  Navigator.pop(context);
                },
                child: Text('Add New Task'))
          ],
        ));
  }
}
