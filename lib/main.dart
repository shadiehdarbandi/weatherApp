import 'package:flutter/material.dart';
import 'package:weatherappflutter/model/weatherModel.dart';
import 'package:weatherappflutter/service/weather_api.dart';
import 'package:weatherappflutter/widgets/aditional_information.dart';
import 'package:weatherappflutter/widgets/current_weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  weatherApiClient client = weatherApiClient();
  weather? data;
  String city = "kermanshah";

  var value;
  Future<void> getData() async {
    data = await client.getCurrentWeather(" $city");
  }

  TextEditingController _controller = TextEditingController();
  // تعریف کلید اختصاصی
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  // void dispose() {
  //   // جهت مدیریت حافظه بهتر است در لحظه اتمام کار ویجت ، کنترلر نیز آزاد شود
  //   _controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Color.fromARGB(255, 206, 212, 235),
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 206, 212, 235),
            elevation: 0,
            title: Text(
              'Shazi Weather',
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
          ),
          body: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextField(
                      // اتصال کنترلر به خصوصیت کنترلر
                      controller: _controller,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8))),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 157, 38, 194),
                      ),
                      onPressed: () {
                        setState(() {
                          if ({_controller.text} == null) {
                            city = 'kermanshah';
                          } else {
                            city = _controller.text;
                            print('$city');
                          }
                        });
                      },
                      child: Container(
                        child: Text(
                          'city ',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    CurrentWeather(
                        Icons.cloud, "${data!.temp}", "${data!.cityName}"),
                    SizedBox(
                      height: 55,
                    ),
                    Text(
                      'additionl informatin',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Divider(),
                    SizedBox(
                      height: 20,
                    ),
                    aditionalInformation("${data!.wind}", "${data!.humedity}",
                        "${data!.prusser}", "${data!.feels_like}"),
                  ],
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: RefreshProgressIndicator(),
                );
              }
              return Container();
            },
          )),
    );
  }
}
