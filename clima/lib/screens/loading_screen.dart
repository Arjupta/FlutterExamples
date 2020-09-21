import 'dart:convert';

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
    return Scaffold();
  }
}
