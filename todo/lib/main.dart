import 'package:flutter/material.dart';
import 'constants.dart';
import 'taskmodel.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
    home: ReorderableApp(),
  ));
}

class ReorderableApp extends StatefulWidget {
  @override
  _ReorderableAppState createState() => _ReorderableAppState();
}

class _ReorderableAppState extends State<ReorderableApp> {
  List<TaskModel> list = [
    TaskModel(id: '1', title: 'Test 1', status: 'Employee', name: 'John'),
    TaskModel(id: '2', title: 'Test 2', status: 'Manager', name: 'Doe'),
    TaskModel(id: '3', title: 'Test 3', status: 'Customer', name: 'Foo'),
    TaskModel(id: '4', title: 'Test 4', status: 'Engineer', name: 'Bar'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reorderble List'),
      ),
      body: taskList(),
    );
  }

  Widget taskList() {
    return ReorderableListView(
      children: list.map((todo) => taskWidget(todo)).toList(),
      onReorder: (oldIndex, newIndex) {
        setState(() {
          final TaskModel item = list.removeAt(oldIndex);
          list.insert(newIndex, item);
        });
      },
    );
  }

  Widget taskWidget(TaskModel todo) {
    return Container(
      key: Key(todo.id),
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: const Color(0xFF66BB6A),
          boxShadow: [BoxShadow(blurRadius: 5.0)]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(todo.title),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ownerNameWidget(todo),
                statusWidget(todo),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List todos = List();
  String _input;

  @override
  void initState() {
    super.initState();
    todos.add("item1");
    todos.add("item2");
    todos.add("item3");
    todos.add("item4");
  }

  void addTodo() {
    setState(() {
      todos.add(_input);
      _input = null;
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "<Todo/>",
          style: kAppBarStyle,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Dismissible(
            key: Key(todos[index]),
            child: Card(
              margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                title: Text(todos[index]),
              ),
            ),
            onDismissed: (direction) {
              todos.removeAt(index);
            },
          );
        },
        itemCount: todos.length,
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Add Todo Item"),
                  content: TextField(
                    onChanged: (String val) {
                      _input = val;
                    },
                  ),
                  actions: [
                    FlatButton(onPressed: () => addTodo(), child: Text("Add"))
                  ],
                );
              },
            );
          }),
    );
  }
}
