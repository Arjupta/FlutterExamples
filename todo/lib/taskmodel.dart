import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskModel {
  String id;
  String title;
  bool done;

  TaskModel({@required this.id, @required this.title, @required this.done});

  setData(bool check) {
    this.done = check;
  }

  bool compareObject(TaskModel model) {
    if (this.id != model.id)
      return false;
    else if (this.title != model.title)
      return false;
    else if (this.done != model.done)
      return false;
    else
      return true;
    // else if(model1.name != model2.name)
    // return false;
  }
}

Widget taskWidget(TaskModel todo, status()) {
  return Container(
    key: Key(todo.id),
    margin: EdgeInsets.all(10.0),
    padding: EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.drag_handle),
              onPressed: () {},
            ),
            SizedBox(
              width: 10.0,
            ),
            Checkbox(
              value: todo.done,
              onChanged: (val) => status(),
              activeColor: Colors.grey[700],
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              todo.title,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ],
    ),
  );
}
