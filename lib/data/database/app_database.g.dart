// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  ExpenseLocalDataSource _expenseLocalDataSourceInstance;

  RevenueLocalDataSource _revenueLocalDataSourceInstance;

  ExpenseByCategoryDataSource _expenseByCategoryDataSourceInstance;

  TransactionCategoryLocalDataSource
      _transactionCategoryLocalDataSourceInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Expense` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `description` TEXT, `value` REAL, `date` TEXT, `categorie` TEXT, `observation` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Revenue` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `description` TEXT, `value` REAL, `date` TEXT, `categorie` TEXT, `observation` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `TransactionCategory` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `category` TEXT, `transactionType` TEXT, `icon` TEXT)');

        await database.execute(
            '''CREATE VIEW IF NOT EXISTS `expenseByCategory` AS SELECT categorie AS category, SUM(value) AS value FROM Expense GROUP BY categorie ''');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  ExpenseLocalDataSource get expenseLocalDataSource {
    return _expenseLocalDataSourceInstance ??=
        _$ExpenseLocalDataSource(database, changeListener);
  }

  @override
  RevenueLocalDataSource get revenueLocalDataSource {
    return _revenueLocalDataSourceInstance ??=
        _$RevenueLocalDataSource(database, changeListener);
  }

  @override
  ExpenseByCategoryDataSource get expenseByCategoryDataSource {
    return _expenseByCategoryDataSourceInstance ??=
        _$ExpenseByCategoryDataSource(database, changeListener);
  }

  @override
  TransactionCategoryLocalDataSource get transactionCategoryLocalDataSource {
    return _transactionCategoryLocalDataSourceInstance ??=
        _$TransactionCategoryLocalDataSource(database, changeListener);
  }
}

class _$ExpenseLocalDataSource extends ExpenseLocalDataSource {
  _$ExpenseLocalDataSource(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _expenseInsertionAdapter = InsertionAdapter(
            database,
            'Expense',
            (Expense item) => <String, dynamic>{
                  'id': item.id,
                  'description': item.description,
                  'value': item.value,
                  'date': item.date,
                  'categorie': item.categorie,
                  'observation': item.observation
                }),
        _expenseUpdateAdapter = UpdateAdapter(
            database,
            'Expense',
            ['id'],
            (Expense item) => <String, dynamic>{
                  'id': item.id,
                  'description': item.description,
                  'value': item.value,
                  'date': item.date,
                  'categorie': item.categorie,
                  'observation': item.observation
                }),
        _expenseDeletionAdapter = DeletionAdapter(
            database,
            'Expense',
            ['id'],
            (Expense item) => <String, dynamic>{
                  'id': item.id,
                  'description': item.description,
                  'value': item.value,
                  'date': item.date,
                  'categorie': item.categorie,
                  'observation': item.observation
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _expenseMapper = (Map<String, dynamic> row) => Expense(
      id: row['id'] as int,
      description: row['description'] as String,
      value: row['value'] as double,
      date: row['date'] as String,
      categorie: row['categorie'] as String,
      observation: row['observation'] as String);

  final InsertionAdapter<Expense> _expenseInsertionAdapter;

  final UpdateAdapter<Expense> _expenseUpdateAdapter;

  final DeletionAdapter<Expense> _expenseDeletionAdapter;

  @override
  Future<List<Expense>> findAll() async {
    return _queryAdapter.queryList('SELECT * FROM Expense ORDER BY id DESC',
        mapper: _expenseMapper);
  }

  @override
  Future<Expense> findById(int id) async {
    return _queryAdapter.query('SELECT * FROM Expense WHERE id = ?',
        arguments: <dynamic>[id], mapper: _expenseMapper);
  }

  @override
  Future<int> insertExpense(Expense expense) {
    return _expenseInsertionAdapter.insertAndReturnId(
        expense, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateExpense(Expense expense) {
    return _expenseUpdateAdapter.updateAndReturnChangedRows(
        expense, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteExpense(Expense expense) {
    return _expenseDeletionAdapter.deleteAndReturnChangedRows(expense);
  }
}

class _$RevenueLocalDataSource extends RevenueLocalDataSource {
  _$RevenueLocalDataSource(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _revenueInsertionAdapter = InsertionAdapter(
            database,
            'Revenue',
            (Revenue item) => <String, dynamic>{
                  'id': item.id,
                  'description': item.description,
                  'value': item.value,
                  'date': item.date,
                  'categorie': item.categorie,
                  'observation': item.observation
                }),
        _revenueUpdateAdapter = UpdateAdapter(
            database,
            'Revenue',
            ['id'],
            (Revenue item) => <String, dynamic>{
                  'id': item.id,
                  'description': item.description,
                  'value': item.value,
                  'date': item.date,
                  'categorie': item.categorie,
                  'observation': item.observation
                }),
        _revenueDeletionAdapter = DeletionAdapter(
            database,
            'Revenue',
            ['id'],
            (Revenue item) => <String, dynamic>{
                  'id': item.id,
                  'description': item.description,
                  'value': item.value,
                  'date': item.date,
                  'categorie': item.categorie,
                  'observation': item.observation
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _revenueMapper = (Map<String, dynamic> row) => Revenue(
      id: row['id'] as int,
      description: row['description'] as String,
      value: row['value'] as double,
      date: row['date'] as String,
      categorie: row['categorie'] as String,
      observation: row['observation'] as String);

  final InsertionAdapter<Revenue> _revenueInsertionAdapter;

  final UpdateAdapter<Revenue> _revenueUpdateAdapter;

  final DeletionAdapter<Revenue> _revenueDeletionAdapter;

  @override
  Future<List<Revenue>> findAll() async {
    return _queryAdapter.queryList('SELECT * FROM Revenue ORDER BY id DESC',
        mapper: _revenueMapper);
  }

  @override
  Future<Revenue> findById(int id) async {
    return _queryAdapter.query('SELECT * FROM Revenue WHERE id = ?',
        arguments: <dynamic>[id], mapper: _revenueMapper);
  }

  @override
  Future<int> insertRevenue(Revenue revenue) {
    return _revenueInsertionAdapter.insertAndReturnId(
        revenue, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateRevenue(Revenue revenue) {
    return _revenueUpdateAdapter.updateAndReturnChangedRows(
        revenue, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteRevenue(Revenue revenue) {
    return _revenueDeletionAdapter.deleteAndReturnChangedRows(revenue);
  }
}

class _$ExpenseByCategoryDataSource extends ExpenseByCategoryDataSource {
  _$ExpenseByCategoryDataSource(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _expenseByCategoryMapper = (Map<String, dynamic> row) =>
      ExpenseByCategory(
          category: row['category'] as String, value: row['value'] as double);

  @override
  Future<List<ExpenseByCategory>> getExpensesByCategory(
      String month, String year) async {
    return _queryAdapter.queryList(
        'SELECT categorie AS category, SUM(value) AS value FROM Expense WHERE strftime("%m", date) = ? and strftime("%Y", date) = ? GROUP BY categorie',
        arguments: <dynamic>[month, year],
        mapper: _expenseByCategoryMapper);
  }
}

class _$TransactionCategoryLocalDataSource
    extends TransactionCategoryLocalDataSource {
  _$TransactionCategoryLocalDataSource(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _transactionCategoryInsertionAdapter = InsertionAdapter(
            database,
            'TransactionCategory',
            (TransactionCategory item) => <String, dynamic>{
                  'id': item.id,
                  'category': item.category,
                  'transactionType': item.transactionType,
                  'icon': item.icon
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _transactionCategoryMapper = (Map<String, dynamic> row) =>
      TransactionCategory(
          id: row['id'] as int,
          category: row['category'] as String,
          transactionType: row['transactionType'] as String,
          icon: row['icon'] as String);

  final InsertionAdapter<TransactionCategory>
      _transactionCategoryInsertionAdapter;

  @override
  Future<List<TransactionCategory>> findByTransactionType(String type) async {
    return _queryAdapter.queryList(
        'SELECT * FROM TransactionCategory WHERE transactionType = ?',
        arguments: <dynamic>[type],
        mapper: _transactionCategoryMapper);
  }

  @override
  Future<List<TransactionCategory>> getAllTransactionsCategories() async {
    return _queryAdapter.queryList('SELECT * FROM TransactionCategory',
        mapper: _transactionCategoryMapper);
  }

  @override
  Future<int> insertTransactionCategory(
      TransactionCategory transactionCategory) {
    return _transactionCategoryInsertionAdapter.insertAndReturnId(
        transactionCategory, OnConflictStrategy.abort);
  }

  @override
  Future<List<int>> saveAllTransactionCategories(
      List<TransactionCategory> transactionCategories) {
    return _transactionCategoryInsertionAdapter.insertListAndReturnIds(
        transactionCategories, OnConflictStrategy.abort);
  }
}
