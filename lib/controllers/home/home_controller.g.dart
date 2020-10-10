// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  Computed<double> _$totalResultValueComputed;

  @override
  double get totalResultValue => (_$totalResultValueComputed ??=
          Computed<double>(() => super.totalResultValue,
              name: '_HomeControllerBase.totalResultValue'))
      .value;

  final _$totalExpenseValueAtom =
      Atom(name: '_HomeControllerBase.totalExpenseValue');

  @override
  double get totalExpenseValue {
    _$totalExpenseValueAtom.reportRead();
    return super.totalExpenseValue;
  }

  @override
  set totalExpenseValue(double value) {
    _$totalExpenseValueAtom.reportWrite(value, super.totalExpenseValue, () {
      super.totalExpenseValue = value;
    });
  }

  final _$totalRevenueValueAtom =
      Atom(name: '_HomeControllerBase.totalRevenueValue');

  @override
  double get totalRevenueValue {
    _$totalRevenueValueAtom.reportRead();
    return super.totalRevenueValue;
  }

  @override
  set totalRevenueValue(double value) {
    _$totalRevenueValueAtom.reportWrite(value, super.totalRevenueValue, () {
      super.totalRevenueValue = value;
    });
  }

  final _$pagamentosTotalValueAtom =
      Atom(name: '_HomeControllerBase.pagamentosTotalValue');

  @override
  double get pagamentosTotalValue {
    _$pagamentosTotalValueAtom.reportRead();
    return super.pagamentosTotalValue;
  }

  @override
  set pagamentosTotalValue(double value) {
    _$pagamentosTotalValueAtom.reportWrite(value, super.pagamentosTotalValue,
        () {
      super.pagamentosTotalValue = value;
    });
  }

  final _$alimentacaoTotalValueAtom =
      Atom(name: '_HomeControllerBase.alimentacaoTotalValue');

  @override
  double get alimentacaoTotalValue {
    _$alimentacaoTotalValueAtom.reportRead();
    return super.alimentacaoTotalValue;
  }

  @override
  set alimentacaoTotalValue(double value) {
    _$alimentacaoTotalValueAtom.reportWrite(value, super.alimentacaoTotalValue,
        () {
      super.alimentacaoTotalValue = value;
    });
  }

  final _$educacaoTotalValueAtom =
      Atom(name: '_HomeControllerBase.educacaoTotalValue');

  @override
  double get educacaoTotalValue {
    _$educacaoTotalValueAtom.reportRead();
    return super.educacaoTotalValue;
  }

  @override
  set educacaoTotalValue(double value) {
    _$educacaoTotalValueAtom.reportWrite(value, super.educacaoTotalValue, () {
      super.educacaoTotalValue = value;
    });
  }

  final _$lazerTotalValueAtom =
      Atom(name: '_HomeControllerBase.lazerTotalValue');

  @override
  double get lazerTotalValue {
    _$lazerTotalValueAtom.reportRead();
    return super.lazerTotalValue;
  }

  @override
  set lazerTotalValue(double value) {
    _$lazerTotalValueAtom.reportWrite(value, super.lazerTotalValue, () {
      super.lazerTotalValue = value;
    });
  }

  final _$moradiaTotalValueAtom =
      Atom(name: '_HomeControllerBase.moradiaTotalValue');

  @override
  double get moradiaTotalValue {
    _$moradiaTotalValueAtom.reportRead();
    return super.moradiaTotalValue;
  }

  @override
  set moradiaTotalValue(double value) {
    _$moradiaTotalValueAtom.reportWrite(value, super.moradiaTotalValue, () {
      super.moradiaTotalValue = value;
    });
  }

  final _$roupaTotalValueAtom =
      Atom(name: '_HomeControllerBase.roupaTotalValue');

  @override
  double get roupaTotalValue {
    _$roupaTotalValueAtom.reportRead();
    return super.roupaTotalValue;
  }

  @override
  set roupaTotalValue(double value) {
    _$roupaTotalValueAtom.reportWrite(value, super.roupaTotalValue, () {
      super.roupaTotalValue = value;
    });
  }

  final _$saudeTotalValueAtom =
      Atom(name: '_HomeControllerBase.saudeTotalValue');

  @override
  double get saudeTotalValue {
    _$saudeTotalValueAtom.reportRead();
    return super.saudeTotalValue;
  }

  @override
  set saudeTotalValue(double value) {
    _$saudeTotalValueAtom.reportWrite(value, super.saudeTotalValue, () {
      super.saudeTotalValue = value;
    });
  }

  final _$transporteTotalValueAtom =
      Atom(name: '_HomeControllerBase.transporteTotalValue');

  @override
  double get transporteTotalValue {
    _$transporteTotalValueAtom.reportRead();
    return super.transporteTotalValue;
  }

  @override
  set transporteTotalValue(double value) {
    _$transporteTotalValueAtom.reportWrite(value, super.transporteTotalValue,
        () {
      super.transporteTotalValue = value;
    });
  }

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

  final _$expensesListAtom = Atom(name: '_HomeControllerBase.expensesList');

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

  final _$revenuesListAtom = Atom(name: '_HomeControllerBase.revenuesList');

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
totalExpenseValue: ${totalExpenseValue},
totalRevenueValue: ${totalRevenueValue},
pagamentosTotalValue: ${pagamentosTotalValue},
alimentacaoTotalValue: ${alimentacaoTotalValue},
educacaoTotalValue: ${educacaoTotalValue},
lazerTotalValue: ${lazerTotalValue},
moradiaTotalValue: ${moradiaTotalValue},
roupaTotalValue: ${roupaTotalValue},
saudeTotalValue: ${saudeTotalValue},
transporteTotalValue: ${transporteTotalValue},
isBusy: ${isBusy},
expensesList: ${expensesList},
revenuesList: ${revenuesList},
selectedMonth: ${selectedMonth},
totalResultValue: ${totalResultValue}
    ''';
  }
}
