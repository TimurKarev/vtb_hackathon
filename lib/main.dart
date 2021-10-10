import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vtb_hackathon/pages/loading/loading_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:vtb_hackathon/scor/data/json.dart';

import 'dart:io';
import 'package:path_provider/path_provider.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    writeCounter(5);
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
      home: const LoadingPage(),
    );
  }
}

Future<String> _loadAVaultAsset() async {
  return await rootBundle.loadString('assets/json/scoring_result.json');
}

Future loadVault() async {
  String jsonString = await _loadAVaultAsset();
  final jsonResponse = json.decode(jsonString);
  var add = jsonResponse.toString();

  var content = "EsdfsdfsE";
  add = add.replaceFirst(new RegExp(r'}]'), "},"+content.toString()+"]");

  print(add); //shows the full json string that I want. 

}
// Future<String> get _localPath async {
 
//   final directory = await getApplicationDocumentsDirectory();

//   return directory.path;
// }

Future<void> writeCounter(int counter) async {
  Directory tempDir = await getApplicationDocumentsDirectory();
String tempPath = tempDir.path;
print("PATH"+tempPath.toString());

  final file = File('/data/user/0/com.example.vtb_hackathon/app_flutter/');
  JsonHelper help = JsonHelper(file);
  await help.initialize();
  await help.update("ret","value");

  print("WRITE JSON");

}
