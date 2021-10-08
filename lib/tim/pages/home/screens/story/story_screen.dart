import 'package:flutter/material.dart';

class StoryScreen extends StatelessWidget {
  const StoryScreen({Key? key}) : super(key: key);
  static const TextStyle optionStyle =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Список новелл в соответствии с классификацией',
      style: optionStyle,
    );
  }
}
