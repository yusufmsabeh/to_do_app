import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo_app/todo_app/data/DB.dart';
import 'package:todo_app/todo_app/data/data_repo.dart';
import 'package:todo_app/todo_app/models/task_model.dart';
import 'package:todo_app/todo_app/views/screens/all_tasks_screen.dart';
import 'package:todo_app/todo_app/views/screens/completed_tasks_screen.dart';
import 'package:todo_app/todo_app/views/screens/incomplete_tasks_screen.dart';
import 'package:todo_app/todo_app/views/screens/new_task_screen.dart';

class MainTodoPage extends StatefulWidget {
  @override
  State<MainTodoPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainTodoPage>
    with SingleTickerProviderStateMixin {
  List tasks = [];
  List completeTasks = [];
  List incompleteTasks = [];

  RefreshData() async {
    tasks = await Connection.connection.selectAllTask();
    completeTasks = await Connection.connection.selectCompletedTasks();
    incompleteTasks = await Connection.connection.selectIncompletedTasks();

    setState(() {});
  }

  changeTaskStatus(TaskModel taskModel) async {
    int index = tasks.indexOf(taskModel);
    tasks[index].isComplete = !tasks[index].isComplete!;
    await Connection.connection.UpdateComplete(taskModel);

    RefreshData();
  }

  changeTaskStatusComplete(TaskModel taskModel) async {
    int index = completeTasks.indexOf(taskModel);
    completeTasks[index].isComplete = !completeTasks[index].isComplete!;
    await Connection.connection.UpdateComplete(taskModel);

    RefreshData();
  }

  changeTaskStatusInComplete(TaskModel taskModel) async {
    int index = incompleteTasks.indexOf(taskModel);
    incompleteTasks[index].isComplete = !incompleteTasks[index].isComplete!;
    await Connection.connection.UpdateComplete(taskModel);

    RefreshData();
  }

  removeTask(TaskModel taskModel) {
    tasks.remove(taskModel);

    setState(() {});
  }

  setStateAfterAddNewTask() async {
    await RefreshData();
  }

  TabController? tabController;
  initTabBar() {
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initTabBar();
    RefreshData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo app'),
        bottom: TabBar(controller: tabController!, tabs: const [
          Tab(
            icon: Icon(Icons.list),
          ),
          Tab(
            icon: Icon(Icons.done),
          ),
          Tab(
            icon: Icon(Icons.cancel),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => NewTaskScreen(RefreshData))));
        },
      ),
      body: TabBarView(controller: tabController!, children: [
        AllTasksScreen(changeTaskStatus, tasks),
        CompleteTasksScreen(changeTaskStatusComplete, completeTasks),
        InCompleteTasksScreen(changeTaskStatusInComplete, incompleteTasks)
      ]),
    );
  }
}
