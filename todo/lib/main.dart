import 'package:flutter/material.dart';
import 'taskmodel.dart';
import 'classModel.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.light(),
    home: ClassPage(),
  ));
}

class ClassPage extends StatelessWidget {
  final List<ClassModel> list = [
    ClassModel(classId: "1", className: "MA-102"),
    ClassModel(classId: "2", className: "CHE-201"),
    ClassModel(classId: "3", className: "CHE-202"),
    ClassModel(classId: "4", className: "MA-201"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Classes"),
          backgroundColor: Colors.greenAccent,
        ),
        body:
            Container(margin: EdgeInsets.only(top: 10.0), child: classList()));
  }

  Widget classList() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return classWidget(list.elementAt(index), context, index);
      },
      itemCount: list.length,
    );
  }
}

class ReorderableApp extends StatefulWidget {
  @override
  _ReorderableAppState createState() => _ReorderableAppState();
}

class _ReorderableAppState extends State<ReorderableApp> {
  List<TaskModel> list, listcpy;

  @override
  void initState() {
    super.initState();
    list = [
      TaskModel(id: '1', title: 'Test 1', done: true),
      TaskModel(id: '2', title: 'Test 2', done: false),
      TaskModel(id: '3', title: 'Test 3', done: false),
      TaskModel(id: '4', title: 'Test 4', done: false),
    ];
    listcpy = list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reorderble List'),
      ),
      body: taskList(),
    );
  }

  @override
  void dispose() {
    print(list == listcpy ? "true" : "false");
    super.dispose();
  }

  Widget taskList() {
    return ReorderableListView(
      children: list
          .map((todo) => taskWidget(todo, () {
                setState(() {
                  todo.setData(!todo.done);
                  print(list == listcpy ? "true" : "false");
                });
              }))
          .toList(),
      onReorder: (oldIndex, newIndex) {
        setState(() {
          final TaskModel item = list.removeAt(oldIndex);
          list.insert(newIndex, item);
        });
      },
    );
  }
}

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   List todos = List();
//   String _input;

//   @override
//   void initState() {
//     super.initState();
//     todos.add("item1");
//     todos.add("item2");
//     todos.add("item3");
//     todos.add("item4");
//   }

//   void addTodo() {
//     setState(() {
//       todos.add(_input);
//       _input = null;
//       Navigator.pop(context);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "<Todo/>",
//           style: kAppBarStyle,
//         ),
//       ),
//       body: ListView.builder(
//         itemBuilder: (ctx, index) {
//           return Dismissible(
//             key: Key(todos[index]),
//             child: Card(
//               margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10)),
//               child: ListTile(
//                 contentPadding: EdgeInsets.symmetric(horizontal: 15),
//                 title: Text(todos[index]),
//               ),
//             ),
//             onDismissed: (direction) {
//               todos.removeAt(index);
//             },
//           );
//         },
//         itemCount: todos.length,
//       ),
//       floatingActionButton: FloatingActionButton(
//           child: Icon(Icons.add),
//           onPressed: () {
//             showDialog(
//               context: context,
//               builder: (context) {
//                 return AlertDialog(
//                   title: Text("Add Todo Item"),
//                   content: TextField(
//                     onChanged: (String val) {
//                       _input = val;
//                     },
//                   ),
//                   actions: [
//                     FlatButton(onPressed: () => addTodo(), child: Text("Add"))
//                   ],
//                 );
//               },
//             );
//           }),
//     );
//   }
// }
