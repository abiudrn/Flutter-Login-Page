import 'package:flutter/material.dart';
import 'package:flutter_login_page/stores/user/user_store.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static const String routeName = "/home";

  void _signOut(UserStore store) async {
    try {
      store.signOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<UserStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        actions: <Widget>[
          FlatButton(
            child: Text('Logout',
                style: TextStyle(
                  fontSize: 17.0,
                  color: Colors.white,
                )),
            onPressed: () => _signOut(store),
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
