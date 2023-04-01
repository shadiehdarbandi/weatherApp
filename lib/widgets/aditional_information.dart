import 'package:flutter/material.dart';

Widget aditionalInformation(
    String wind, String humidity, String prusure, String feels_like) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(18),
    child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'wind',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  Text('presure',
                      style: TextStyle(fontSize: 14, color: Colors.black)),
                ],
              ),
              SizedBox(
                width: 4,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '$wind',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  Text('$prusure',
                      style: TextStyle(fontSize: 18, color: Colors.black)),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'humidity',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  Text('feel like',
                      style: TextStyle(fontSize: 14, color: Colors.black)),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '$humidity',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  Text('$feels_like',
                      style: TextStyle(fontSize: 18, color: Colors.black)),
                ],
              )
            ],
          ),
        ]),
  );
}
