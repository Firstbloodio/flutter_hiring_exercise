import 'dart:async';
import 'dart:convert';
import 'dart:core';

import 'package:flutter_hiring_exercise/models/user.dart';

class AuthService {

  const AuthService();

  Future<Map<String, dynamic>> login(String email, String password) async {

    // fake service call
    await Future.delayed(const Duration(seconds: 2), () {});

    // fake login auth token
    final Map<String, String> authData = {
      'firstName': 'John',
      'lastName': 'Appleseed',
      'username': 'flurryflutter',
      'level': '100'
    };

    print('from service $authData');
    return authData;
  }

}
