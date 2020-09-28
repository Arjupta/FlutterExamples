import 'package:flutter/material.dart';
import 'package:todo/classTaskPage.dart';
import 'package:todo/global_tile.dart';

class ClassModel {
  String className;
  String classId;

  ClassModel({this.classId, this.className});
}

Widget classWidget(ClassModel todo, BuildContext context, int index) {
  return GlobalTile(
    title: todo.className,
    title2: '',
    title3: '',
    icon: Icons.navigate_next,
    onIconPressed: () => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => ClassTaskPage(
          id: index,
          className: todo.className,
        ),
      ),
    ),
    transform: false,
  );

  // Container(
  //   key: Key(todo.classId),
  //   margin: EdgeInsets.all(10.0),
  //   padding: EdgeInsets.all(10.0),
  //   decoration: BoxDecoration(
  //     borderRadius: BorderRadius.all(Radius.circular(10.0)),
  //     shape: BoxShape.rectangle,
  //     color: Colors.greenAccent,
  //     boxShadow: [BoxShadow(blurRadius: 5.0)],
  //   ),
  //   child: Column(
  //     mainAxisSize: MainAxisSize.min,
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           Padding(
  //             padding: EdgeInsets.only(left: 10.0),
  //             child: Text(
  //               todo.className,
  //               style: TextStyle(fontSize: 17.07),
  //             ),
  //           ),
  //           Padding(
  //             padding: EdgeInsets.all(8.0),
  //             child: FlatButton(
  //               onPressed: () {
  //                 Navigator.push(
  //                   context,
  //                   MaterialPageRoute(
  //                     builder: (ctx) => ClassTaskPage(
  //                       id: index,
  //                       className: todo.className,
  //                     ),
  //                   ),
  //                 );
  //               },
  //               child: Icon(Icons.navigate_next),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ],
  //   ),
  // );
}
