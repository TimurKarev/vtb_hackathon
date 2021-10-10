

import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';

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

Future<void> writeCounter(int counter) async {
  // final directory = await getApplicationDocumentsDirectory();
  final file = File('assets/json/scoring_result.json');
  // final file = await _localFile;
  file.writeAsStringSync(json.encode("'sdfsdf':$counter"));
  print("WRITE JSON");
  // Write the file
  // return file.writeAsString('$counter');
}
