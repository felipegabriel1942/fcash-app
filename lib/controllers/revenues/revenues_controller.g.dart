// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'revenues_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RevenuesController on _RevenuesControllerBase, Store {
  final _$revenuesListAtom = Atom(name: '_RevenuesControllerBase.revenuesList');

  @override
  ObservableList<Revenue> get revenuesList {
    _$revenuesListAtom.reportRead();
    return super.revenuesList;
  }

  @override
  set revenuesList(ObservableList<Revenue> value) {
    _$revenuesListAtom.reportWrite(value, super.revenuesList, () {
      super.revenuesList = value;
    });
  }

  final _$totalValueAtom = Atom(name: '_RevenuesControllerBase.totalValue');

  @override
  double get totalValue {
    _$totalValueAtom.reportRead();
    return super.totalValue;
  }

  @override
  set totalValue(double value) {
    _$totalValueAtom.reportWrite(value, super.totalValue, () {
      super.totalValue = value;
    });
  }

  final _$isBusyAtom = Atom(name: '_RevenuesControllerBase.isBusy');

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

  final _$selectedMonthAtom =
      Atom(name: '_RevenuesControllerBase.selectedMonth');

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

  final _$_RevenuesControllerBaseActionController =
      ActionController(name: '_RevenuesControllerBase');

  @override
  void setSelectedMonth(DateTime value) {
    final _$actionInfo = _$_RevenuesControllerBaseActionController.startAction(
        name: '_RevenuesControllerBase.setSelectedMonth');
    try {
      return super.setSelectedMonth(value);
    } finally {
      _$_RevenuesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
revenuesList: ${revenuesList},
totalValue: ${totalValue},
isBusy: ${isBusy},
selectedMonth: ${selectedMonth}
    ''';
  }
}
