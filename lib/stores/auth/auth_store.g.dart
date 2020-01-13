// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthStatusStore on _AuthStatusStore, Store {
  final _$statusAtom = Atom(name: '_AuthStatusStore.status');

  @override
  AuthStatus get status {
    _$statusAtom.context.enforceReadPolicy(_$statusAtom);
    _$statusAtom.reportObserved();
    return super.status;
  }

  @override
  set status(AuthStatus value) {
    _$statusAtom.context.conditionallyRunInAction(() {
      super.status = value;
      _$statusAtom.reportChanged();
    }, _$statusAtom, name: '${_$statusAtom.name}_set');
  }

  final _$_AuthStatusStoreActionController =
      ActionController(name: '_AuthStatusStore');

  @override
  void setAuthStatus(AuthStatus status) {
    final _$actionInfo = _$_AuthStatusStoreActionController.startAction();
    try {
      return super.setAuthStatus(status);
    } finally {
      _$_AuthStatusStoreActionController.endAction(_$actionInfo);
    }
  }
}
