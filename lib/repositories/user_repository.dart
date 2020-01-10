import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  final FirebaseAuth _auth;

  UserRepository({FirebaseAuth auth}) : _auth = auth ?? FirebaseAuth.instance;

  Future<FirebaseUser> signInWithEmailAndPassword(
      String email, String password) async {
    AuthResult result = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return result.user;
  }

  Future<void> signOut() async {
    return _auth.signOut();
  }

  Future<bool> isSignedIn() async {
    final currentUser = await _auth.currentUser();
    return currentUser != null;
  }

  Future<String> getUser() async {
    return (await _auth.currentUser()).email;
  }
}
