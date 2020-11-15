import 'package:flutter/material.dart';
import 'package:todoey/constants.dart';

Widget buildBottomSheet(BuildContext context, Function addTask) {
  return SingleChildScrollView(
    child: BottomSheet(
      addTask: (String newTask) {
        addTask(newTask);
      },
    ),
    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
  );
}

class BottomSheet extends StatelessWidget {
  BottomSheet({this.addTask});
  final Function addTask;
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Add Task",
              textAlign: TextAlign.center,
              style: kHeadTextStyle.copyWith(color: Colors.lightBlueAccent),
            ),
            TextField(
              controller: controller,
              autofocus: true,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            MaterialButton(
              color: Colors.lightBlue,
              child: Text("Add", style: TextStyle(color: Colors.white)),
              onPressed: () {
                addTask(controller.text);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
