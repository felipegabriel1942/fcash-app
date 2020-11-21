import 'package:fcash_app/data/database/app_database.dart';
import 'package:fcash_app/data/models/transaction_category.dart';
import 'package:get_it/get_it.dart';

class TransactionCategoryRepository {
  final localDataSource =
      GetIt.I.get<AppDatabase>().transactionCategoryLocalDataSource;

  Future<void> insertTransactionCategory(
      TransactionCategory transactionCategory) {
    return localDataSource.insertTransactionCategory(transactionCategory);
  }

  Future<List<TransactionCategory>> findByTransactionType(String type) {
    return localDataSource.findByTransactionType(type);
  }

  Future<List<TransactionCategory>> getAllTransactionCategories() {
    return localDataSource.getAllTransactionsCategories();
  }

  Future<List<int>> saveAllTransactionCategories(List<TransactionCategory> transactionCategories) {
    return localDataSource.saveAllTransactionCategories(transactionCategories);
  }
}
