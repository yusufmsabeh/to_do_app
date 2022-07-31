import 'package:flutter/cupertino.dart';
import 'package:todo_app/todo_app/data/DB.dart';
import 'package:todo_app/todo_app/models/task_model.dart';
import 'package:todo_app/todo_app/views/screens/incomplete_tasks_screen.dart';

class DBProvider extends ChangeNotifier {
  List<TaskModel> allTasks = [];
  List<TaskModel> CompleteTasks = [];
  List<TaskModel> InCompleteTasks = [];
  DBProvider() {
    selectAllTasks();
  }
  fillTasks(List<TaskModel> allTasks, List<TaskModel> completeTasks,
      List<TaskModel> inCompleteTask) {
    this.allTasks = allTasks;
    this.CompleteTasks = completeTasks;
    this.InCompleteTasks = inCompleteTask;
    notifyListeners();
  }

  createNewTask(TaskModel taskModel) async {
    await Connection.connection.insertOneTask(taskModel);
    selectAllTasks();
  }

  selectAllTasks() async {
    List<TaskModel> allTasks = await Connection.connection.selectAllTask();
    List<TaskModel> allCompleteTasks =
        await Connection.connection.selectCompletedTasks();
    List<TaskModel> allInCompleteTasks =
        await Connection.connection.selectIncompletedTasks();

    fillTasks(allTasks, allCompleteTasks, allInCompleteTasks);
  }

  updateComplete(TaskModel taskModel) async {
    taskModel.ChangeIsComplete();
    await Connection.connection.UpdateComplete(taskModel);
    selectAllTasks();
  }

  deleteTask(int id) {}
}
