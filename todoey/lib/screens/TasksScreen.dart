import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/constants.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/widgets/bottom_modal_sheet.dart';
import 'package:todoey/widgets/task_list.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  child:
                      Icon(Icons.list, size: 30, color: Colors.lightBlueAccent),
                  backgroundColor: Colors.white,
                  radius: 30,
                ),
                SizedBox(height: 20),
                Text('Todoey', style: kHeadTextStyle),
                SizedBox(height: 10),
                Text(
                  '${Provider.of<TaskData>(context).undoneTasks()} Tasks',
                  style: kHeadTextStyle.copyWith(fontSize: 15),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: TaskList(),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => buildBottomSheet(context),
          );
        },
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
      ),
    );
  }
}
