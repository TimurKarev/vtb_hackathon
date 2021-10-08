import 'package:flutter/material.dart';
import 'package:vtb_hackathon/tim/pages/home/home_page.dart';

class FakeStory extends StatelessWidget {
  const FakeStory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 200.0,
          ),
          Text(
            "Финальный экран после первой истории",
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 200.0,
          ),
          Center(
            child: SizedBox(
              width: 200.0,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                      (Route<dynamic> route) => false);
                },
                child: const Text("Продолжить"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
