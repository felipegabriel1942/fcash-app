// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expenses_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ExpensesController on _ExpensesControllerBase, Store {
  final _$expensesListAtom = Atom(name: '_ExpensesControllerBase.expensesList');

  @override
  ObservableList<Expense> get expensesList {
    _$expensesListAtom.reportRead();
    return super.expensesList;
  }

  @override
  set expensesList(ObservableList<Expense> value) {
    _$expensesListAtom.reportWrite(value, super.expensesList, () {
      super.expensesList = value;
    });
  }

  final _$totalValueAtom = Atom(name: '_ExpensesControllerBase.totalValue');

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

  final _$isBusyAtom = Atom(name: '_ExpensesControllerBase.isBusy');

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
      Atom(name: '_ExpensesControllerBase.selectedMonth');

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

  final _$_ExpensesControllerBaseActionController =
      ActionController(name: '_ExpensesControllerBase');

  @override
  void setSelectedMonth(DateTime value) {
    final _$actionInfo = _$_ExpensesControllerBaseActionController.startAction(
        name: '_ExpensesControllerBase.setSelectedMonth');
    try {
      return super.setSelectedMonth(value);
    } finally {
      _$_ExpensesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
expensesList: ${expensesList},
totalValue: ${totalValue},
isBusy: ${isBusy},
selectedMonth: ${selectedMonth}
    ''';
  }
}
