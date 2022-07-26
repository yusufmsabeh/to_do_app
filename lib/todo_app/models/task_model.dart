import 'package:todo_app/todo_app/data/DB.dart';

class TaskModel {
  String? title;
  bool? isComplete;
  TaskModel({
    required this.title,
    this.isComplete = false,
  });
  TaskModel.fromMap(Map<String, dynamic> json) {
    title = json[Connection.taskNameColumn];
    isComplete = json[Connection.taskCompleteColumn] == 1 ? true : false;
  }

  Map<String, dynamic> toMap(TaskModel taskModel) {
    return {
      Connection.taskNameColumn: title,
      Connection.taskCompleteColumn: isComplete
    };
  }
}
