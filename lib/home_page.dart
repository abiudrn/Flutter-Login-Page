import 'package:flutter/material.dart';
import 'package:flutter_login_page/models/app_model.dart';
import 'package:scoped_model/scoped_model.dart';

import 'models/auth_state_model.dart';

class HomePage extends StatelessWidget {
  static const String routeName = "/home";

  void _signOut(AppModel model) async {
    try {
      var auth = model.auth;
      await auth.signOut();
      model.setStatus(AuthStatus.notSignedIn);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        actions: <Widget>[
          ScopedModelDescendant<AppModel>(
            builder: (BuildContext context, Widget child, AppModel model) {
              return FlatButton(
                child: Text('Logout',
                    style: TextStyle(
                      fontSize: 17.0,
                      color: Colors.white,
                    )),
                onPressed: () => _signOut(model),
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
