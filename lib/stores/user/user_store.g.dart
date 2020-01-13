// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserStore on _UserStore, Store {
  final _$userAtom = Atom(name: '_UserStore.user');

  @override
  FirebaseUser get user {
    _$userAtom.context.enforceReadPolicy(_$userAtom);
    _$userAtom.reportObserved();
    return super.user;
  }

  @override
  set user(FirebaseUser value) {
    _$userAtom.context.conditionallyRunInAction(() {
      super.user = value;
      _$userAtom.reportChanged();
    }, _$userAtom, name: '${_$userAtom.name}_set');
  }

  final _$_signInWithEmailAndPasswordAsyncAction =
      AsyncAction('_signInWithEmailAndPassword');

  @override
  Future<dynamic> _signInWithEmailAndPassword(String email, String password) {
    return _$_signInWithEmailAndPasswordAsyncAction
        .run(() => super._signInWithEmailAndPassword(email, password));
  }

  final _$_signOutAsyncAction = AsyncAction('_signOut');

  @override
  Future<dynamic> _signOut() {
    return _$_signOutAsyncAction.run(() => super._signOut());
  }

  final _$_UserStoreActionController = ActionController(name: '_UserStore');

  @override
  void setUser(FirebaseUser user) {
    final _$actionInfo = _$_UserStoreActionController.startAction();
    try {
      return super.setUser(user);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }
}
