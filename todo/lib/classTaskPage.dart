import 'package:flutter/material.dart';
import 'package:todo/classModel.dart';
import 'package:todo/edit_text.dart';
import 'package:collection/collection.dart';
import 'constants.dart';
import 'taskmodel.dart';

class ClassTaskPage extends StatefulWidget {
  final ClassModel todo;
  ClassTaskPage({this.todo});

  @override
  _ClassTaskPageState createState() => _ClassTaskPageState();
}

class _ClassTaskPageState extends State<ClassTaskPage> {
  String classCode;
  String className;
  String classDesc;
  List<TaskModel> list;
  List<TaskModel> listcpy;
  TextEditingController _descController;
  Function isEqual = const ListEquality().equals;

  @override
  void initState() {
    super.initState();
    classCode = widget.todo.classCode;
    className = widget.todo.className;
    classDesc = widget.todo.classDesc;
    list = [
      TaskModel(id: '1', text: '$className 1', done: true),
      TaskModel(id: '2', text: '$className 2', done: false),
      TaskModel(id: '3', text: '$className 3', done: false),
      TaskModel(id: '4', text: '$className 4', done: false),
    ];
    listcpy = List.from(list);
    _descController = TextEditingController(text: classDesc);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text('$className'),
        backgroundColor: gradientEnd,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 18.0, left: 18.0),
        child: Column(
          children: [
            // Text("${widget.className} description text will be here"),
            editTextBox(_descController, descstyle),
            Expanded(
              child: taskList(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            list.add(
              TaskModel(
                id: "${list.length + 1}",
                text: "$className ${list.length + 1}",
                done: false,
              ),
            );
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.greenAccent,
      ),
      // floatingActionButton: new Visibility(
      //   visible: _isVisible,
      //   child: new FloatingActionButton(
      //     onPressed: _incrementCounter,
      //     tooltip: 'Increment',
      //     child: new Icon(Icons.add),
      //   ),
      // ),
    );
  }

  @override
  void dispose() {
    bool toUpdate = false;
    // list.forEach((element) {
    //   int index = list.indexOf(element);
    //   if (element.compareObject(listcpy.elementAt(index))) toUpdate = true;
    // });
    if (classDesc != _descController.text) {
      widget.todo.classDesc = _descController.text;
      toUpdate = true;
    } else if (!isEqual(list, listcpy)) {
      toUpdate = true;
    }
    // } else
    if (!list[0].compareObject(listcpy[0])) toUpdate = true;
    print(toUpdate.toString());
    _descController.dispose();
    super.dispose();
  }

  Widget taskList() {
    return Theme(
      data: ThemeData(canvasColor: backgroundColor),
      child: ReorderableListView(
        children: list
            .map((todo) => TaskWidget(
                  todo: todo,
                  key: Key(todo.id),
                  status: (bool toDelete) {
                    if (toDelete)
                      setState(() {
                        list.remove(todo);
                      });
                    else
                      setState(() {});
                  },
                ))
            .toList(),
        onReorder: (oldIndex, newIndex) {
          setState(() {
            print("Index $oldIndex, $newIndex");
            TaskModel old = list[oldIndex];
            if (oldIndex > newIndex) {
              for (int i = oldIndex; i > newIndex; i--) {
                list[i] = list[i - 1];
              }
              list[newIndex] = old;
            } else {
              for (int i = oldIndex; i < newIndex - 1; i++) {
                list[i] = list[i + 1];
              }
              list[newIndex - 1] = old;
            }
          });
        },
      ),
    );
  }
}
