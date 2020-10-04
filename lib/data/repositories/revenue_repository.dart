
import 'package:fcash_app/data/database/app_database.dart';
import 'package:fcash_app/data/models/revenue.dart';
import 'package:get_it/get_it.dart';

class RevenuesRepository {

  final localDataSource = GetIt.I<AppDatabase>().revenueLocalDataSource;

  Future<void> insertRevenue(Revenue revenue) {
    return localDataSource.insertRevenue(revenue);
  }

  Future<void> deleteRevenue(Revenue revenue) {
    return localDataSource.deleteRevenue(revenue);
  }

  Future<void> updateRevenue(Revenue revenue) {
    return localDataSource.updateRevenue(revenue);
  }

  Future<List<Revenue>> findAll() {
    return localDataSource.findAll();
  }

  Future<Revenue> findById(int id) {
    return localDataSource.findById(id);
  }
}