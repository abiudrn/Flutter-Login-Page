import 'package:firebase_auth/firebase_auth.dart';
import 'package:scoped_model/scoped_model.dart';

mixin UserModel on Model {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseUser user;

  void setUser(FirebaseUser user) {
    this.user = user;
    notifyListeners();
  }
}
