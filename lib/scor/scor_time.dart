



import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vtb_hackathon/scor/scor_click.dart';



class TimerScore{

  late Stopwatch stopwatch; //..start();
  TimerScore(){
     stopwatch = Stopwatch();
  }

  TypeClick? eva;

  void timerScore(TypeClick event){
    eva = event;
    if(event != null){
      switch(event){
        case TypeClick.EventTimerStart:
        print(event.toString());
          if(eva == event ){
            break; 
          }
          stopwatch.start();
        break;
        case TypeClick.EventTimerEnd:
         print(event.toString());
          stopwatch.stop();
          //передает данные, записывает их
          Duration timerResult = stopwatch.elapsed;
          _writeTime(timerResult);
        break;
      }
    }
  }

  _writeTime(Duration duration) async {
    int time = duration.inSeconds;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("Time : "+time.toString());
    await prefs.setInt('timer_scor', time);
  }

}



