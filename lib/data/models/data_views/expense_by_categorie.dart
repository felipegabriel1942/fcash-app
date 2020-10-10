import 'package:floor/floor.dart';

@DatabaseView('SELECT categorie AS category, SUM(value) AS value FROM Expense GROUP BY categorie ', viewName: 'expenseByCategory')
class ExpenseByCategory {
  String category;
  double value;

  ExpenseByCategory({
    this.category,
    this.value
  });

}
