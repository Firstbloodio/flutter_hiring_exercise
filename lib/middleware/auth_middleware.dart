import 'dart:convert';

import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../actions/auth_actions.dart';
import '../models/app_state.dart';
import '../models/user.dart';
import '../services/auth_service.dart';

class AuthMiddleware {
  final AuthService authService;

  const AuthMiddleware({this.authService = const AuthService()});

  List<Middleware<AppState>> createAuthMiddleware() {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, AppStarted>(_appStarted),
      TypedMiddleware<AppState, UserLoginRequest>(_login),
      TypedMiddleware<AppState, UserLoginSuccess>(_loginSuccess),
      TypedMiddleware<AppState, UserLogout>(_logout),
    ];
  }

  void _appStarted(
      Store<AppState> store, AppStarted action, NextDispatcher next) async {
    next(action);

    if (await _hasUser()) {
      store.dispatch(UserLoaded(user: await _getUser()));
    }
  }

  void _login(Store<AppState> store, UserLoginRequest action,
      NextDispatcher next) async {
    next(action);

    try {
      final Map<String, dynamic> authData =
          await authService.login(action.email, action.password);
      print('from middle $authData');
      //_persistToken(authData['token']);
      User user = User.fromJson(authData);
      _persistUser(user);
      store.dispatch(UserLoginSuccess(user: user));
    } catch (e) {
      store.dispatch(UserLoginFailure(error: e.toString()));
    }
  }

  void _loginSuccess(Store<AppState> store, UserLoginSuccess action,
      NextDispatcher next) async {
    next(action);

    store.dispatch(UserLoaded(user: action.user));
  }

  void _logout(
      Store<AppState> store, UserLogout action, NextDispatcher next) async {
    await _deleteUser();

    next(action);
  }

  /// HELPER FUNCTIONS

  Future<String> _getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<void> _deleteUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('firstName');
    await prefs.remove('lastName');
    await prefs.remove('userName');
    await prefs.remove('level');
    print('User removed');
  }

  Future<void> _persistToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    print('Token: $token');
  }

  Future<void> _persistUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('firstName', user.firstName);
    await prefs.setString('lastName', user.lastName);
    await prefs.setString('userName', user.userName);
    await prefs.setString('level', user.level);
    print('user name: ${user.userName}');
  }

  Future<User> _getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String firstName = prefs.getString('firstName');
    final String lastName = prefs.getString('lastName');
    final String userName = prefs.getString('userName');
    final String level = prefs.getString('level');
    return User(firstName: firstName,lastName: lastName,userName: userName,level: level);
  }

  Future<bool> _hasUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('userName') ?? '';

    if (token != '') {
      return true;
    } else {
      return false;
    }
  }
}
