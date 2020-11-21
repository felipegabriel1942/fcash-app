import 'package:fcash_app/controllers/expenses/expenses_controller.dart';
import 'package:fcash_app/data/models/expense.dart';
import 'package:fcash_app/data/models/transaction_category.dart';
import 'package:fcash_app/data/repositories/expense_repository.dart';
import 'package:fcash_app/data/repositories/transaction_category_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'expenses_form_controller.g.dart';

class ExpensesFormController = _ExpensesFormControllerBase
    with _$ExpensesFormController;

abstract class _ExpensesFormControllerBase with Store {
  final expensesRepository = ExpensesRepository();
  final expensesController = GetIt.I<ExpensesController>();
  final transactionCategoryRepository = TransactionCategoryRepository();

  @observable
  bool autovalidate = false;

  @observable
  int id;

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
  int categorie;

  @action
  void setCategorie(int value) => categorie = value;

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

  @observable
  List<TransactionCategory> transactionCategoryList;

  Future<void> getTransactionCategoryList() async {
    transactionCategoryList =
        await transactionCategoryRepository.findByTransactionType('DESPESA');
  }

  @action
  void setExpense(Expense expense) {
    id = expense.id;
    description = expense.description;
    expenseValue = expense.value.toStringAsFixed(2);
    date = DateTime.parse(expense.date);
    //categorie = expense.categorie;
    observation = expense.observation;
  }

  Future<void> _saveExpense() async {
    isBusy = true;

    final newExpense = Expense(
      id: id,
      description: description,
      value: double.parse(expenseValue),
      date: date.toIso8601String(),
      //categorie: categorie,
      observation: observation,
    );

    try {
      id == null
          ? await expensesRepository.insertExpense(newExpense)
          : await expensesRepository.updateExpense(newExpense);

      await expensesController.loadExpenses();
      isFormSaved = true;
    } catch (e) {
      print(e);
    } finally {
      isBusy = false;
    }
  }
}
