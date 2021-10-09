import 'package:flutter/material.dart';

abstract class Styles {

  static const TextStyle appBarText = TextStyle(
  fontSize: 16,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
  );

  static const TextStyle baseText = TextStyle(
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    color: primaryColor,
  );


  static const Color primaryLightColor = Color(0xffb0cdf9);
  static const Color primaryColor = Color(0xff3a83f1);
  static const Color primaryDarkColor = Color(0xff0471fc);

  static const Color backgroundColor = Colors.white;
  static const Color foregroundColor = Colors.black;

}