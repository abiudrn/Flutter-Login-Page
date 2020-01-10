import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_page/authentication/bloc.dart';
import 'package:flutter_login_page/login/login_page.dart';
import 'package:flutter_login_page/pages/splash_screen.dart';
import 'package:flutter_login_page/repositories/user_repository.dart';

import 'home_page.dart';

class RootPage extends StatelessWidget {
  final UserRepository _userRepository;

  RootPage({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (BuildContext context, state) {
        if (state is Uninitialized) {
          return SplashScreen();
        }
        if (state is Unauthenticated) {
          return LoginPage(userRepository: _userRepository);
        }
        if (state is Authenticated) {
          return HomePage(
            name: state.displayName,
          );
        }
        return Container();
      },
    );
  }
}
