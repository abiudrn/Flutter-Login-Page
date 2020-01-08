import 'package:flutter/material.dart';
import 'package:flutter_login_page/auth.dart';
import 'package:flutter_login_page/login_page.dart';

import 'home_page.dart';

enum AuthStatus { signedIn, notSignedIn }

class RootPage extends StatefulWidget {
  final BaseAuth auth;

  const RootPage({this.auth});

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  AuthStatus _authStatus = AuthStatus.notSignedIn;

  @override
  void initState() {
    super.initState();
    widget.auth.currentUser().then((user) {
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
    var homePage = HomePage(
      auth: widget.auth,
      onSignedOut: () {
        setState(() {
          _authStatus = AuthStatus.notSignedIn;
        });
      },
    );
    switch (_authStatus) {
      case AuthStatus.notSignedIn:
        return LoginPage(
          auth: widget.auth,
          onSignedIn: () {
            setState(() {
              _authStatus = AuthStatus.signedIn;
            });
          },
        );
        break;
      case AuthStatus.signedIn:
        return homePage;
      default:
        return Container();
    }
  }
}
