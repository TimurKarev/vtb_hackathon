import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vtb_hackathon/pages/8/start_page.dart';
import 'package:vtb_hackathon/pages/home/home_page.dart';
import 'package:vtb_hackathon/pages/loading/loading_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:vtb_hackathon/pages/personal_achievements/page_personal_achievements.dart';
import 'package:vtb_hackathon/scor/data/json.dart';

import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:vtb_hackathon/scor/scor_click.dart';
import 'package:vtb_hackathon/scor/scor_time.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}
TimerScore? time_score;
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    time_score = TimerScore();
    time_score!.timerScore(TypeClick.EventTimerStart);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => StartPage(),
      //   '/home': (context) => HomePage(),
      //   '/achiv': (context) => Personal_Achievements(),
      // },
      home: const LoadingPage(),
    );
  }
}

