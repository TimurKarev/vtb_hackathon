import "package:flutter/material.dart";
import 'package:vtb_hackathon/pages/home/screens/story/story_screen.dart';
import 'package:vtb_hackathon/pages/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    ),
    Text(
      'Ссылки на продукты ВТБ',
      style: Styles.baseText,
    ),
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
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Styles.backgroundColor,
        foregroundColor: Styles.foregroundColor,
        title: Center(
          child: Text(_appTitle[_selectedIndex], style: Styles.appBarText),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.account_balance_outlined,
            color: Styles.primaryDarkColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.account_circle,
              color: Styles.primaryDarkColor,
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
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
