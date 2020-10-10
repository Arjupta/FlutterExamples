import 'package:http/http.dart' as http;
import 'dart:convert';

const API_KEY = "d98f90145022e495e3053b6a0672cf5a";
const demo_key = "439d4b804bc8187953eb36d2a8c26a02";

class NetworkHelper {
  String url;
  NetworkHelper({this.url});

  Future getData() async {
    http.Response response = await http.get(url);
    // var longitude = jsonDecode(data)['coord']['lon'];
    // print(longitude);
    // var weatherDescription = jsonDecode(data)['weather'][0]['main'];
    // print(weatherDescription);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
      return null;
    }
  }
}
