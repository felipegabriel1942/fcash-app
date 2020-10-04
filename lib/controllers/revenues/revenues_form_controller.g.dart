// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'revenues_form_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RevenuesFormController on _RevenuesFormControllerBase, Store {
  Computed<bool> _$isDescriptionValidComputed;

  @override
  bool get isDescriptionValid => (_$isDescriptionValidComputed ??=
          Computed<bool>(() => super.isDescriptionValid,
              name: '_RevenuesFormControllerBase.isDescriptionValid'))
      .value;
  Computed<bool> _$isRevenueValueValidComputed;

  @override
  bool get isRevenueValueValid => (_$isRevenueValueValidComputed ??=
          Computed<bool>(() => super.isRevenueValueValid,
              name: '_RevenuesFormControllerBase.isRevenueValueValid'))
      .value;
  Computed<bool> _$isDateValidComputed;

  @override
  bool get isDateValid =>
      (_$isDateValidComputed ??= Computed<bool>(() => super.isDateValid,
              name: '_RevenuesFormControllerBase.isDateValid'))
          .value;
  Computed<bool> _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_RevenuesFormControllerBase.isFormValid'))
          .value;
  Computed<Function> _$saveButtonPressedComputed;

  @override
  Function get saveButtonPressed => (_$saveButtonPressedComputed ??=
          Computed<Function>(() => super.saveButtonPressed,
              name: '_RevenuesFormControllerBase.saveButtonPressed'))
      .value;

  final _$autovalidateAtom =
      Atom(name: '_RevenuesFormControllerBase.autovalidate');

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

  final _$idAtom = Atom(name: '_RevenuesFormControllerBase.id');

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
      Atom(name: '_RevenuesFormControllerBase.description');

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

  final _$revenueValueAtom =
      Atom(name: '_RevenuesFormControllerBase.revenueValue');

  @override
  String get revenueValue {
    _$revenueValueAtom.reportRead();
    return super.revenueValue;
  }

  @override
  set revenueValue(String value) {
    _$revenueValueAtom.reportWrite(value, super.revenueValue, () {
      super.revenueValue = value;
    });
  }

  final _$dateAtom = Atom(name: '_RevenuesFormControllerBase.date');

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

  final _$categorieAtom = Atom(name: '_RevenuesFormControllerBase.categorie');

  @override
  String get categorie {
    _$categorieAtom.reportRead();
    return super.categorie;
  }

  @override
  set categorie(String value) {
    _$categorieAtom.reportWrite(value, super.categorie, () {
      super.categorie = value;
    });
  }

  final _$observationAtom =
      Atom(name: '_RevenuesFormControllerBase.observation');

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

  final _$isBusyAtom = Atom(name: '_RevenuesFormControllerBase.isBusy');

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
      Atom(name: '_RevenuesFormControllerBase.isFormSaved');

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

  final _$_RevenuesFormControllerBaseActionController =
      ActionController(name: '_RevenuesFormControllerBase');

  @override
  void setDescription(String value) {
    final _$actionInfo = _$_RevenuesFormControllerBaseActionController
        .startAction(name: '_RevenuesFormControllerBase.setDescription');
    try {
      return super.setDescription(value);
    } finally {
      _$_RevenuesFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String descriptionValidation(String value) {
    final _$actionInfo = _$_RevenuesFormControllerBaseActionController
        .startAction(name: '_RevenuesFormControllerBase.descriptionValidation');
    try {
      return super.descriptionValidation(value);
    } finally {
      _$_RevenuesFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRevenueValue(String value) {
    final _$actionInfo = _$_RevenuesFormControllerBaseActionController
        .startAction(name: '_RevenuesFormControllerBase.setRevenueValue');
    try {
      return super.setRevenueValue(value);
    } finally {
      _$_RevenuesFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String revenueValueValidation(String value) {
    final _$actionInfo =
        _$_RevenuesFormControllerBaseActionController.startAction(
            name: '_RevenuesFormControllerBase.revenueValueValidation');
    try {
      return super.revenueValueValidation(value);
    } finally {
      _$_RevenuesFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDate(DateTime value) {
    final _$actionInfo = _$_RevenuesFormControllerBaseActionController
        .startAction(name: '_RevenuesFormControllerBase.setDate');
    try {
      return super.setDate(value);
    } finally {
      _$_RevenuesFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String dateValidation(String value) {
    final _$actionInfo = _$_RevenuesFormControllerBaseActionController
        .startAction(name: '_RevenuesFormControllerBase.dateValidation');
    try {
      return super.dateValidation(value);
    } finally {
      _$_RevenuesFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCategorie(String value) {
    final _$actionInfo = _$_RevenuesFormControllerBaseActionController
        .startAction(name: '_RevenuesFormControllerBase.setCategorie');
    try {
      return super.setCategorie(value);
    } finally {
      _$_RevenuesFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String categorieValidation(String value) {
    final _$actionInfo = _$_RevenuesFormControllerBaseActionController
        .startAction(name: '_RevenuesFormControllerBase.categorieValidation');
    try {
      return super.categorieValidation(value);
    } finally {
      _$_RevenuesFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setObservation(String value) {
    final _$actionInfo = _$_RevenuesFormControllerBaseActionController
        .startAction(name: '_RevenuesFormControllerBase.setObservation');
    try {
      return super.setObservation(value);
    } finally {
      _$_RevenuesFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRevenue(Revenue revenue) {
    final _$actionInfo = _$_RevenuesFormControllerBaseActionController
        .startAction(name: '_RevenuesFormControllerBase.setRevenue');
    try {
      return super.setRevenue(revenue);
    } finally {
      _$_RevenuesFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
autovalidate: ${autovalidate},
id: ${id},
description: ${description},
revenueValue: ${revenueValue},
date: ${date},
categorie: ${categorie},
observation: ${observation},
isBusy: ${isBusy},
isFormSaved: ${isFormSaved},
isDescriptionValid: ${isDescriptionValid},
isRevenueValueValid: ${isRevenueValueValid},
isDateValid: ${isDateValid},
isFormValid: ${isFormValid},
saveButtonPressed: ${saveButtonPressed}
    ''';
  }
}
