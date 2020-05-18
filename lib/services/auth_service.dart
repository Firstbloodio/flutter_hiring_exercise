import 'dart:async';
import 'dart:core';

class AuthService {

  const AuthService();

  Future<Map<String, dynamic>> login(String email, String password) async {
    
    // fake service call 
    await Future.delayed(const Duration(seconds: 2), () {});

    // fake login auth token
    final Map<String, String> authData = {
      'token': 'example_fake_token'
    };

    return authData;
  }

}
