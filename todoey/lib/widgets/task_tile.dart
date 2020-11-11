import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  // TaskTile({});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("List Tile"),
      trailing: Checkbox(
        value: false,
        onChanged: (value) {},
      ),
    );
  }
}
