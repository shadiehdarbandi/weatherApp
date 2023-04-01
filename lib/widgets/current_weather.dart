import 'package:flutter/material.dart';

Widget CurrentWeather(
  IconData icon,
  String temp,
  String loction,
) {
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 12,
        ),
        Icon(
          icon,
          color: Color.fromARGB(255, 122, 34, 204),
          size: 77,
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          parse("$temp"),
          style: TextStyle(fontSize: 46),
        ),
        SizedBox(
          height: 12,
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          "$loction",
          style: TextStyle(fontSize: 20),
        ),
      ],
    ),
  );
}

String parse(String temp) {
  var onePointOne = double.parse(temp);
  onePointOne = onePointOne - 273;
  var t = onePointOne.toInt() + 1;
  var cantigrade = t.toString() + ' c';
  return cantigrade;
}
 //Icon weatherIcon ()