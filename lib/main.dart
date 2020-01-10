import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_page/authentication/authentication_bloc.dart';
import 'package:flutter_login_page/authentication/bloc.dart';
import 'package:flutter_login_page/pages/root_page.dart';
import 'package:flutter_login_page/repositories/user_repository.dart';

import 'authentication/authentication_event.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final UserRepository userRepository = UserRepository();
  runApp(BlocProvider(
    create: (BuildContext context) {
      return AuthenticationBloc(userRepository: userRepository)
        ..add(AppStarted());
    },
    child: MyApp(userRepository: userRepository),
  ));
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository;

  const MyApp({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: RootPage(
          userRepository: userRepository,
        ));
  }
}
