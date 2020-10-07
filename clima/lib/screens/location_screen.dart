import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;
  LocationScreen({this.locationWeather});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  void initState() {
    super.initState();
    print(widget.locationWeather);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text(
                    '32°',
                    style: kTempTextStyle,
                  ),
                  Text(
                    '☀️',
                    style: kConditionTextStyle,
                  ),
                ],
              ),
              Text(
                "It's 🍦 time in San Francisco!",
                textAlign: TextAlign.right,
                style: kMessageTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// double temperature = decoded_data['main']['temp'];
// int condition = decoded_data['weather'][0]['id'];
// String cityName = decoded_data['name'];
