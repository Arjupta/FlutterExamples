import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/constants.dart';
import 'package:todo/edit_text.dart';

class TaskModel {
  String id;
  String text;
  bool done;
  DateTime date;
  TaskModel(
      {@required this.id,
      @required this.text,
      @required this.done,
      this.date}) {
    this.date = DateTime.now();
  }

  setBool(bool check) {
    this.done = check;
  }

  setText(String text) {
    this.text = text;
  }

  @override
  bool operator ==(other) {
    return (other is TaskModel) &&
        other.text == text &&
        other.done == done &&
        other.id == id;
  }

  @override
  int get hashCode => text.hashCode ^ done.hashCode ^ id.hashCode;

  bool compareObject(TaskModel model) {
    print((this.id != model.id).toString() + "_");
    print((this.text != model.text).toString() + "__");
    print((this.done != model.done).toString() + "___");

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

class TaskWidget extends StatefulWidget {
  final TaskModel todo;
  final Key key;
  final Function status;
  const TaskWidget({this.todo, this.key, this.status}) : super(key: key);
  @override
  _TaskWidgetState createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  TextEditingController _controller;
  bool _isWriting = false;

  @override
  void initState() {
    super.initState();
    // todo = widget.todo;
    _controller = TextEditingController(text: "${widget.todo.text}");
    _controller.addListener(() {
      widget.todo.setText(_controller.text);
      if (!_isWriting) {
        setState(() {
          _isWriting = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: widget.key,
      margin: EdgeInsets.symmetric(vertical: 10.0),
      padding: EdgeInsets.symmetric(vertical: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            icon: Icon(Icons.drag_handle),
            onPressed: () {},
          ),
          Checkbox(
            value: widget.todo.done,
            onChanged: (val) {
              widget.todo.setBool(val);
              setState(() {});
            },
            activeColor: Colors.grey[700],
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                editTextBox(_controller, checkstyle),
                SizedBox(height: 5),
                Text("${widget.todo.date.day}/${widget.todo.date.month}")
              ],
            ),
          ),
          Visibility(
              visible: _isWriting,
              child: IconButton(
                  icon: Icon(_isWriting ? Icons.check : Icons.delete),
                  onPressed: () {
                    if (_isWriting) {
                      setState(() {
                        _isWriting = !_isWriting;
                      });
                      widget.status(toDelete: false);
                    } else {
                      widget.status(toDelete: true);
                    }
                  })),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

Widget taskWidget(TaskModel todo, status()) {
  TextEditingController _controller =
      TextEditingController(text: "${todo.text}");
  _controller.addListener(() {
    todo.setText(_controller.text);
    // status();
  });
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
              onChanged: (val) {
                todo.setBool(val);
                status();
              },
              activeColor: Colors.grey[700],
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: editTextBox(_controller, checkstyle),
            ),
          ],
        ),
      ],
    ),
  );
}
