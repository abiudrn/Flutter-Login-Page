import 'package:flutter/material.dart';
import 'package:flutter_login_page/auth.dart';
import 'package:flutter_login_page/login_page.dart';
import 'package:flutter_login_page/root_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final Auth auth = Auth();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RootPage(
        auth: auth,
      ),
      routes: {LoginPage.routeName: (context) => LoginPage(auth: auth)},
    );
  }
}
