import 'package:scoped_model/scoped_model.dart';

enum AuthStatus { signedIn, notSignedIn }

mixin AuthStateModel on Model {
  AuthStatus status = AuthStatus.notSignedIn;

  void setStatus(AuthStatus status) {
    this.status = status;
    notifyListeners();
  }
}
