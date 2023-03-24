import 'dart:async';
import 'package:alarm/alarmItem.dart';
import 'package:alarm/shapes_painter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  String? _timeString;
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 4,
      vsync: this,
      initialIndex: 0,
    );

    _timeString = _formatDateTime(DateTime.now());

    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);

    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('hh:mm').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: Theme.of(context).accentColor,
            indicatorWeight: 4.0,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.access_time), text: 'Clock'),
              Tab(icon: Icon(Icons.alarm), text: 'Alarm'),
              Tab(icon: Icon(Icons.hourglass_empty), text: 'Timer'),
              Tab(icon: Icon(Icons.timer), text: 'StopWatch'),
            ],
          ),
        ),
        body: Container(
          color: Theme.of(context).primaryColor,
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              //Clock
              Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CustomPaint(
                        painter: ShapesPainter(),
                        child: Container(height: 500.0,),
                      ),
                    ),
                    Text(_timeString.toString(), style: TextStyle(
                      color: Colors.white,
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,

                    ),)
                  ],
                ),
              ),
              Container(
                child: ListView(
                  children: <Widget>[
                    alarmItem(_timeString, true),
                    alarmItem(_timeString, true),
                    alarmItem(_timeString, true),
                    alarmItem(_timeString, true),
                  ],
                ),
              ),
              Container(
                child: ListView(
                  children: <Widget>[
                    alarmItem(_timeString, true),
                    alarmItem(_timeString, true),
                    alarmItem(_timeString, true),
                    alarmItem(_timeString, true),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.all(8.0),
                    child: Text('Hi!'),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        floatingActionButton: _bottomButtons(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  Widget? _bottomButtons(){
    return _tabController!.index == 1
        ?FloatingActionButton(onPressed: () => Navigator.pushNamed(context, '/add-alarm'),
    backgroundColor: Color(0xff65d1ba),
      child: Icon(
        Icons.add,
        size: 20.0,
      ),
    ):null;
  }
}
