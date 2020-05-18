import 'package:flutter_hiring_exercise/app.dart';
import 'package:flutter_hiring_exercise/models/app_state.dart';
import 'package:flutter_hiring_exercise/store/store.dart';
import 'package:redux/redux.dart';

class TestUtils {
  static Future<App> createApp() async {
    final Store<AppState> store = createStore();
    return App(store);
  }
}
