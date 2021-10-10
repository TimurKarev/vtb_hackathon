
import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:vtb_hackathon/scor/data/json.dart';
import 'package:path_provider/path_provider.dart';


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

Future<void> writeCounter(String type ,int counter) async {
  Directory tempDir = await getApplicationDocumentsDirectory();
String tempPath = tempDir.path;
print("PATH"+tempPath.toString());

  final file = File('/data/user/0/com.example.vtb_hackathon/app_flutter/');
  JsonHelper help = JsonHelper(file);
  await help.initialize();
  await help.update(type.toString(),counter.toString());

  print("WRITE JSON");

}
