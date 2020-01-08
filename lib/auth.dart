import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

abstract class BaseAuth {
  Stream<dynamic> get onAuthStateChanged;
  Future<dynamic> signInWithEmailAndPassword({String email, String password});
  Future<dynamic> createUserWithEmailAndPassword(
      {String email, String password});
  Future<dynamic> currentUser();
  Future<void> signOut();
}

class Auth extends BaseAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Future<FirebaseUser> createUserWithEmailAndPassword(
      {String email, String password}) async {
    FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    ))
        .user;

    return user;
  }

  @override
  Future<FirebaseUser> currentUser() => _auth.currentUser();

  @override
  Stream<FirebaseUser> get onAuthStateChanged => _auth.onAuthStateChanged;

  @override
  Future<FirebaseUser> signInWithEmailAndPassword(
      {String email, String password}) async {
    FirebaseUser user = (await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    ))
        .user;
    return user;
  }

  @override
  Future<void> signOut() => _auth.signOut();
}
