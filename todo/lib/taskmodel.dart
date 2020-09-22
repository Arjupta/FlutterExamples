import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskModel {
  String id;
  String title;
  String status;
  String name;

  TaskModel(
      {@required this.id,
      @required this.title,
      @required this.status,
      @required this.name});
}

Widget ownerNameWidget(TaskModel todo) {
  return Expanded(
    child: Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 5.0),
            child: Text(
              'Owner',
              style: TextStyle(fontSize: 17.07, color: Colors.black12),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 5.0),
            child: Text(
              todo.name,
              style: TextStyle(fontSize: 17.07),
            ),
          )
        ],
      ),
    ),
  );
}

Widget statusWidget(TaskModel todo) {
  return Expanded(
    child: Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 5.0),
            child: Text(
              'Owner',
              style: TextStyle(fontSize: 17.07, color: Colors.black12),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 5.0),
            child: Text(
              todo.status,
              style: TextStyle(fontSize: 17.07),
            ),
          )
        ],
      ),
    ),
  );
}
