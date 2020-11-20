import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(isDone: false, name: "Buy Milk"),
    Task(isDone: false, name: "Buy Eggs"),
    Task(isDone: false, name: "Buy Bread"),
  ];

  int get taskCount {
    return _tasks.length;
  }

  UnmodifiableListView<Task> get getTasks {
    return UnmodifiableListView(_tasks);
  }

  void addTask(String taskName) {
    this._tasks.add(Task(name: taskName));
    notifyListeners();
  }

  void toggleTask(int index) {
    _tasks[index].toggleDone();
    notifyListeners();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }

  int undoneTasks() {
    return Task.incompletedTasks(_tasks);
  }
}
