import 'package:clima/screens/city_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import '../services/weather.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;
  LocationScreen({this.locationWeather});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  int temperature;
  String weatherMsg;
  String weatherIcon;
  String cityName;

  updateUi(weatherData) {
    if (weatherData == null) {
      temperature = 0;
      weatherIcon = "Error";
      weatherMsg = "Unable To get Weather Data";
      cityName = "";
      return;
    }
    temperature = (weatherData['main']['temp']).toInt();
    weatherMsg = weather.getMessage(temperature);
    int condition = weatherData['weather'][0]['id'];
    weatherIcon = weather.getWeatherIcon(condition);
    cityName = weatherData['name'];
  }

  @override
  void initState() {
    super.initState();
    print(widget.locationWeather);
    updateUi(widget.locationWeather);
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
                    onPressed: () async {
                      var weatherData = await weather.getLocationWeather();
                      updateUi(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CityScreen()),
                      );
                      print(typedName);
                      if (typedName != null) {
                        var weatherData = weather.getCityWeather(typedName);
                        updateUi(weatherData);
                      }
                    },
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
                    '$temperature°',
                    style: kTempTextStyle,
                  ),
                  Text(
                    '$weatherIcon',
                    style: kConditionTextStyle,
                  ),
                ],
              ),
              Text(
                "$weatherMsg in $cityName!",
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
