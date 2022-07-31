import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/todo_app/data/data_repo.dart';
import 'package:todo_app/todo_app/views/widgets/task_widget.dart';
import 'package:lottie/lottie.dart';

import '../../providers/provider.dart';

class CompleteTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Provider.of<DBProvider>(context).CompleteTasks.isEmpty
        ? Lottie.asset('assets/animations/empty.json')
        : ListView.builder(
            itemCount: Provider.of<DBProvider>(context).CompleteTasks.length,
            itemBuilder: (context, index) {
              return TaskWidget(
                  Provider.of<DBProvider>(context).CompleteTasks[index]);
            });
  }
}
