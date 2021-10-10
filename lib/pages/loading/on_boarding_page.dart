import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vtb_hackathon/pages/home/home_page.dart';
import 'package:vtb_hackathon/pages/story/story_cubit.dart';
import 'package:vtb_hackathon/pages/story/story_page.dart';
import 'package:vtb_hackathon/pages/styles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final PageController controller = PageController(initialPage: 0);

  static const List<String> _header = [
    "Ваш финансовый помощник",
    "Небольшие сюжеты",
    "Готовы начать? :)",
  ];

  static const List<String> _text = [
    "Мы расскажем вам о преемуществах инвестирования в краткой и лаконичной форме",
    "Вам будут предложены несколько бытовых историй, повествующих о том почему важно инвестировать и правильно пользоваться своими средствами",
    "Тогда нажмите на кнопку ниже.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            scrollDirection: Axis.horizontal,
            controller: controller,
            children: [
              ImageWidget(
                n: '1',
                header: _header[0],
                text: _text[0],
                buttonText: "Пропустить",
              ),
              ImageWidget(
                n: '2',
                header: _header[1],
                text: _text[1],
                buttonText: "Пропустить",
              ),
              ImageWidget(
                n: '3',
                header: _header[2],
                text: _text[2],
                buttonText: "Начать",
              ),
            ],
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 570),
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: const SlideEffect(
                  dotWidth: 12,
                  dotHeight: 12,
                  activeDotColor: Styles.primaryColor,
                  dotColor: Styles.primaryLightColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ImageWidget extends StatelessWidget {
  final String n;
  final String header;
  final String text;
  final String buttonText;

  const ImageWidget({
    Key? key,
    required this.n,
    required this.header,
    required this.text,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/png/on_boarding_$n.png',
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 70.0, 80.0, 20.0),
                  child: Text(
                    header,
                    style: Styles.onBoardingHeaderText,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(33.0, 0.0, 40.0, 20.0),
                  child: Text(
                    text,
                    style: Styles.onBoardingText,
                  ),
                ),
              ],
            ),
            TextButton(
              child: Text(
                buttonText,
                style: Styles.textButtonText,
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => BlocProvider(
                        create: (state) => StoryCubit("onboarding"),
                        child: const StoryPage(),
                      )),
                      (route) => false,
                );
              },
            ),
          ],
        )
      ],
    );
  }
}
