import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_page/stores/auth/auth_store.dart';
import 'package:mobx/mobx.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final AuthStatusStore authStatusStore = AuthStatusStore();

  @observable
  FirebaseUser user;

  void signInWithEmailAndPassword(String email, String password) {
    _signInWithEmailAndPassword(email, password);
  }

  void signOut() {
    _signOut();
  }

  @action
  void setUser(FirebaseUser user) {
    this.user = user;
  }

  @action
  Future _signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = authResult.user;
      authStatusStore.setAuthStatus(AuthStatus.loggedIn);
    } catch (e) {
      throw e;
    }
  }

  @action
  Future _signOut() async {
    try {
      await _auth.signOut();
      authStatusStore.setAuthStatus(AuthStatus.notLoggedIn);
    } catch (e) {
      throw e;
    }
  }
}
