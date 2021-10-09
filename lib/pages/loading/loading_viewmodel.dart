import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

final loadingVMProvider =
    ChangeNotifierProvider<LoadingViewModel>((ref) => LoadingViewModel());

enum LoadingStateEnum {
    loading,
    firstTime,
    multiTime,
}

class LoadingViewModel extends ChangeNotifier {

    LoadingStateEnum loadState = LoadingStateEnum.loading;

    LoadingViewModel() {
        load();
    }

    Future<void> load() async {
        await Future.delayed(const Duration(seconds: 2));
        SharedPreferences prefs = await SharedPreferences.getInstance();
        final String? sharedUuid = prefs.getString("uuid");

        if (sharedUuid == null) {
            final String uuid = const Uuid().v1();
            try {
                await prefs.setString('counter', uuid);

            } finally {
                loadState = LoadingStateEnum.firstTime;
            }
        } else {
            loadState = LoadingStateEnum.multiTime;
        }
        notifyListeners();
    }

}
