import "package:flutter/material.dart";
import 'package:vtb_hackathon/tim/pages/home/screens/story/story_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    StoryScreen(),
    Text(
      'Список доступных настолок',
      style: optionStyle,
    ),
    Text(
      'Ссылки на продукты ВТБ',
      style: optionStyle,
    ),
  ];

  static const List<String> _appTitle = <String>[
    "Новеллы",
    "Настолки",
    "Продукты",
  ];

  static const _bottomIconColor = Colors.white;

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
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Center(
          child: Text(_appTitle[_selectedIndex]),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.account_balance,
            color: Colors.lightBlue,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.account_circle,
              color: Colors.lightBlue,
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
        unselectedItemColor: _bottomIconColor,
        selectedItemColor: Colors.lightBlue,
        onTap: _onItemTapped,
      ),
    );
  }
}
