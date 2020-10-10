import 'dart:async';

import 'package:fcash_app/data/datasources/local/data_views/expense_by_category_data_source.dart';
import 'package:fcash_app/data/datasources/local/expense_local_data_source.dart';
import 'package:fcash_app/data/datasources/local/revenue_local_data_source.dart';
import 'package:fcash_app/data/models/data_views/expense_by_categorie.dart';
import 'package:fcash_app/data/models/revenue.dart';
import 'package:floor/floor.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:fcash_app/data/models/expense.dart';

part 'app_database.g.dart';

@Database(
  version: 1,
  entities: [
    Expense,
    Revenue
  ],
  views: [
    ExpenseByCategory
  ]
)
abstract class AppDatabase extends FloorDatabase {
  ExpenseLocalDataSource get expenseLocalDataSource;
  RevenueLocalDataSource get revenueLocalDataSource;
  ExpenseByCategoryDataSource get expenseByCategoryDataSource;
}
