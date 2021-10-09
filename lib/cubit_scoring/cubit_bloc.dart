
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'dart:math';
import 'package:flutter/widgets.dart';

part 'cubit_state.dart';


class ScorinCubit extends Cubit<ScorinCubitState> {
  double startDeposit = 100000;
  double monthDeposit = 5000;
  double percentage = 10;

  ScorinCubit() : super(const InitialS([]));

  void setStartDeposit(double value) {
    startDeposit = value;
    _calculate();
  }

  void setMonthDeposit(double value) {
    monthDeposit = value;
    _calculate();
  }

  void setPercentage(double value) {
    percentage = value;
    _calculate();
  }

  void _calculate() {
    List<double> incomeList = [];
    double income = startDeposit;
   for (int i=0; i<12; i++) {
      income = startDeposit + monthDeposit * i;//(i == 0? 0 : 1);
      income = income * (percentage*.01) / 12 + income;
      incomeList.add(income);
    }
    emit(InitialS(incomeList));
  }
}