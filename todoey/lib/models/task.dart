class Task {
  final String name;
  bool isDone;

  Task({this.name, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }

  static int incompletedTasks(List<Task> tasks) {
    int taskCount = 0;
    for (Task task in tasks) {
      if (!task.isDone) taskCount++;
    }
    return taskCount;
  }
}
