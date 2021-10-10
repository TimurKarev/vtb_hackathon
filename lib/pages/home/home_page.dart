import "package:flutter/material.dart";
import 'package:vtb_hackathon/pages/home/screens/story/story_screen.dart';
import 'package:vtb_hackathon/pages/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vtb_hackathon/pages/vtb_screen/vtb_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    StoryScreen(),
    Text(
      'Список доступных настолок',
      style: Styles.baseText,
    ),
    VTBScreen(),
  ];

  static const List<String> _appTitle = <String>[
    "Новеллы",
    "Настолки",
    "Продукты",
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: AppBar(
          elevation: 0.0,
          backgroundColor: Styles.mainColor,
          foregroundColor: Styles.foregroundColor,
          //_
          title: AppWidget(text: _appTitle[_selectedIndex]),
        ),
      ),
      body: Container(
        color: Styles.mainColor,
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Новеллы',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Настолки',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_outlined),
            label: 'ВТБ',
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: Colors.black,
        unselectedItemColor: Styles.backgroundColor,
        selectedItemColor: Styles.primaryDarkColor,
        onTap: _onItemTapped,
      ),
    );
  }
}

class AppWidget extends StatelessWidget {
  final String text;

  const AppWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 1,
          child: Column(
            children: const [
              Icon(
                Icons.account_balance_outlined,
                size: 27.0,
                color: Styles.primaryDarkColor,
              ),
              Text(
                "ВТБ",
                style: Styles.smallestText,
              ),
            ],
          ),
        ),
        Flexible(
          flex: 1,
          child: Text(
            text,
            style: Styles.appBarText,
          ),
        ),
        Flexible(
          flex: 1,
          child: Column(
            children: const [
              Icon(
                Icons.account_circle,
                size: 27.0,
                color: Styles.primaryDarkColor,
              ),
              Text(
                "Профиль",
                style: Styles.smallestText,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
