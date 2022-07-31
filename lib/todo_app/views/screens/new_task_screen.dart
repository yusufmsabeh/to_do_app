import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/todo_app/data/DB.dart';
import 'package:todo_app/todo_app/data/data_repo.dart';
import 'package:todo_app/todo_app/models/task_model.dart';
import 'package:todo_app/todo_app/providers/provider.dart';

class NewTaskScreen extends StatelessWidget {
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
                  TaskModel taskModel = TaskModel(title: content);
                  Provider.of<DBProvider>(context, listen: false)
                      .createNewTask(taskModel);
                  Navigator.pop(context);
                },
                child: Text('Add New Task'))
          ],
        ));
  }
}
