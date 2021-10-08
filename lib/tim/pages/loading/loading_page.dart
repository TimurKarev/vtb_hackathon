import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vtb_hackathon/tim/pages/fakes/fake_story.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _nextPage(context);
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            Container(
              width: 90.0,
            ),
            SizedBox(
              width: 200.0,
              height: 200.0,
              child: SvgPicture.asset('assets/svg/VTB_Logo_2018.svg'),
            ),
          ],
        ),
      ),
    );
  }

  void _nextPage(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 1));
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const FakeStory()),
        (Route<dynamic> route) => false);
  }
}
