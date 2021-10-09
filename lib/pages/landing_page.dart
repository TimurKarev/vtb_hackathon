import 'package:flutter/material.dart';

import '8/start_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
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
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => StartPage()));
                },
                child: Text("8"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
