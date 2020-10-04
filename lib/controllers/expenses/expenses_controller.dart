import 'package:fcash_app/data/models/expense.dart';
import 'package:fcash_app/data/repositories/expense_repository.dart';
import 'package:jiffy/jiffy.dart';
import 'package:mobx/mobx.dart';
part 'expenses_controller.g.dart';

class ExpensesController = _ExpensesControllerBase with _$ExpensesController;

abstract class _ExpensesControllerBase with Store {
  final expensesRepository = ExpensesRepository();

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

  Future<void> deleteExpense(int index) async {
    try {
      await expensesRepository.deleteExpense(expensesList.elementAt(index));
      expensesList.removeAt(index);
    } catch (e) {
      print(e);
    } finally {
      isBusy = false;
    }
  }

  Future<void> loadExpenses() async {
    try {
      isBusy = true;

      totalValue = 0;

      expensesList.clear();

      await expensesRepository.findAll().then((value) {
        value.forEach((element) {
          if (DateTime.parse(element.date).month == selectedMonth.month) {
            final expense = Expense(
                id: element.id,
                description: element.description,
                date: element.date,
                value: element.value,
                categorie: element.categorie,
                observation: element.observation);
            totalValue += expense.value;

            expensesList.add(expense);
          }
        });
      });
      return expensesList;
    } catch (e) {
      print(e);
    } finally {
      isBusy = false;
    }
  }
}
