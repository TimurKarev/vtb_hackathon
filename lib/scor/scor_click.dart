

// Откуда нажатие
// Тип наажатия
// 


import 'package:shared_preferences/shared_preferences.dart';
import 'package:vtb_hackathon/scor/data/json_wtire.dart';

enum TypeClick{
  Link, //ссылки ВТБ
  Question, // вопросы
  Info, // просмотр доп инвормации
  PageCount, // страницы - здесь собриаем количество
  //typePage- типы страниц, 
  Page1,
  Page2,

  //type Game -типы игр , можно сюжетов
  Game1,
  Game2,

  Rewarding, //Награждение - медальки, достижения, награды, плюшки, 
  Notification, // уведомление - 

  EventTimerStart,
  EventTimerEnd
}


void analitEventClick(TypeClick event){
  switch(event){
    
    case TypeClick.Link:
     
      _scropeType(TypeClick.Link);
      break;
    case TypeClick.Question:
  
       _scropeType(TypeClick.Question);
      break;
    case TypeClick.Info:
    
       _scropeType(TypeClick.Info);
      break;
    case TypeClick.PageCount:
       _scropeType(TypeClick.PageCount);
      break;
    case TypeClick.Page1:
    
       _scropeType(TypeClick.Page1);
      break;
    case TypeClick.Page2:
      
       _scropeType(TypeClick.Page2);
      break;
    case TypeClick.Game1:
     
       _scropeType(TypeClick.Game1);
      break;
    case TypeClick.Game2:
      
       _scropeType(TypeClick.Game2);
      break;
    case TypeClick.Rewarding:
     
       _scropeType(TypeClick.Rewarding);
      break;
    case TypeClick.Notification:
      
       _scropeType(TypeClick.Notification);
      break;
    // case TypeClick.EventTimerStart:
    // 
    //   break;
    // case TypeClick.EventTimerEnd:
    //   
    //   break;
  }
}


void _scropeType(TypeClick type) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int counter = (prefs.getInt(type.toString()) ?? 0) + 1;
  print("type : "+type.toString());
  print("counter : "+counter.toString());
  await prefs.setInt(type.toString(), counter);
}

analizeScore(Result res) async {
  print("Result pre_start");
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // List<Map<String, int>> map = [];
  int rating = 0;
  switch(res){
    case Result.Difficulties:
      print("Result start");
      if(TypeClick.values ==null){
        print("TypeClick.value == null");
      }
      for (var value in TypeClick.values) {
        if(value == null){
          print("value == null");
          break;
        }
        print("EERR "+value.toString());
        int get = prefs.getInt(value.toString()) ?? 0;
         rating = _ret((value as TypeClick ), get) ;
      }
      writeCounter("Difficulties",rating);
      break;
    case Result.Interest:
      print("Result start");
      if(TypeClick.values ==null){
        print("TypeClick.value == null");
      }
       for (var value in TypeClick.values) {
         if(value == null){
           print("value == null");
           break;
         }
         print("EERR "+value.toString());

         int get = prefs.getInt(value.toString()) ?? 0;
        rating =  _ret((value as TypeClick ), get) ;
      }
      writeCounter("Interest",rating);
      break;
    case Result.Desire:
      print("Result start");
      if(TypeClick.values ==null){
        print("TypeClick.value == null");
      }
       for (var value in TypeClick.values) {
         if(value == null){
           print("value == null");
           break;
         }
         print("EERR "+value.toString());

         int get = prefs.getInt(value.toString())?? 0;
        rating = _ret((value as TypeClick ), get) ;
      }
      writeCounter("Desire",rating);
      break;
    case Result.StartEaseLevel:
      print("Result start");
      if(TypeClick.values ==null){
        print("TypeClick.value == null");
      }
    for (var value in TypeClick.values) {
      if(value == null){
        print("value == null");
        break;
      }
      print("EERR "+value.toString());

      int get = prefs.getInt((value as TypeClick ).toString())?? 0;
        rating = _ret((value as TypeClick ), get) ;
      }
      writeCounter("StartEaseLevel",rating);
      break;
  }

  
}

// Map<String, int>
int  _ret(TypeClick even , int count)  {
   int val = 1;
   String ss = "";

  switch(even){
    
    case TypeClick.Link:
      val = count ;
      break;
    case TypeClick.Question:
      val = count * -1;
      break;
    case TypeClick.Info:
      val = count * -1;
      break;
    case TypeClick.PageCount:
      val = count * -1;
      break;
    case TypeClick.Page1:
      val = count ;
      break;
    case TypeClick.Page2:
      val = count ;
      break;
    case TypeClick.Game1:
      val = count ;
      break;
    case TypeClick.Game2:
      val = count ;
      break;
    case TypeClick.Rewarding:
      val = count ;
      break;
    case TypeClick.Notification:
      val = count ;
      break;
    case TypeClick.EventTimerStart:
      val = (count / 100) .toInt() ;
      break;
    case TypeClick.EventTimerEnd:
      val = ((count / 100)* -1  ).toInt()  ;
      break;
  }
  // Map<String, int> map = {ss: val};
  return val;
}

enum Result{
  Difficulties, //Трудности
  Interest,
  Desire,
  StartEaseLevel
}