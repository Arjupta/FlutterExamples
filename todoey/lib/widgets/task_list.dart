import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';
import 'task_tile.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return GestureDetector(
              onLongPress: () {
                taskData.deleteTask(index);
              },
              child: TaskTile(
                title: taskData.getTasks[index].name,
                isChecked: taskData.getTasks[index].isDone,
                toggleCheckbox: (newValue) {
                  taskData.toggleTask(index);
                },
              ),
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
