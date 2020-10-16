import 'dart:convert';

import 'package:http/http.dart' as http;

class Networking {
  static String base_url = "https://rest.coinapi.io/v1/exchangerate";
  static String api_key = "5E1DDEA5-44B8-47E7-B69B-E8A441314D52";

  Future getBTC(String currency) async {
    var response = await http.get('$base_url/BTC/$currency?apikey=$api_key');
    var result = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return result["rate"];
    } else
      return "Not Found";
  }

  Future getETH(String currency) async {
    var response = await http.get('$base_url/ETH/$currency?apikey=$api_key');
    var result = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return result["rate"];
    } else
      return "Not Found";
  }

  Future getLTC(String currency) async {
    var response = await http.get('$base_url/LTC/$currency?apikey=$api_key');
    var result = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return result["rate"];
    } else
      return "Not Found";
  }
}
