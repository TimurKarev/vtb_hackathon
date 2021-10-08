import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text("1"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("2"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("3"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("4"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("5"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("6"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("7"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("8"),
            ),
          ],
        ),
      ),
    );
  }
}
