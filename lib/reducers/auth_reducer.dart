import 'package:flutter_login_page/actions/auth_actions.dart';
import 'package:flutter_login_page/models/app_state.dart';
import 'package:redux/redux.dart';

final authStateReducer = combineReducers<AuthStatus>([
  TypedReducer<AuthStatus, LoginSuccessful>(_login),
]);

AuthStatus _login(AuthStatus status, action) {
  return action.authStatus;
}
