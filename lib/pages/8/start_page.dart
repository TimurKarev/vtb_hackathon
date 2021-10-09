import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vtb_hackathon/pages/home/home_page.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  int stageBaseStory = 0;
  int stageStoryScript1 = 0;
  int stageStoryScript2 = 0;

  bool isStartFirstWay = false;
  bool isStartSecondWay = false;

  List<String> baseScript = [
    "Вы идете в магазин за покупками и неожиданно встречаетесь со старой подругой...",
    "Подруга: О, привет, давно не виделись! Как дела, как жизнь? У меня вот...",
    "И наша подруга все продолжала и продолжала...",
    "Подруга: Кстати, помнишь как мы обсуждали, что хотим отложить денег себе на старость. Ну и как, у тебя получается?",
  ];

  List<String> script1 = [
    "Подруга: Если честно, у меня тоже самое. Ну, ладно, приятно было с тобой поболтать, надеюсь еще увидимся!",
    "Вы прощаетесь с подругой и идете в магазин...",
    "В магазине вы видете новые крутые наушеники с 3D звуком и шумоподавлением, только сейчас всего за половину вашей зарплаты! Акция ограничена!",
    "Но вы УМЕЕТЕ ОТКЛАДЫВАТЬ и решаете не покупать их.",
  ];

  List<String> script2 = [
    "Подруга: О, это хорошо, а вот у меня каждый раз после зарплаты деньги куда-то исчезают. Ладно тогда, приятно было поболтать, надеюсь еще увидимся!",
    "Вы прощаетесь с подругой и идете в магазин...",
    "В магазине вы видете новые крутые наушеники с 3D звуком и шумоподавлением, только сейчас всего за половину вашей зарплаты! Акция ограничена!",
    "Вы решаете купить их. Но так как вы НЕ ОТКЛАДЫВАЛИ, у вас в кошельке не оказалось достаточно денег на них.",
  ];

  Widget buildBlackScreen() {
    return Container(
      color: Colors.black,
      child: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              if (stageBaseStory < baseScript.length - 1) stageBaseStory++;
            });
            print("base: $stageBaseStory");
          },
          child: Text(
            baseScript[stageBaseStory],
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFFD8E6FC)),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isStartFirstWay) {
      return Scaffold(
        body: onBuildScreen(
          num: stageStoryScript1,
          content: script1,
          func: () {
            setState(() {
              if (stageStoryScript1 < script1.length - 1) stageStoryScript1++;
              else {
                print("Time to exit");
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                        (Route<dynamic> route) => false);
              }
            });
            print("SCRIPT 1: $stageStoryScript1");
          },
        ),
      );
    }
    if (isStartSecondWay) {
      return Scaffold(
        body: onBuildScreen(
          num: stageStoryScript2,
          content: script2,
          func: () {
            setState(() {
              if (stageStoryScript2 < script2.length - 1) stageStoryScript2++;
              else {
                print("Time to exit");
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                        (Route<dynamic> route) => false);
              }
            });
            print("SCRIPT 2: $stageStoryScript2");
          },
        ),
      );
    }

    if (stageBaseStory == 2) return Scaffold(body: buildBlackScreen());

    return Scaffold(
      body: onBuildScreen(
              func: () {
                setState(() {
                  if (stageBaseStory < baseScript.length - 1) stageBaseStory++;
                });
                print("BASE: $stageBaseStory");
              },
              num: stageBaseStory,
              content: baseScript,
            ),
    );
  }

  Widget onBuildScreen(
      {required VoidCallback func,
      required int num,
      required List<String> content}) {
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
          topLayer(),
          GestureDetector(
            onTap: func,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Color.fromARGB(221, 255, 255, 255),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
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
                          content[num],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2F3441),
                          ),
                        ),
                        const SizedBox(height: 8),
                        if (stageBaseStory == 3) onBuildStoryButtons(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget topLayer() {
    return Container(
      margin: const EdgeInsets.only(top: 48),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: const Color.fromARGB(221, 255, 255, 255),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: const [
                Icon(Icons.monetization_on_outlined, color: Color(0xFF3A83F1)),
                SizedBox(width: 4),
                Text(
                  "87 руб.",
                  style: TextStyle(color: Color(0xFF3A83F1)),
                ),
              ],
            ),
          ),
          Row(
            children: [
              onBuildButtons(
                icon: Icons.info_outline,
                func: () {
                  // print(dialogType);
                },
              ),
              const SizedBox(width: 8),
              onBuildButtons(
                icon: Icons.restart_alt_outlined,
                func: () {
                  setState(() {
                    stageBaseStory = 0;
                    stageStoryScript1 = 0;
                    stageStoryScript2 = 0;
                    isStartFirstWay = false;
                    isStartSecondWay = false;
                  });
                },
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }

  Widget onBuildButtons({required IconData icon, required VoidCallback func}) {
    return GestureDetector(
      onTap: func,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color.fromARGB(221, 255, 255, 255),
          borderRadius: BorderRadius.circular(32),
        ),
        child: Icon(icon, color: const Color(0xFF3A83F1)),
      ),
    );
  }

  Widget onBuildStoryButtons() {
    return Column(
      children: [
        onBuildItemButton(
            text: "Да... Пока никак особо, живу от зарплаты до зарплаты...",
            flag: () {
              setState(() {
                isStartFirstWay = !isStartFirstWay;
                stageBaseStory = 0;
              });
            },
            stage: stageStoryScript1),
        onBuildItemButton(
            text:
                "Ты знаешь, а все идет довольно неплохо, даже откладывать получается.",
            flag: () {
              setState(() {
                isStartSecondWay = !isStartSecondWay;
                stageBaseStory = 0;
              });
            },
            stage: stageStoryScript2),
      ],
    );
  }

  Widget onBuildItemButton(
      {required int stage, required VoidCallback flag, required String text}) {
    return ElevatedButton(
      onPressed: flag,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
        backgroundColor: MaterialStateProperty.all(const Color(0xFF3A83F1)),
      ),
      child: Container(
        margin: const EdgeInsets.all(4),
        child: Text(text),
      ),
    );
  }
}
