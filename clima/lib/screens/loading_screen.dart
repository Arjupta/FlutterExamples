import 'dart:convert';

import 'package:clima/utilities/taskmodel.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../services/location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getPosition() async {
    Location location = Location();
    await location.getCurrentPosition();
    print(location.latitude);
    print(location.longitude);
  }

  void getData() async {
    http.Response response = await http.get(
        'https://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=439d4b804bc8187953eb36d2a8c26a02');
    String data = response.body;
    // var longitude = jsonDecode(data)['coord']['lon'];
    // print(longitude);
    // var weatherDescription = jsonDecode(data)['weather'][0]['main'];
    // print(weatherDescription);
    var decoded_data = jsonDecode(data);
    double temperature = decoded_data['main']['temp'];
    int condition = decoded_data['weather'][0]['id'];
    String cityName = decoded_data['name'];

    print('${temperature}_${condition}_$cityName');
  }

  List<TaskModel> list = [
    TaskModel(id: '1', title: 'Test 1', status: 'Employee', name: 'John'),
    TaskModel(id: '2', title: 'Test 2', status: 'Manager', name: 'Doe'),
    TaskModel(id: '3', title: 'Test 3', status: 'Customer', name: 'Foo'),
    TaskModel(id: '4', title: 'Test 4', status: 'Engineer', name: 'Bar'),
  ];

  @override
  void initState() {
    super.initState();
    getPosition();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      appBar: AppBar(
        title: Text('Reorderble List'),
      ),
      body: taskList(),
    );
  }

  Widget taskList() {
    return ReorderableListView(
      children: list.map((todo) => taskWidget(todo)).toList(),
      onReorder: (oldIndex, newIndex) {
        setState(() {
          final TaskModel item = list.removeAt(oldIndex);
          list.insert(newIndex, item);
        });
      },
    );
  }

  Widget taskWidget(TaskModel todo) {
    return Container(
      key: Key(todo.id),
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: const Color(0xFF66BB6A),
          boxShadow: [BoxShadow(blurRadius: 5.0)]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(todo.title),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ownerNameWidget(todo),
                statusWidget(todo),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
