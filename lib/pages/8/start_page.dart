import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  int stageStory = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            stageStory++;
          });
          print(stageStory);
        },
        child: onBuildScreen(stageStory),
      ),
    );
  }

  Widget onBuildScreen(int stage) {
    if (stage == 3) {
      return Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.black,
              child: const Center(
                child: Text(
                  "И наша подруга все продолжала и продолжала...",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFFD8E6FC)),
                ),
              ),
            ),
          ),
        ],
      );
    }
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              "https://i.pinimg.com/originals/a4/16/17/a416177b19b0e842b14fbf29114aa4e2.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 48),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(221, 255, 255, 255),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.monetization_on_outlined, color: Color(0xFF3A83F1)),
                      SizedBox(width: 4),
                      Text("87 руб.", style: TextStyle(color: Color(0xFF3A83F1))),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(221, 255, 255, 255),
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: const Icon(Icons.info_outline, color: Color(0xFF3A83F1)),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(221, 255, 255, 255),
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: const Icon(Icons.restart_alt_outlined, color: Color(0xFF3A83F1)),
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Color.fromARGB(221, 255, 255, 255),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4.0,
                  spreadRadius: 4.0,
                  offset: Offset(0.0, 0.0),
                )
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        onStoryBuild(stageStory),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2F3441),
                        ),
                      ),
                      const SizedBox(height: 8),
                      onBuildButtons(stage),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget onBuildButtons(int stage) {
    if (stage == 5) {
      return Column(
        children: [
          onBuildItemButton(6, "Да... Пока никак особо, живу от зарплаты до зарплаты..."),
          onBuildItemButton(7, "Ты знаешь, а все идет довольно неплохо, даже откладывать получается"),
        ],
      );
    }
    return Container();
  }

  Widget onBuildItemButton(int stage, String text) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          stageStory = stage;
        });
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.amber[400]),
      ),
      child: Text(text),
    );
  }

  String onStoryBuild(int stage) {
    if (stage == 6) {
      setState(() {
        stageStory + 20;
      });
      return onStoryGoingOn1(stageStory);
    }
    if (stage == 7) {
      setState(() {
        stageStory + 20;
      });
      return onStoryGoingOn2(stageStory);
    }
    return onStoryGoingOn(stage);
  }

  String onStoryGoingOn(int stage) {
    String storyContent = "";
    switch (stage) {
      case 1:
        storyContent =
            "Вы идете в магазин за покупками и неожиданно встречаетесь со старой подругой...";
        break;
      case 2:
        storyContent =
            "Подруга: О, привет, давно не виделись! Как дела, как жизнь? У меня вот...";
        break;
      case 4:
        storyContent =
            "Подруга: Кстати, помнишь как мы обсуждали, что хотим отложить денег себе на старость. Ну и как, у тебя получается?";
        break;
    }
    return storyContent;
  }

  String onStoryGoingOn1(int stage) {
    String storyContent = "";
    switch (stage) {
      case 16:
        storyContent =
            "Подруга: Если честно, у меня тоже самое. Ну, ладно, приятно было с тобой поболтать, надеюсь еще увидимся!";
        break;
      case 17:
        storyContent = "Вы прощаетесь с подругой и идете в магазин...";
        break;
      case 18:
        storyContent = "В магазине вы видете новые крутые наушеники с 3D звуком и шумоподавлением, только сейчас всего за половину вашей зарплаты! Акция ограничена!";
        break;
      case 19:
        storyContent = "Но вы УМЕЕТЕ ОТКЛАДЫВАТЬ и решаете не покупать их.";
        break;
    }
    return storyContent;
  }

  String onStoryGoingOn2(int stage) {
    String storyContent = "";
    switch (stage) {
      case 26:
        storyContent = "Подруга: О, это хорошо, а вот у меня каждый раз после зарплаты деньги куда-то исчезают. Ладно тогда, приятно было поболтать, надеюсь еще увидимся!";
        break;
      case 27:
        storyContent = "Вы прощаетесь с подругой и идете в магазин...";
        break;
      case 28:
        storyContent = "В магазине вы видете новые крутые наушеники с 3D звуком и шумоподавлением, только сейчас всего за половину вашей зарплаты! Акция ограничена!";
        break;
      case 29:
        storyContent = "Вы решаете купить их. Но так как вы НЕ ОТКЛАДЫВАЛИ, у вас в кошельке не оказалось достаточно денег на них.";
        break;
    }
    return storyContent;
  }
}
