import 'package:fcash_app/data/models/expense.dart';
import 'package:fcash_app/data/models/revenue.dart';
import 'package:fcash_app/data/repositories/dataview_repository.dart';
import 'package:fcash_app/data/repositories/expense_repository.dart';
import 'package:fcash_app/data/repositories/revenue_repository.dart';
import 'package:jiffy/jiffy.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final expensesRepository = ExpensesRepository();
  final revenuesRepository = RevenuesRepository();
  final dataViewRepository = DataViewRepository();

  @observable
  double totalExpenseValue = 0;

  @observable
  double totalRevenueValue = 0;

  @observable
  double pagamentosTotalValue = 0;

  @observable
  double alimentacaoTotalValue = 0;

  @observable
  double educacaoTotalValue = 0;

  @observable
  double lazerTotalValue = 0;

  @observable
  double moradiaTotalValue = 0;

  @observable
  double roupaTotalValue = 0;

  @observable
  double saudeTotalValue = 0;

  @observable
  double transporteTotalValue = 0;

  @observable
  bool isBusy = false;

  @observable
  ObservableList<Expense> expensesList = ObservableList();

  @observable
  ObservableList<Revenue> revenuesList = ObservableList();

  @observable
  DateTime selectedMonth = DateTime.now();

  @action
  void setSelectedMonth(DateTime value) {
    selectedMonth = value;
  }

  @computed
  double get totalResultValue => totalRevenueValue - totalExpenseValue;

  increaseMonth() {
    setSelectedMonth(Jiffy(selectedMonth).add(months: 1));
    this.loadExpenses();
    this.loadRevenues();
    this.loadExpensesByCategory();
  }

  decreaseMonth() {
    setSelectedMonth(Jiffy(selectedMonth).subtract(months: 1));
    this.loadExpenses();
    this.loadRevenues();
    this.loadExpensesByCategory();
  }

  Future<void> loadExpensesByCategory() async {
    try {
      pagamentosTotalValue = 0;
      alimentacaoTotalValue = 0;
      educacaoTotalValue = 0;
      lazerTotalValue = 0;
      moradiaTotalValue = 0;
      roupaTotalValue = 0;
      saudeTotalValue = 0;
      transporteTotalValue = 0;

      var month = selectedMonth.month.toString().length < 2
          ? '0${selectedMonth.month.toString()}'
          : selectedMonth.month.toString();

      var year = selectedMonth.year.toString();

      await dataViewRepository.getExpensesByCategory(month, year).then((value) {
        value.forEach((element) {
          if (element.category == 'pagamentos') {
            pagamentosTotalValue += element.value;
          }

          if (element.category == 'alimentacao') {
            alimentacaoTotalValue += element.value;
          }

          if (element.category == 'educacao') {
            educacaoTotalValue += element.value;
          }

          if (element.category == 'lazer') {
            lazerTotalValue += element.value;
          }

          if (element.category == 'moradia') {
            moradiaTotalValue += element.value;
          }

          if (element.category == 'roupa') {
            roupaTotalValue += element.value;
          }

          if (element.category == 'saude') {
            saudeTotalValue += element.value;
          }

          if (element.category == 'transporte') {
            transporteTotalValue += element.value;
          }
        });
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> loadExpenses() async {
    try {
      isBusy = true;

      totalExpenseValue = 0;

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
            totalExpenseValue += expense.value;
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

  Future<void> loadRevenues() async {
    try {
      isBusy = true;

      totalRevenueValue = 0;

      revenuesList.clear();

      await revenuesRepository.findAll().then((value) {
        value.forEach((element) {
          if (DateTime.parse(element.date).month == selectedMonth.month) {
            final expense = Revenue(
                id: element.id,
                description: element.description,
                date: element.date,
                value: element.value,
                categorie: element.categorie,
                observation: element.observation);
            totalRevenueValue += expense.value;
            revenuesList.add(expense);
          }
        });
      });
      return revenuesList;
    } catch (e) {
      print(e);
    } finally {
      isBusy = false;
    }
  }
}
