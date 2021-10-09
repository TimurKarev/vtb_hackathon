import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'loading_state.dart';

class LoadingCubit extends Cubit<LoadingState> {
  LoadingCubit() : super(LoadingInitial());

  void loadApp() async {
    await Future.delayed(const Duration(seconds: 2));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? sharedUuid = prefs.getString("uuid");
    //print(sharedUuid ?? "NULL");
    if (sharedUuid == null) {
      final String uuid = const Uuid().v1();
      await prefs.setString('counter', uuid);
      emit(FirstTimeStart());
    } else {
      emit(ExpUserState());
    }
  }

}
