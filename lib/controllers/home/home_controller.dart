import 'package:jiffy/jiffy.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
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
    // this.loadExpenses();
  }

  decreaseMonth() {
    setSelectedMonth(Jiffy(selectedMonth).subtract(months: 1));
    // this.loadExpenses();
  }
}