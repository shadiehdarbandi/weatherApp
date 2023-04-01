import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weatherappflutter/model/weatherModel.dart';

class weatherApiClient {
  Future<weather>? getCurrentWeather(String? location) async {
    var endPint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=36a13f7bac8d137b2b1670f5d2da4c39&units/metric");
    var response = await http.get(endPint);
    var body = jsonDecode(response.body);
    print(weather.fromJson(body));
    return weather.fromJson(body);
  }
}
