// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$isBusyAtom = Atom(name: '_HomeControllerBase.isBusy');

  @override
  bool get isBusy {
    _$isBusyAtom.reportRead();
    return super.isBusy;
  }

  @override
  set isBusy(bool value) {
    _$isBusyAtom.reportWrite(value, super.isBusy, () {
      super.isBusy = value;
    });
  }

  final _$selectedMonthAtom = Atom(name: '_HomeControllerBase.selectedMonth');

  @override
  DateTime get selectedMonth {
    _$selectedMonthAtom.reportRead();
    return super.selectedMonth;
  }

  @override
  set selectedMonth(DateTime value) {
    _$selectedMonthAtom.reportWrite(value, super.selectedMonth, () {
      super.selectedMonth = value;
    });
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  void setSelectedMonth(DateTime value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setSelectedMonth');
    try {
      return super.setSelectedMonth(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isBusy: ${isBusy},
selectedMonth: ${selectedMonth}
    ''';
  }
}
