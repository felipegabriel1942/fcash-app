
import 'package:fcash_app/data/database/app_database.dart';
import 'package:fcash_app/data/models/expense.dart';
import 'package:get_it/get_it.dart';

class ExpensesRepository {

  final localDataSource = GetIt.I<AppDatabase>().expenseLocalDataSource;

  Future<void> insertExpense(Expense expense) {
    return localDataSource.insertExpense(expense);
  }

  Future<void> deleteExpense(Expense expense) {
    return localDataSource.deleteExpense(expense);
  }
}