import 'package:flutter/material.dart';
import 'package:flutter_hiring_exercise/containers/auth_loading_indicator.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../actions/auth_actions.dart';
import '../models/app_state.dart';

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              _showEmailInput(),
              _showPasswordInput(),
              _showErrorMessage(),
              _showLoginButton(),
              _showRegisterButton(),
              AuthLoadingIndicator(),
            ],
          ),
        ));
  }

  Widget _showEmailInput() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
      child: TextFormField(
          maxLines: 1,
          keyboardType: TextInputType.emailAddress,
          autofocus: false,
          decoration: InputDecoration(
              hintText: 'Email',
              icon: Icon(
                Icons.mail,
                color: Colors.grey,
              )),
          validator: (String value) =>
              value.isEmpty ? 'Email can\'t be empty' : null,
          controller: _emailController),
    );
  }

  Widget _showPasswordInput() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: TextFormField(
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: InputDecoration(
            hintText: 'Password',
            icon: Icon(
              Icons.lock,
              color: Colors.grey,
            )),
        validator: (String value) =>
            value.isEmpty ? 'Password can\'t be empty' : null,
        controller: _passwordController,
      ),
    );
  }

  Widget _showLoginButton() {
    return Padding(
        padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
        child: StoreConnector<AppState, OnLoginCallback>(
            converter: (Store<AppState> store) {
          return (String email, String password) {
            store.dispatch(UserLoginRequest(
              email: email,
              password: password,
            ));
          };
        }, builder: (BuildContext context, OnLoginCallback onLogin) {
          return MaterialButton(
            elevation: 5.0,
            minWidth: 200.0,
            height: 42.0,
            color: Colors.purple,
            child: Text('Login',
                style: TextStyle(fontSize: 20.0, color: Colors.white)),
            onPressed: () {
              if(_formKey.currentState.validate()){
                onLogin(_emailController.text, _passwordController.text);
              }else{
                Scaffold
                    .of(context)
                    .showSnackBar(SnackBar(content: Text('Invalid credential')));
              }
            },
          );
        }));
  }

  Widget _showRegisterButton() {
    return Padding(
        padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
        child: StoreConnector<AppState, OnLoginCallback>(
            converter: (Store<AppState> store) {
          return (String email, String password) {
            store.dispatch(UserLoginRequest(
              email: email,
              password: password,
            ));
          };
        }, builder: (BuildContext context, OnLoginCallback onLogin) {
          return MaterialButton(
            elevation: 5.0,
            minWidth: 200.0,
            height: 42.0,
            child: Text('Create account',
                style: TextStyle(fontSize: 17.0, color: Colors.white60)),
            onPressed: () {
              final snackBar = SnackBar(
                content: Text('Feature not available yet!'),
                duration: Duration(seconds: 1),
              );
              Scaffold.of(context).showSnackBar(snackBar);
            },
          );
        }));
  }

  Widget _showErrorMessage() {
    return StoreConnector<AppState, String>(
        converter: (Store<AppState> store) => store.state.authState.error,
        builder: (BuildContext context, String error) {
          if (error != null) {
            return Text(
              error,
              style: TextStyle(
                  fontSize: 13.0,
                  color: Colors.red,
                  height: 1.0,
                  fontWeight: FontWeight.w300),
            );
          } else {
            return Container();
          }
        });
  }
}

String _validateEmail(String email) {
  if (email.isEmpty) {
    // The email is empty
    return "Enter email address";
  }
  // This is just a regular expression for email addresses
  String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
      "\\@" +
      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
      "(" +
      "\\." +
      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
      ")+";
  RegExp regExp = new RegExp(p);

  if (regExp.hasMatch(email)) {
    // So, the email is valid
    return null;
  }
  // The pattern of the email didn't match the regex above.
  return 'Email is not valid';
}
String validatePassword(String value) {
  if (value.length == 0) {
    return 'Password is Required';
  } else if (value.length < 6) {
    return 'Password Should be more than 6.';
  }
  return null;
}

typedef OnLoginCallback = Function(String email, String password);
