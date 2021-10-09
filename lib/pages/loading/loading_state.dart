part of 'loading_cubit.dart';

@immutable
abstract class LoadingState {}

class LoadingInitial extends LoadingState {}

class FirstTimeStart extends LoadingState {}

class ExpUserState extends LoadingState {}
