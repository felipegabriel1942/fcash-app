import 'package:fcash_app/data/database/app_database.dart';
import 'package:fcash_app/data/models/expense.dart';
import 'package:fcash_app/data/repositories/expense_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

void main() {
  ExpensesRepository repository;

  GetIt getIt = GetIt.I;

  setUp(() async {
    getIt.registerSingleton<AppDatabase>(
      await $FloorAppDatabase.inMemoryDatabaseBuilder().build(),
    );
    repository = ExpensesRepository();

  });

  tearDown(() {
    GetIt.I.get<AppDatabase>().close();
    getIt.reset();
  });

  test('Should add a expense', () async {
    final id = await repository.insertExpense(Expense());
    expect(id, 1);
  });

  test('Should get expense by id', () async {
    final id = await repository.insertExpense(Expense());
    Expense expense = await repository.findById(id);
    expect(expense.id, id);

  });

  test('Should delete a expense', () async {
    final id = await repository.insertExpense(Expense());
    Expense expense = await repository.findById(id);
    final numberOfExpensesDelete = await repository.deleteExpense(expense);
    expect(numberOfExpensesDelete, 1);
  });
}
