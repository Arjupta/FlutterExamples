import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const Api_key = "d98f90145022e495e3053b6a0672cf5a";
const Demo_key = "439d4b804bc8187953eb36d2a8c26a02";
const baseUrl = "https://api.openweathermap.org/data/2.5/weather";

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url = '$baseUrl?q=$cityName&appid=$Api_key&units=metric';
    NetworkHelper networkHelper = new NetworkHelper(url: url);
    var weather_data = await networkHelper.getData();
    return weather_data;
  }

  Future<dynamic> getLocationWeather() async {
    double longitude, latitude;
    Location location = Location();
    await location.getCurrentPosition();
    longitude = location.longitude;
    latitude = location.latitude;
    print(latitude);
    print(longitude);
    NetworkHelper networkHelper = NetworkHelper(
        url:
            '$baseUrl?lat=$latitude&lon=$longitude&appid=$Api_key&units=metric');
    var weather_data = await networkHelper.getData();
    return weather_data;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
