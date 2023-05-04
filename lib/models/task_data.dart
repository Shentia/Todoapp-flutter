import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todoapp/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: "Buy Milk", isDone: false),
    Task(name: "Buy Eggs", isDone: false),
    Task(name: "Buy Bread", isDone: false),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void removeTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  int get taskCount {
    return _tasks.length;
  }
}
