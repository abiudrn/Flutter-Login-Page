import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_login_page/models/app_state.dart';

class Login {
  final email;
  final password;

  Login({@required this.email, @required this.password});
}

class LoginSuccessful {
  final FirebaseUser user;
  final AuthStatus authStatus;

  LoginSuccessful({@required this.user, @required this.authStatus});
}

class LogInFail {
  final dynamic error;

  LogInFail(this.error);

  @override
  String toString() {
    return 'LogIn{There was an error loggin in: $error}';
  }
}

class LogOut {}

class LogOutSuccessful {
  LogOutSuccessful();

  @override
  String toString() {
    return 'LogOut{user: null}';
  }
}
