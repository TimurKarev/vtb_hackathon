


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

// part 'cubit_state.dart';


class PageViewCubit extends Cubit<PageViewState> {


  PageViewCubit() : super(const EventInitialize()) {
   getStatus();
  }

  void getStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? isNovice = prefs.getBool("isNovice");
    print("$isNovice");
    if (isNovice==null || isNovice==true) {
      emit(const EventJunior());
    } else {
      emit(const EventPro());
    }
  }

 
}


@immutable
abstract class PageViewState {
  const PageViewState();
}

class EventPro extends PageViewState {
  const EventPro();
}

class EventJunior extends PageViewState {
  const EventJunior();
}

class EventInitialize extends PageViewState {
  const EventInitialize();
}

class EventNoStates extends PageViewState {
  const EventNoStates();
}
