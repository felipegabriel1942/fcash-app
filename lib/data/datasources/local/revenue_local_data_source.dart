import 'package:fcash_app/data/models/revenue.dart';
import 'package:floor/floor.dart';

@dao
abstract class RevenueLocalDataSource<Entity extends Revenue> {

  @insert
  Future<int> insertRevenue(Revenue revenue);

  @update
  Future<int> updateRevenue(Revenue revenue);

  @delete
  Future<int> deleteRevenue(Revenue revenue);

  @Query('SELECT * FROM Revenue ORDER BY id DESC')
  Future<List<Revenue>> findAll();

  @Query('SELECT * FROM Revenue WHERE id = :id')
  Future<Revenue> findById(int id);
}