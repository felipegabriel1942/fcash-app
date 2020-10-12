
import 'package:fcash_app/data/database/app_database.dart';
import 'package:fcash_app/data/models/expense.dart';
import 'package:get_it/get_it.dart';

class ExpensesRepository {

  final localDataSource = GetIt.I.get<AppDatabase>().expenseLocalDataSource;


  Future<int> insertExpense(Expense expense) {
    return localDataSource.insertExpense(expense);
  }

  Future<int> deleteExpense(Expense expense) {
    return localDataSource.deleteExpense(expense);
  }

  Future<int> updateExpense(Expense expense) {
    return localDataSource.updateExpense(expense);
  }

  Future<List<Expense>> findAll() {
    return localDataSource.findAll();
  }

  Future<Expense> findById(int id) {
    return localDataSource.findById(id);
  }
}