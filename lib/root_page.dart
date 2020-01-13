import 'package:flutter/material.dart';
import 'package:flutter_login_page/login_page.dart';
import 'package:flutter_login_page/stores/auth/auth_store.dart';
import 'package:flutter_login_page/stores/user/user_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

class RootPage extends StatelessWidget {
  final UserStore userStore = UserStore();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<UserStore>(create: (_) => userStore),
      ],
      child: Observer(
        builder: (BuildContext context) {
          if (userStore.authStatusStore.status == AuthStatus.notLoggedIn) {
            return LoginPage();
          }
          return HomePage();
        },
      ),
    );
  }
}
