import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/constants.dart';
import 'package:todo/edit_text.dart';

class TaskModel {
  String id;
  String text;
  bool done;

  TaskModel({@required this.id, @required this.text, @required this.done});

  setData(bool check) {
    this.done = check;
  }

  updateData() {
    // this.title = _controller.text;
  }

  bool compareObject(TaskModel model) {
    if (this.id != model.id)
      return false;
    else if (this.text != model.text)
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
    margin: EdgeInsets.symmetric(vertical: 10.0),
    padding: EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(
              icon: Icon(Icons.drag_handle),
              onPressed: () {},
            ),
            Checkbox(
              value: todo.done,
              onChanged: (val) => status(),
              activeColor: Colors.grey[700],
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: editTextBox(
                  TextEditingController(text: "${todo.text}"), checkstyle),
            ),
          ],
        ),
      ],
    ),
  );
}
