

import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';


// Future<String> _loadAVaultAsset() async {
//   return await rootBundle.loadString('assets/json/scoring_result.json');
// }

// Future loadVault() async {
//   String jsonString = await _loadAVaultAsset();
//   final jsonResponse = json.decode(jsonString);
//   var add = jsonResponse.toString();

//   var content = "EsdfsdfsE";
//   add = add.replaceFirst(new RegExp(r'}]'), "},"+content.toString()+"]");

//   print(add); //shows the full json string that I want. 

// }

// Future<void> writeCounter(int counter) async {
//   // final directory = await getApplicationDocumentsDirectory();
//   final file = File('assets/json/scoring_result.txt');
//   // final file = await _localFile;
//   file.writeAsStringSync(json.encode("'sdfsdf':$counter"));
//   print("WRITE JSON");
//   // Write the file
//   // return file.writeAsString('$counter');
// }

// /data/user/0/com.example.vtb_hackathon/app_flutter/scoring_result.json

class JsonHelper {
  String title = "scoring_result.json"; //scoring_result.json
  File jsonFileDirectory;

  JsonHelper(this.jsonFileDirectory);

  Future? initialize()async  {
    var directory = await getApplicationDocumentsDirectory();
    // then((directory) {
      jsonFileDirectory = File(directory.path + "/" + title);
      print("FileDirectory : "+jsonFileDirectory.toString());
      if (jsonFileDirectory.existsSync()) {
        print("EEEEE");
      } else {
        print("CREAT");
        jsonFileDirectory.createSync();
      }
    // });
    return null;
  }

  void create(String key, String value) {
    Map<String, dynamic> content = {key: value};
    if (!jsonFileDirectory.existsSync()) {
      initialize();
    }
    Map<String, dynamic> jsonFileContent =
        json.decode(jsonFileDirectory.readAsStringSync());
    jsonFileContent.addAll(content);
    jsonFileDirectory.writeAsStringSync(json.encode(jsonFileContent));
  }

  Map<String, dynamic> read() {
    var fileContent = json.decode(jsonFileDirectory.readAsStringSync());
    return fileContent;
  }

  Future? update(String key, String value)async {
    // Map<String?, dynamic?>?
   Map jsonFileContent =
        json.decode(
          jsonFileDirectory.readAsStringSync() //;
          );
          print("FILE CONTET"+jsonFileContent.toString());
    // var jsonFileContent =await rootBundle.loadString(jsonFileDirectory.toString());
    // Map<String, dynamic> jsonFileContent2 = json.decode(jsonFileContent);
    jsonFileContent[key] = value;
    Map<String?, dynamic?>? json2 = {};
    json2[key] = value;
    jsonFileDirectory.writeAsStringSync(
      // "{'$key':'$value'}"
      json.encode(jsonFileContent)
    );
  }

  void delete(String key) {
    Map<String, dynamic> jsonFileContent =
        json.decode(jsonFileDirectory.readAsStringSync());
    jsonFileContent.remove(key);
    jsonFileDirectory.writeAsStringSync(json.encode(jsonFileContent));
  }
}