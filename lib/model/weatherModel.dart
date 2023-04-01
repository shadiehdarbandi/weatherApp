import 'dart:convert';

class weather {
  String? cityName;
  double t = -273;
  double? temp;
  double? wind;
  int? humedity;
  int? prusser;
  double? feels_like;

  weather({
    this.cityName,
    this.temp,
    this.feels_like,
    this.humedity,
    this.prusser,
    this.wind,
  });
  weather.fromJson(Map<String, dynamic> Json) {
    cityName = Json["name"];
    temp = Json["main"]["temp"];
    wind = Json["wind"]["speed"];
    prusser = Json["main"]["pressure"];
    humedity = Json["main"]["humidity"];
    feels_like = Json["main"]["feels_like"];
  }
}
