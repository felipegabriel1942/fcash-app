import 'package:fcash_app/data/models/data_views/expense_by_categorie.dart';
import 'package:fcash_app/data/querys/querys.dart';
import 'package:floor/floor.dart';

@dao
abstract class ExpenseByCategoryDataSource<Entity extends ExpenseByCategory> {

  @Query(Querys.EXPENSES_BY_CATEGORY)
  Future<List<ExpenseByCategory>> getExpensesByCategory(String month, String year);

}