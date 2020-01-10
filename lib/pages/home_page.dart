import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_page/authentication/authentication_bloc.dart';
import 'package:flutter_login_page/authentication/authentication_event.dart';

class HomePage extends StatelessWidget {
  static const String routeName = "/home";

  final String name;

  HomePage({Key key, @required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            onPressed: () {
              BlocProvider.of<AuthenticationBloc>(context).add(
                LoggedOut(),
              );
            },
          ),
        ],
      ),
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Welcome $name',
              style: Theme.of(context).textTheme.title,
            ),
          ),
        ),
      ),
    );
  }
}
