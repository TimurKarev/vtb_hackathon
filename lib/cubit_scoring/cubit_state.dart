

part of 'cubit_bloc.dart';



@immutable
abstract class ScorinCubitState {
  const ScorinCubitState();
}

class InitialS extends ScorinCubitState {
  final List<double> value;

  const InitialS(this.value);
}
