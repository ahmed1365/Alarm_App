
import 'package:flutter/material.dart';

Widget circleDay (day , context, enabled) {
  return Container(
    width: 40.0,
    height: 40.0,
    decoration: BoxDecoration(
      color: (enabled)?Theme.of(context).accentColor:Colors.transparent,
      borderRadius: BorderRadiusDirectional.circular(100.0),
    ),
    child: Padding(
      padding: EdgeInsets.all(7.0),
      child: Text(
        day,
        style: TextStyle(
          color: Colors.white,
          fontSize: 15.0
        ),
      ),
    ),
  );
}