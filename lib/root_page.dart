import 'package:flutter/material.dart';
import 'package:flutter_login_page/login_page.dart';
import 'package:flutter_login_page/models/app_model.dart';
import 'package:flutter_login_page/models/auth_state_model.dart';
import 'package:scoped_model/scoped_model.dart';

import 'home_page.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<AppModel>(
      model: AppModel(),
      child: ScopedModelDescendant<AppModel>(
        builder: (BuildContext context, Widget child, model) {
          if (model.status == AuthStatus.notSignedIn) {
            return LoginPage();
          }
          return HomePage();
        },
      ),
    );
  }
}
