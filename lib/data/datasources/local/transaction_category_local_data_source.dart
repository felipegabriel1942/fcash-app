
import 'package:fcash_app/data/models/transaction_category.dart';
import 'package:floor/floor.dart';

@dao
abstract class TransactionCategoryLocalDataSource<Entity extends TransactionCategory> {

  @insert
  Future<int> insertTransactionCategory(TransactionCategory transactionCategory);

  @Query('SELECT * FROM TransactionCategory WHERE transactionType = :type')
  Future<List<TransactionCategory>> findByTransactionType(String type);

  @Query('SELECT * FROM TransactionCategory')
  Future<List<TransactionCategory>> getAllTransactionsCategories();

  @insert
  Future<List<int>> saveAllTransactionCategories(List<TransactionCategory> transactionCategories);
}