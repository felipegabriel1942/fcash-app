import 'package:fcash_app/data/models/expense.dart';
import 'package:jiffy/jiffy.dart';
import 'package:mobx/mobx.dart';
part 'expenses_controller.g.dart';

class ExpensesController = _ExpensesControllerBase with _$ExpensesController;

abstract class _ExpensesControllerBase with Store {
  @observable
  ObservableList<Expense> expensesList = ObservableList();

  @observable
  double totalValue = 0;

  @observable
  bool isBusy = false;

  @observable
  DateTime selectedMonth = DateTime.now();

  @action
  void setSelectedMonth(DateTime value) {
    selectedMonth = value;
  }

  increaseMonth() {
    setSelectedMonth(Jiffy(selectedMonth).add(months: 1));
    this.loadExpenses();
  }

  decreaseMonth() {
    setSelectedMonth(Jiffy(selectedMonth).subtract(months: 1));
    this.loadExpenses();
  }

  Future<void> loadExpenses() async {
    try {
      isBusy = true;

      totalValue = 0;

      expensesList.clear();

      // await ExpensesRepository().loadExpenses().then((value) {
      //   value.forEach((element) {
      //     if (element.date.month == selectedMonth.month) {
      //       final expense = Expense(
      //           description: element.description,
      //           date: element.date,
      //           value: element.value,
      //           categorie: element.categorie,
      //           observation: element.observation);
      //       totalValue += expense.value;

      //       expensesList.add(expense);
      //     }
      //   });
      // });
      return expensesList;
    } catch (e) {
      print(e);
    } finally {
      isBusy = false;
    }
  }
}