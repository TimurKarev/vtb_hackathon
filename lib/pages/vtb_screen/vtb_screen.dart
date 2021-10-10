import 'package:flutter/material.dart';
import 'package:vtb_hackathon/pages/common/vtb_card.dart';
import 'package:vtb_hackathon/pages/styles.dart';

class VTBScreen extends StatelessWidget {
  const VTBScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Styles.mainColor,
      child: Column(children: const [
        VTBCard(
          file: "vtb_icon",
          header: "Втб мои инвестиции",
          text: "инвестируйте в официальном приложении ВТБ мои инвестиции",
        ),
        VTBCard(
          file: "telegram_icon",
          header: "Втб в телеграм",
          text: "наш официальный телеграм канал",
        ),
      ]),
    );
  }
}

