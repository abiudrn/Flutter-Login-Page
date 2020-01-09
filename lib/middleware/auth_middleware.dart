import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_page/actions/auth_actions.dart';
import 'package:flutter_login_page/models/app_state.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createAuthMiddleware() {
  final logIn = _createLogInMiddleware();
  final logOut = _createLogOutMiddleware();

  return [
    new TypedMiddleware<AppState, Login>(logIn),
    new TypedMiddleware<AppState, LogOut>(logOut)
  ];
}

Middleware<AppState> _createLogOutMiddleware() {
  return (Store store, action, NextDispatcher next) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    if (action is LogOut) {
      try {
        await _auth.signOut();
        store.dispatch(LogOutSuccessful());
      } catch (e) {
        print(e);
      }
    }

    next(action);
  };
}

Middleware<AppState> _createLogInMiddleware() {
  return (Store store, action, NextDispatcher next) async {
    FirebaseUser user;
    final FirebaseAuth _auth = FirebaseAuth.instance;

    if (action is Login) {
      try {
        user = (await _auth.signInWithEmailAndPassword(
          email: action.email,
          password: action.password,
        ))
            .user;

        print('${user.uid}');
        store.dispatch(
            LoginSuccessful(user: user, authStatus: AuthStatus.signedIn));
      } catch (e) {
        store.dispatch(LogInFail(e));
      }
    }
    next(action);
  };
}
