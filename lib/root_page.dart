import 'package:flutter/material.dart';
import 'package:flutter_login_page/AuthProvider.dart';
import 'package:flutter_login_page/login_page.dart';

import 'home_page.dart';

enum AuthStatus { signedIn, notSignedIn }

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  AuthStatus _authStatus = AuthStatus.notSignedIn;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    AuthProvider.of(context).auth.currentUser().then((user) {
      setState(() {
        _authStatus =
            user == null ? AuthStatus.notSignedIn : AuthStatus.signedIn;
      });
    });
  }

  void _signedIn() {
    setState(() {
      _authStatus = AuthStatus.signedIn;
    });
  }

  void _signedOut() {
    setState(() {
      _authStatus = AuthStatus.notSignedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (_authStatus) {
      case AuthStatus.notSignedIn:
        return LoginPage(
          onSignedIn: () {
            _signedIn();
          },
        );
        break;
      case AuthStatus.signedIn:
        return HomePage(
          onSignedOut: () {
            _signedOut();
          },
        );
      default:
        return Container();
    }
  }
}
