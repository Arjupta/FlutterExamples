import 'package:flutter/foundation.dart';
import 'task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(isDone: false, name: "Buy Milk"),
    Task(isDone: false, name: "Buy Eggs"),
    Task(isDone: false, name: "Buy Bread"),
  ];
}
