import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/todo_app/data/DB.dart';
import 'package:todo_app/todo_app/data/data_repo.dart';
import 'package:todo_app/todo_app/providers/provider.dart';
import 'package:todo_app/todo_app/views/widgets/task_widget.dart';
import 'package:todo_app/todo_app/data/data_repo.dart';

class AllTasksScreen extends StatefulWidget {
  @override
  State<AllTasksScreen> createState() => _AllTasksScreenState();
}

class _AllTasksScreenState extends State<AllTasksScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount: Provider.of<DBProvider>(context).allTasks.length,
        itemBuilder: (context, index) {
          return TaskWidget(Provider.of<DBProvider>(context).allTasks[index]);
        });
  }
}
