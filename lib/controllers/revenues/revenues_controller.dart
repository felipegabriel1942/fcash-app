import 'package:fcash_app/data/models/revenue.dart';
import 'package:fcash_app/data/repositories/revenue_repository.dart';
import 'package:jiffy/jiffy.dart';
import 'package:mobx/mobx.dart';
part 'revenues_controller.g.dart';

class RevenuesController = _RevenuesControllerBase with _$RevenuesController;

abstract class _RevenuesControllerBase with Store {
  
  final revenuesRepository = RevenuesRepository();

  @observable
  ObservableList<Revenue> revenuesList = ObservableList();

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
    loadRevenues();
  }

  decreaseMonth() {
    setSelectedMonth(Jiffy(selectedMonth).subtract(months: 1));
    loadRevenues();
  }

  Future<void> deleteRevenue(int index) async {
    try {
      await revenuesRepository.deleteRevenue(revenuesList.elementAt(index));
      totalValue = totalValue - revenuesList.elementAt(index).value;
      revenuesList.removeAt(index);
    } catch (e) {
      print(e);
    } finally {
      isBusy = false;
    }
  }

  Future<void> loadRevenues() async {
    try {
      isBusy = true;

      totalValue = 0;

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
            totalValue += expense.value;

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