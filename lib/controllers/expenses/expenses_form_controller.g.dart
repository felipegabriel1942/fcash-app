// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expenses_form_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ExpensesFormController on _ExpensesFormControllerBase, Store {
  Computed<bool> _$isDescriptionValidComputed;

  @override
  bool get isDescriptionValid => (_$isDescriptionValidComputed ??=
          Computed<bool>(() => super.isDescriptionValid,
              name: '_ExpensesFormControllerBase.isDescriptionValid'))
      .value;
  Computed<bool> _$isExpenseValueValidComputed;

  @override
  bool get isExpenseValueValid => (_$isExpenseValueValidComputed ??=
          Computed<bool>(() => super.isExpenseValueValid,
              name: '_ExpensesFormControllerBase.isExpenseValueValid'))
      .value;
  Computed<bool> _$isDateValidComputed;

  @override
  bool get isDateValid =>
      (_$isDateValidComputed ??= Computed<bool>(() => super.isDateValid,
              name: '_ExpensesFormControllerBase.isDateValid'))
          .value;
  Computed<bool> _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_ExpensesFormControllerBase.isFormValid'))
          .value;
  Computed<Function> _$saveButtonPressedComputed;

  @override
  Function get saveButtonPressed => (_$saveButtonPressedComputed ??=
          Computed<Function>(() => super.saveButtonPressed,
              name: '_ExpensesFormControllerBase.saveButtonPressed'))
      .value;

  final _$autovalidateAtom =
      Atom(name: '_ExpensesFormControllerBase.autovalidate');

  @override
  bool get autovalidate {
    _$autovalidateAtom.reportRead();
    return super.autovalidate;
  }

  @override
  set autovalidate(bool value) {
    _$autovalidateAtom.reportWrite(value, super.autovalidate, () {
      super.autovalidate = value;
    });
  }

  final _$idAtom = Atom(name: '_ExpensesFormControllerBase.id');

  @override
  int get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(int value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  final _$descriptionAtom =
      Atom(name: '_ExpensesFormControllerBase.description');

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  final _$expenseValueAtom =
      Atom(name: '_ExpensesFormControllerBase.expenseValue');

  @override
  String get expenseValue {
    _$expenseValueAtom.reportRead();
    return super.expenseValue;
  }

  @override
  set expenseValue(String value) {
    _$expenseValueAtom.reportWrite(value, super.expenseValue, () {
      super.expenseValue = value;
    });
  }

  final _$dateAtom = Atom(name: '_ExpensesFormControllerBase.date');

  @override
  DateTime get date {
    _$dateAtom.reportRead();
    return super.date;
  }

  @override
  set date(DateTime value) {
    _$dateAtom.reportWrite(value, super.date, () {
      super.date = value;
    });
  }

  final _$categorieAtom = Atom(name: '_ExpensesFormControllerBase.categorie');

  @override
  int get categorie {
    _$categorieAtom.reportRead();
    return super.categorie;
  }

  @override
  set categorie(int value) {
    _$categorieAtom.reportWrite(value, super.categorie, () {
      super.categorie = value;
    });
  }

  final _$observationAtom =
      Atom(name: '_ExpensesFormControllerBase.observation');

  @override
  String get observation {
    _$observationAtom.reportRead();
    return super.observation;
  }

  @override
  set observation(String value) {
    _$observationAtom.reportWrite(value, super.observation, () {
      super.observation = value;
    });
  }

  final _$isBusyAtom = Atom(name: '_ExpensesFormControllerBase.isBusy');

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

  final _$isFormSavedAtom =
      Atom(name: '_ExpensesFormControllerBase.isFormSaved');

  @override
  bool get isFormSaved {
    _$isFormSavedAtom.reportRead();
    return super.isFormSaved;
  }

  @override
  set isFormSaved(bool value) {
    _$isFormSavedAtom.reportWrite(value, super.isFormSaved, () {
      super.isFormSaved = value;
    });
  }

  final _$transactionCategoryListAtom =
      Atom(name: '_ExpensesFormControllerBase.transactionCategoryList');

  @override
  List<TransactionCategory> get transactionCategoryList {
    _$transactionCategoryListAtom.reportRead();
    return super.transactionCategoryList;
  }

  @override
  set transactionCategoryList(List<TransactionCategory> value) {
    _$transactionCategoryListAtom
        .reportWrite(value, super.transactionCategoryList, () {
      super.transactionCategoryList = value;
    });
  }

  final _$_ExpensesFormControllerBaseActionController =
      ActionController(name: '_ExpensesFormControllerBase');

  @override
  void setDescription(String value) {
    final _$actionInfo = _$_ExpensesFormControllerBaseActionController
        .startAction(name: '_ExpensesFormControllerBase.setDescription');
    try {
      return super.setDescription(value);
    } finally {
      _$_ExpensesFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String descriptionValidation(String value) {
    final _$actionInfo = _$_ExpensesFormControllerBaseActionController
        .startAction(name: '_ExpensesFormControllerBase.descriptionValidation');
    try {
      return super.descriptionValidation(value);
    } finally {
      _$_ExpensesFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setExpenseValue(String value) {
    final _$actionInfo = _$_ExpensesFormControllerBaseActionController
        .startAction(name: '_ExpensesFormControllerBase.setExpenseValue');
    try {
      return super.setExpenseValue(value);
    } finally {
      _$_ExpensesFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String expenseValueValidation(String value) {
    final _$actionInfo =
        _$_ExpensesFormControllerBaseActionController.startAction(
            name: '_ExpensesFormControllerBase.expenseValueValidation');
    try {
      return super.expenseValueValidation(value);
    } finally {
      _$_ExpensesFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDate(DateTime value) {
    final _$actionInfo = _$_ExpensesFormControllerBaseActionController
        .startAction(name: '_ExpensesFormControllerBase.setDate');
    try {
      return super.setDate(value);
    } finally {
      _$_ExpensesFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String dateValidation(String value) {
    final _$actionInfo = _$_ExpensesFormControllerBaseActionController
        .startAction(name: '_ExpensesFormControllerBase.dateValidation');
    try {
      return super.dateValidation(value);
    } finally {
      _$_ExpensesFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCategorie(int value) {
    final _$actionInfo = _$_ExpensesFormControllerBaseActionController
        .startAction(name: '_ExpensesFormControllerBase.setCategorie');
    try {
      return super.setCategorie(value);
    } finally {
      _$_ExpensesFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String categorieValidation(String value) {
    final _$actionInfo = _$_ExpensesFormControllerBaseActionController
        .startAction(name: '_ExpensesFormControllerBase.categorieValidation');
    try {
      return super.categorieValidation(value);
    } finally {
      _$_ExpensesFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setObservation(String value) {
    final _$actionInfo = _$_ExpensesFormControllerBaseActionController
        .startAction(name: '_ExpensesFormControllerBase.setObservation');
    try {
      return super.setObservation(value);
    } finally {
      _$_ExpensesFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setExpense(Expense expense) {
    final _$actionInfo = _$_ExpensesFormControllerBaseActionController
        .startAction(name: '_ExpensesFormControllerBase.setExpense');
    try {
      return super.setExpense(expense);
    } finally {
      _$_ExpensesFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
autovalidate: ${autovalidate},
id: ${id},
description: ${description},
expenseValue: ${expenseValue},
date: ${date},
categorie: ${categorie},
observation: ${observation},
isBusy: ${isBusy},
isFormSaved: ${isFormSaved},
transactionCategoryList: ${transactionCategoryList},
isDescriptionValid: ${isDescriptionValid},
isExpenseValueValid: ${isExpenseValueValid},
isDateValid: ${isDateValid},
isFormValid: ${isFormValid},
saveButtonPressed: ${saveButtonPressed}
    ''';
  }
}
