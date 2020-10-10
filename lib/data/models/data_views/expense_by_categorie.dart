import 'package:fcash_app/data/querys/querys.dart';
import 'package:floor/floor.dart';

@DatabaseView(Querys.EXPENSES_BY_CATEGORY, viewName: 'expenseByCategory')
class ExpenseByCategory {
  String category;
  double value;

  ExpenseByCategory({
    this.category,
    this.value
  });

}
