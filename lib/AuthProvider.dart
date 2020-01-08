import 'package:flutter/material.dart';
import 'package:flutter_login_page/auth.dart';

class AuthProvider extends InheritedWidget {
  final BaseAuth auth;

  AuthProvider({Key key, Widget child, @required this.auth})
      : super(key: key, child: child);

  static AuthProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AuthProvider>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
