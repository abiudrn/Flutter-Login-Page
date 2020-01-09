import 'package:flutter_login_page/models/app_state.dart';
import 'package:flutter_login_page/reducers/auth_reducer.dart';
import 'package:flutter_login_page/reducers/user_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    user: userReducer(state.user, action),
    authStatus: authStateReducer(state.authStatus, action),
  );
}
