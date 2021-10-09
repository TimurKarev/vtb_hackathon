import 'package:flutter/material.dart';
import 'package:vtb_hackathon/pages/loading/loading_page.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const LoadingPage(),
  ));
}
