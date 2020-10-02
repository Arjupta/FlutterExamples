import 'package:flutter/material.dart';
import 'package:todo/classTaskPage.dart';
import 'package:todo/global_tile.dart';

class ClassModel {
  String className;
  String classCode;
  String classDesc;
  String id;

  ClassModel({this.id, this.className, this.classCode, this.classDesc = ""});
}

Widget classWidget(ClassModel todo, BuildContext context) {
  return GlobalTile(
    title: todo.classCode,
    title2: todo.className,
    title3: '',
    icon: Icons.navigate_next,
    onIconPressed: () => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => ClassTaskPage(todo: todo),
      ),
    ),
    transform: false,
  );
}
