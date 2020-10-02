import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo/edit_text.dart';
import 'constants.dart';
import 'taskmodel.dart';

class ClassTaskPage extends StatefulWidget {
  final int id;
  final String className;
  ClassTaskPage({@required this.id, @required this.className});
  @override
  _ClassTaskPageState createState() => _ClassTaskPageState();
}

class _ClassTaskPageState extends State<ClassTaskPage> {
  List<TaskModel> list, listcpy;
  TextEditingController _desc;

  @override
  void initState() {
    super.initState();
    _desc = TextEditingController(text: "${widget.className} description");
    list = [
      TaskModel(id: '1', title: '${widget.className} 1', done: true),
      TaskModel(id: '2', title: '${widget.className} 2', done: false),
      TaskModel(id: '3', title: '${widget.className} 3', done: false),
      TaskModel(id: '4', title: '${widget.className} 4', done: false),
    ];
    listcpy = [
      TaskModel(id: '1', title: '${widget.className} 1', done: true),
      TaskModel(id: '2', title: '${widget.className} 2', done: false),
      TaskModel(id: '3', title: '${widget.className} 3', done: false),
      TaskModel(id: '4', title: '${widget.className} 4', done: false),
    ];
    // list.addAll(listcpy);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text('${widget.className}'),
        backgroundColor: gradientEnd,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 18.0, left: 18.0),
        child: Column(
          children: [
            // Text("${widget.className} description text will be here"),
            editTextBox(_desc, descstyle),
            Expanded(
              child: taskList(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // bool toUpdate = false;
    // list.forEach((element) {
    //   int index = list.indexOf(element);
    //   if (element.compareObject(listcpy.elementAt(index))) toUpdate = true;
    // });
    print(listEquals(list, listcpy));

    // if (toUpdate)
    //   print(true);
    // else
    //   print(false);
    _desc.text;
    // list.map((todo) => todo.updateData());
    super.dispose();
  }

  Widget taskList() {
    return Theme(
        data: ThemeData(canvasColor: backgroundColor),
        child: ReorderableListView(
          children: list
              .map((todo) => taskWidget(todo, () {
                    setState(() {
                      todo.setData(!todo.done);
                    });
                  }))
              .toList(),
          onReorder: (oldIndex, newIndex) {
            setState(() {
              // final TaskModel item = list.removeAt(oldIndex);
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
              // list.insert(newIndex, item);
            });
          },
        ));
  }
}
