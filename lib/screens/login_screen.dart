import 'package:flutter/material.dart';

import '../containers/login_form.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        LoginForm(),
      ],
    );
  }
}
