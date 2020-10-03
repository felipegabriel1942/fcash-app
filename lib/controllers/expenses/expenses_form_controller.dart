import 'package:mobx/mobx.dart';
part 'expenses_form_controller.g.dart';

class ExpensesFormController = _ExpensesFormControllerBase with _$ExpensesFormController;

abstract class _ExpensesFormControllerBase with Store {
   @observable
  bool autovalidate = false;

  void setAutovalidate() => autovalidate = !autovalidate;

  @observable
  String description;

  @action
  void setDescription(String value) => description = value;

  @computed
  bool get isDescriptionValid => description != null && description.isNotEmpty;

  @action
  String descriptionValidation(String value) {
    if (!isDescriptionValid) {
      return 'Campo obrigatório';
    }
    return null;
  }

  @observable
  String expenseValue;

  @action
  void setExpenseValue(String value) => expenseValue = value;

  @computed
  bool get isExpenseValueValid =>
      expenseValue != null && expenseValue.isNotEmpty;

  @action
  String expenseValueValidation(String value) {
    if (!isExpenseValueValid) {
      return 'Campo obrigatório';
    }
    return null;
  }

  @observable
  DateTime date = DateTime.now();

  @action
  void setDate(DateTime value) => date = value;

  @computed
  bool get isDateValid => date != null;

  @action
  String dateValidation(String value) {
    if (!isDateValid) {
      return 'Campo obrigatório';
    }
    return null;
  }

  @observable
  String categorie;

  @action
  void setCategorie(String value) => categorie = value;

  @action
  String categorieValidation(String value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }

  @observable
  String observation;

  @observable
  bool isBusy = false;

  @action
  void setObservation(String value) => observation = value;

  @computed
  bool get isFormValid =>
      isDescriptionValid && isExpenseValueValid && isDateValid;

  @computed
  Function get saveButtonPressed => isFormValid ? _saveExpense : () {};

  @observable
  bool isFormSaved = false;
  
  Future<void> _saveExpense() async {

    isBusy = true;

    // final newExpense = Expense(
    //   description: description,
    //   value: double.parse(expenseValue),
    //   date: date,
    //   categorie: categorie,
    //   observation: observation
    // );
    
    // try {
    //   await ExpensesRepository().saveExpense(newExpense);
    //   isFormSaved = true;
    // } catch (e) {
    //   print(e);
    // }

    isBusy = false;
  }
}