import 'package:flutter/material.dart';
import 'constants.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
    home: MyApp(),
  ));
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
