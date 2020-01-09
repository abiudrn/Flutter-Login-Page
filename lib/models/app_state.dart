import 'package:firebase_auth/firebase_auth.dart';

enum AuthStatus { signedIn, notSignedIn }

class AppState {
  final FirebaseUser user;
  final AuthStatus authStatus;

  AppState({this.authStatus, this.user});

  AppState copyWith({user, authStatus}) {
    return AppState(
      user: user ?? this.user,
      authStatus: authStatus ?? this.authStatus,
    );
  }
}
