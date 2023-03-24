import 'package:alarm/Home.dart';
import 'package:alarm/add_alarm.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
void main() =>runApp(AlarmApp());

class AlarmApp extends StatefulWidget {
  @override
 _AlarmAppState createState() => _AlarmAppState();
  }

  class _AlarmAppState extends State<AlarmApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
      '/add-alarm' : (context) => AddAlarm(),
      },
      theme : ThemeData(
        primaryColor: Color(0xff1b2c57),
        accentColor: Color(0xff65d1ba)
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }

}