import 'package:flutter/material.dart';
import 'package:todoey/constants.dart';

Widget buildBottomSheet(BuildContext context) {
  return BottomSheet();
}

class BottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Text(
              "Add Task",
              style: kHeadTextStyle.copyWith(color: Colors.lightBlueAccent),
            ),
            MaterialButton(
              color: Colors.lightBlue,
              child: Text("Add"),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
