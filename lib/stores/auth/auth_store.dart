import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

enum AuthStatus { loggedIn, notLoggedIn }

class AuthStatusStore = _AuthStatusStore with _$AuthStatusStore;

abstract class _AuthStatusStore with Store {
  @observable
  AuthStatus status = AuthStatus.notLoggedIn;

  @action
  void setAuthStatus(AuthStatus status) {
    this.status = status;
  }
}
