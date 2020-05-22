import 'package:flutter/material.dart';
import 'package:flutter_hiring_exercise/models/user.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../models/app_state.dart';
import '../screens/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (Store<AppState> store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        if (viewModel.isAuthenticated) {
          //authenticated
          //
          //so now we can show user profile
          return Center(child: _profile(context,viewModel.user));
        } else {
          return LoginScreen();
        }
      },
    );
  }
}

Widget _profile(BuildContext context,User user){
  return Container(
    margin: EdgeInsets.all(10),
    width: MediaQuery.of(context).size.width,
    child: Material(
      color: Colors.white,
      elevation: 5,
      shadowColor: Colors.grey.shade200,
      child: Padding(
        padding: EdgeInsets.only(left: 14,right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Center(
                child: CircleAvatar(
                  radius: 45,
                  child: ClipOval(
                    child: Image.network(
                      'https://cdn4.iconfinder.com/data/icons/user-people-2/48/6-512.png',
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 16,),
              child: Text('PERSONAL INFORMATION',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            personalInfo('Nick Name', '${user.userName}',context),
            personalInfo('Full Name', '${user.firstName} ${user.lastName}',context),
            personalInfo('Level', '${user.level}',context),
          ],
        ),
      ),
    ),
  );
}

Widget personalInfo(String key,String val,BuildContext context){
  return Container(
    width: MediaQuery.of(context).size.width,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("$key",
          style: TextStyle(
              fontSize: 10,
              color: Colors.grey),
        ),
        SizedBox(height: 8,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Text("$val",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.black),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
              size: 16,
            )
          ],
        ),
        SizedBox(height: 8,),
        Divider(height: 1,color: Colors.grey,),
        SizedBox(height: 8,),
      ],
    ),
  );
}

class _ViewModel {
  final bool isAuthenticated;
  final User user;

  //viewModel constructor
  //
  //we need to know user is authenticated or not
  //thats why we need to pass these two instance
  _ViewModel({
    @required this.isAuthenticated,
    @required this.user
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      isAuthenticated: store.state.authState.isAuthenticated,
      user: store.state.authState.user
    );
  }
}
