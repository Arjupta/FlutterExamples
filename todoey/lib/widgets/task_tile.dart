import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String title;
  final Function toggleCheckbox;
  TaskTile({this.isChecked, this.title, this.toggleCheckbox});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        onChanged: toggleCheckbox,
        value: isChecked,
      ),
    );
  }
}

// void checkboxCallback(bool checkboxState) {
//     setState(() {
//       isChecked = checkboxState;
//     });
//   }

class TaskCheckBox extends StatelessWidget {
  const TaskCheckBox({
    @required this.isChecked,
    @required this.toggleCheckbox,
  });

  final bool isChecked;
  final Function toggleCheckbox;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      onChanged: toggleCheckbox,
    );
  }
}
