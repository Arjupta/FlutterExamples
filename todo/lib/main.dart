import 'package:flutter/material.dart';
import 'constants.dart';
import 'classModel.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.light(),
    home: ClassPage(),
  ));
}

class ClassPage extends StatelessWidget {
  // TODO : Will bring data from the Json string
  final List<ClassModel> list = [
    ClassModel(id: "1", classCode: "MA-102", className: "Integration"),
    ClassModel(id: "2", classCode: "CHE-201", className: "Organic"),
    ClassModel(id: "4", classCode: "PE-102", className: "Physical Education"),
    ClassModel(id: "4", classCode: "EO-201", className: "Mechanics"),
    ClassModel(id: "4", classCode: "CSO-101", className: "Computer Science"),
    ClassModel(id: "4", classCode: "MA-201", className: "Differentiation"),
    ClassModel(id: "3", classCode: "CHE-202", className: "Inorganic"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text("Kohbee Classes"),
        backgroundColor: Colors.greenAccent,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10.0),
        child: classList(),
      ),
    );
  }

  Widget classList() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return classWidget(list.elementAt(index), context);
      },
      itemCount: list.length,
    );
  }
}
