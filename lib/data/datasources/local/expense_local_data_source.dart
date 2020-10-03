
import 'package:fcash_app/data/models/expense.dart';
import 'package:floor/floor.dart';

@dao
abstract class ExpenseLocalDataSource<Entity extends Expense> {

  @insert
  Future<int> insertExpense(Expense expense);

  @delete
  Future<int> deleteExpense(Expense expense);
}