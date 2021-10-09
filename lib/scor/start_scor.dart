
import 'package:shared_preferences/shared_preferences.dart';


void startScore(){
  _countStart();
}

void _countStart() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int counter = (prefs.getInt('start_app') ?? 0) + 1;
  print("Start :"+counter.toString());
  await prefs.setInt('start_app', counter);
}