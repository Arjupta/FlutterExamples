import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../services/location.dart';

const Api_key = "d98f90145022e495e3053b6a0672cf5a";
const Demo_key = "439d4b804bc8187953eb36d2a8c26a02";

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double longitude, latitude;

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentPosition();
    longitude = location.longitude;
    latitude = location.latitude;
    print(latitude);
    print(longitude);
    NetworkHelper networkHelper = NetworkHelper(
        url:
            'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$Api_key&units=metric');
    var weather_data = await networkHelper.getData();

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                LocationScreen(locationWeather: weather_data)));
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CLIMA'),
      ),
      body: Center(
        child: SpinKitDoubleBounce(color: Colors.white, size: 100),
      ),
    );
  }
}
