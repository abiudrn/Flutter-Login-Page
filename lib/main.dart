import 'package:flutter/material.dart';
import 'package:flutter_login_page/middleware/auth_middleware.dart';
import 'package:flutter_login_page/models/app_state.dart';
import 'package:flutter_login_page/pages/root_page.dart';
import 'package:flutter_login_page/reducers/app_reducer.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final store = Store<AppState>(
    appReducer,
    initialState: AppState(authStatus: AuthStatus.notSignedIn),
    middleware: []..addAll(createAuthMiddleware()),
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: RootPage(),
      ),
    );
  }
}
