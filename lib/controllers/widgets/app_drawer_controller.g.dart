// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_drawer_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppDrawerController on _AppDrawerControllerBase, Store {
  final _$userNameAtom = Atom(name: '_AppDrawerControllerBase.userName');

  @override
  String get userName {
    _$userNameAtom.reportRead();
    return super.userName;
  }

  @override
  set userName(String value) {
    _$userNameAtom.reportWrite(value, super.userName, () {
      super.userName = value;
    });
  }

  final _$userImageAtom = Atom(name: '_AppDrawerControllerBase.userImage');

  @override
  String get userImage {
    _$userImageAtom.reportRead();
    return super.userImage;
  }

  @override
  set userImage(String value) {
    _$userImageAtom.reportWrite(value, super.userImage, () {
      super.userImage = value;
    });
  }

  final _$setUserNameAsyncAction =
      AsyncAction('_AppDrawerControllerBase.setUserName');

  @override
  Future<void> setUserName(String value) {
    return _$setUserNameAsyncAction.run(() => super.setUserName(value));
  }

  final _$setUserImageAsyncAction =
      AsyncAction('_AppDrawerControllerBase.setUserImage');

  @override
  Future<void> setUserImage(String value) {
    return _$setUserImageAsyncAction.run(() => super.setUserImage(value));
  }

  @override
  String toString() {
    return '''
userName: ${userName},
userImage: ${userImage}
    ''';
  }
}
