import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';
import 'task_tile.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
              title: taskData.tasks[index].name,
              isChecked: taskData.tasks[index].isDone,
              toggleCheckbox: (newValue) {
                // setState(() {
                //   Provider.of<TaskData>(context).tasks[index].toggleDone();
                // });
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
