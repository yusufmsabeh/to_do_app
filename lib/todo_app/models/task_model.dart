import 'package:todo_app/todo_app/data/DB.dart';

class TaskModel {
  int? id;
  String? title;
  bool? isComplete;
  TaskModel({
    required this.title,
    this.isComplete = false,
  });
  TaskModel.fromMap(Map<String, dynamic> json) {
    id = json[Connection.taskID];
    title = json[Connection.taskNameColumn];
    isComplete = json[Connection.taskCompleteColumn] == 1 ? true : false;
  }

  copy(int id) {
    this.id = id;
  }

  Map<String, dynamic> toMap() {
    return {
      Connection.taskNameColumn: title,
      Connection.taskCompleteColumn: isComplete! ? 1 : 0
    };
  }
}
