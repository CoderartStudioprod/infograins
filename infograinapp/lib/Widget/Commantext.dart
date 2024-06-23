import 'package:flutter/material.dart';
import 'package:infograinapp/utility/color.dart';

Widget textwidget(title, double fontsize, color, fontweight) => Text(
      title,
      style:
          TextStyle(fontSize: fontsize, color: color, fontWeight: fontweight),
    );
InputDecoration commandecoration(hinttext) => InputDecoration(
    errorStyle: TextStyle(color: Color.fromARGB(255, 255, 182, 182)),
    fillColor: Colors.white,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: BorderSide(
        color: Colors.blue,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: BorderSide(
        color: Color(0xff1B263B),
        width: 1.2,
      ),
    ),
    contentPadding: EdgeInsets.only(left: 10),
    hintStyle: TextStyle(color: subtestcolor),
    hintText: hinttext);
