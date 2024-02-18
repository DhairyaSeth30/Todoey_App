import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';

class TaskData extends ChangeNotifier{
  List<Task> _tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),
    Task(name: 'Buy banana'),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addTask(String newString){
    final task = Task(name: newString);
    _tasks.add(task);

    notifyListeners();
  }
  
  void updateTask(Task task){
    task.toggleDone();

    notifyListeners();
  }

  void deleteTask(Task task){
    _tasks.remove(task);

    notifyListeners();
  }

}