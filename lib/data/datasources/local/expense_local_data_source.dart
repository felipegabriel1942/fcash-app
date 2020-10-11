
import 'package:fcash_app/data/models/expense.dart';
import 'package:floor/floor.dart';

@dao
abstract class ExpenseLocalDataSource<Entity extends Expense> {

  @insert
  Future<int> insertExpense(Expense expense);

  @update
  Future<int> updateExpense(Expense expense);

  @delete
  Future<int> deleteExpense(Expense expense);

  @Query('SELECT * FROM Expense ORDER BY id DESC')
  Future<List<Expense>> findAll();

  @Query('SELECT * FROM Expense WHERE id = :id')
  Future<Expense> findById(int id);
}