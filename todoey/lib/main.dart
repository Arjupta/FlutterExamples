import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';
import 'screens/TasksScreen.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => TaskData(),
    child: MaterialApp(
      home: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TaskScreen();
  }
}
