import 'package:flutter_login_page/actions/auth_actions.dart';
import 'package:flutter_login_page/models/app_state.dart';
import 'package:redux/redux.dart';

final authStateReducer = combineReducers<AuthStatus>([
  TypedReducer<AuthStatus, LoginSuccessful>(_login),
  TypedReducer<AuthStatus, LogOutSuccessful>(_logout),
]);

AuthStatus _login(AuthStatus status, action) {
  return action.authStatus;
}

AuthStatus _logout(AuthStatus user, action) {
  return AuthStatus.notSignedIn;
}
