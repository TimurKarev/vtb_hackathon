import 'package:flutter/material.dart';

abstract class Styles {

  static const TextStyle appBarText = TextStyle(
  fontSize: 18,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
  );

  static const TextStyle onBoardingHeaderText = TextStyle(
    fontSize: 30,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static const TextStyle onBoardingText = TextStyle(
    fontSize: 18,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static const TextStyle textButtonText = TextStyle(
    fontSize: 18,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    color: primaryColor,
  );

  static const TextStyle productHeaderText = TextStyle(
    fontSize: 18,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    color: primaryDarkColor,
  );

  static const TextStyle smallText = TextStyle(
    fontSize: 13,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    color: primaryColor,
  );

  static const TextStyle baseText = TextStyle(
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    color: primaryColor,
  );

  static const TextStyle smallestText = TextStyle(
    fontSize: 12,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    color: primaryColor,
  );

  static const Color primaryLightColor = Color(0xffb0cdf9);
  static const Color primaryColor = Color(0xff3a83f1);
  static const Color primaryDarkColor = Color(0xff0471fc);

  static const Color backgroundColor = Colors.white;
  static const Color foregroundColor = Colors.black;

  static const Color mainColor = Color(0xffe3f2fd);  //
}