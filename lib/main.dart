import 'package:flutter/material.dart';
import 'package:flutter_login_page/auth.dart';
import 'package:flutter_login_page/root_page.dart';

import 'AuthProvider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final Auth auth = Auth();

  @override
  Widget build(BuildContext context) {
    return AuthProvider(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: RootPage(),
      ),
      auth: auth,
    );
  }
}
