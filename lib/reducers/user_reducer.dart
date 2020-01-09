import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_page/actions/auth_actions.dart';
import 'package:redux/redux.dart';

final userReducer = combineReducers<FirebaseUser>([
  TypedReducer<FirebaseUser, LoginSuccessful>(_login),
]);

FirebaseUser _login(FirebaseUser user, action) {
  return user;
}
