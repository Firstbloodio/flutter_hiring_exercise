import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'models/app_state.dart';
import 'screens/main_screen.dart';

class App extends StatelessWidget {
  final Store<AppState> store;

  const App(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
            title: 'FB',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              brightness: Brightness.dark,
              primaryColor: Colors.purple[900],
              accentColor: Colors.white
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark
            ),
            routes: <String, WidgetBuilder>{
              '/': (BuildContext context) => MainScreen()
            }));
  }
}
