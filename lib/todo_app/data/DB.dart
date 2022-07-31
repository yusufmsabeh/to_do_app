import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todo_app/todo_app/models/task_model.dart';
import 'package:todo_app/todo_app/views/screens/completed_tasks_screen.dart';

class Connection {
  Connection._();
  static final tabelName = 'task';
  static final taskID = 'task_id';
  static final taskNameColumn = 'task_name';
  static final taskCompleteColumn = 'task_complete';

  static Connection connection = Connection._();
  Database? database;

  initDatabase() async {
    database = await createDataBase();
  }

  Future<Database> createDataBase() async {
    String databasePath = await getDatabasesPath();
    print("----------------" + databasePath);
    String databaseName = 'todo_app6';
    String path = join(databasePath, databaseName);

    Database database = await openDatabase(path,
        onCreate: _onCreate, version: 1, onOpen: _onOpen);
    return database;
  }

  _onCreate(Database database, int version) {
    database.execute(''' 
      CREATE TABLE $tabelName (
        $taskID INTEGER PRIMARY KEY AUTOINCREMENT,
        $taskNameColumn TEXT,
        $taskCompleteColumn INTEGER

      )
    ''');

    log("Database Created  ");
  }

  _onOpen(Database db) {
    log("Database opened  ${db.toString()} ");
  }

  insertOneTask(TaskModel taskModel) async {
    int id = await database!.insert(tabelName, taskModel.toMap());
    taskModel.copy(id);
  }

  Future<List<TaskModel>> selectAllTask() async {
    List allTasks = await database!.query(tabelName);
    print(allTasks);
    return allTasks.map((e) {
      return TaskModel.fromMap(e);
    }).toList();
  }

  Future<List<TaskModel>> selectCompletedTasks() async {
    List allTasks =
        await database!.query(tabelName, where: '$taskCompleteColumn=1');

    return allTasks.map((e) {
      return TaskModel.fromMap(e);
    }).toList();
  }

  Future<List<TaskModel>> selectIncompletedTasks() async {
    List allTasks =
        await database!.query(tabelName, where: '$taskCompleteColumn=0');

    return allTasks.map((e) {
      return TaskModel.fromMap(e);
    }).toList();
  }

  UpdateComplete(TaskModel taskModel) async {
    int count = await database!.update(tabelName, taskModel.toMap(),
        where: "$taskID=?", whereArgs: [taskModel.id]);
  }
  // deleteTask(int id) async{
  //   await database!.delete(tabelName,where: ("$"))
  // }
}
