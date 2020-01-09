import 'package:flutter/material.dart';
import 'package:flutter_login_page/models/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'home_page.dart';
import 'login_page.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  // AuthStatus _authStatus = AuthStatus.notSignedIn;

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   AuthProvider.of(context).auth.currentUser().then((user) {
  //     setState(() {
  //       _authStatus =
  //           user == null ? AuthStatus.notSignedIn : AuthStatus.signedIn;
  //     });
  //   });
  // }

  // void _signedIn() {
  //   setState(() {
  //     _authStatus = AuthStatus.signedIn;
  //   });
  // }

  // void _signedOut() {
  //   setState(() {
  //     _authStatus = AuthStatus.notSignedIn;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AuthStatus>(
      converter: (Store store) {
        return store.state.authStatus;
      },
      builder: (BuildContext context, authStatus) {
        switch (authStatus) {
          case AuthStatus.notSignedIn:
            return LoginPage();
            break;
          case AuthStatus.signedIn:
            return HomePage();
            break;
          default:
            return Container();
        }
      },
    );
  }
}
