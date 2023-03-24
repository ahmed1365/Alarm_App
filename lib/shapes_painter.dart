import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as Vector;
class ShapesPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {

  var angle = Vector.radians(-90);

  final double r = sqrt(size.width * size.width + size.height * size.height) / 2 ;
  final alpha = atan(size.height / size.width);
  final beta = alpha + angle;
  final shiftY = r * sin(beta);
  final shiftX = r * cos(beta);
  final translateX = size.width / 2 - shiftX;
  final translateY = size.height / 2 - shiftY;
  canvas.translate(translateX, translateY);
  canvas.rotate(angle);

  DateTime now = DateTime.now();

  final paint = Paint();
  var center = Offset(size.width / 2 , size.height / 2 );
  paint.color = Colors.white;
  canvas.drawCircle(center, (size.width / 3 ) - 5 , paint);
  paint.strokeCap = StrokeCap.round;


  // seconds line

  final secondsP1 = center;
  double secondsDegree = 360 / 60 * now.second;
  double x = (size.width / 2 ) + (size.width / 3 - 20 ) * cos(Vector.radians(secondsDegree));
  double y = (size.height / 2 ) + (size.height / 3 - 20 ) * sin(Vector.radians(secondsDegree));

  final secondsP2 = Offset(x, y);
  paint.color = Color(0xff65d1ba);
  paint.strokeWidth =  2;
  canvas.drawLine(secondsP1, secondsP2, paint);


  // minutes line
  final minutesP1 = center;
  double minutesDegree = 360 / 60 * now.minute;
   x = (size.width / 2 ) + (size.width / 3 - 40 ) * cos(Vector.radians(minutesDegree));
   y = (size.height / 2 ) + (size.height / 3 - 40 ) * sin(Vector.radians(minutesDegree));

  final minutesP2 = Offset(x, y);
  paint.color = Color(0xff354569);
  paint.strokeWidth =  3;
  canvas.drawLine(minutesP1, minutesP2, paint);


  //hours line
  final hoursP1 = center;
  double hoursDegree = 360 / 12 * (now.hour - 12 );
  x = (size.width / 2 ) + (size.width / 3 - 40 ) * cos(Vector.radians(hoursDegree));
  y = (size.height / 2 ) + (size.height / 3 - 40 ) * sin(Vector.radians(hoursDegree));

  final hoursP2 = Offset(x, y);
  paint.color = Color(0xff354569);
  paint.strokeWidth =  4;
  canvas.drawLine(hoursP1, hoursP2, paint);

  //external lines

  for (int i = 0 ; i < 60; i++){
    double minute = 360/ 60 * i;

    paint.color = ( i % 5 == 0 )?Color(0xff65d1ba):Colors.white;
    paint.strokeWidth =  ( i % 5 == 0 )?4:1;

    int distance =  ( i % 5 == 0 )?10:15;

    double x1 = (size.width / 2 )+ (size.width / 3 + distance) * cos(Vector.radians(minute));
    double y1 = (size.height / 2 )+ (size.width / 3 + distance) * sin(Vector.radians(minute));
    final p1 = Offset(x1, y1);

    double x2 = (size.width / 2 )+ (size.width / 3 + 30) * cos(Vector.radians(minute));
    double y2 = (size.height / 2 )+ (size.width / 3 + 30) * sin(Vector.radians(minute));
    final p2 = Offset(x2, y2);

    canvas.drawLine(p1, p2, paint);
  }

  }


  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
   return true;
  }

}