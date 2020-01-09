import 'package:flutter/material.dart';
import 'package:flutter_login_page/actions/auth_actions.dart';
import 'package:flutter_login_page/models/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class HomePage extends StatelessWidget {
  static const String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        actions: <Widget>[
          StoreConnector<AppState, VoidCallback>(
            converter: (Store store) {
              return () {
                store.dispatch(LogOut());
              };
            },
            builder: (BuildContext context, callback) {
              return FlatButton(
                child: Text('Logout',
                    style: TextStyle(
                      fontSize: 17.0,
                      color: Colors.white,
                    )),
                onPressed: callback,
              );
            },
          ),
        ],
      ),
      body: Container(
        child: Center(
          child: Text('Welcome', style: TextStyle(fontSize: 42)),
        ),
      ),
    );
  }
}
