import 'package:fcash_app/data/database/app_database.dart';
import 'package:fcash_app/data/models/data_views/expense_by_categorie.dart';
import 'package:get_it/get_it.dart';

class DataViewRepository {
  final localDataSource = GetIt.I<AppDatabase>();

  Future<List<ExpenseByCategory>> getExpensesByCategory(String month, String year) {
    return localDataSource.expenseByCategoryDataSource.getExpensesByCategory(month, year);
  }
}