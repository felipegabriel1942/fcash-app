import 'package:fcash_app/data/database/app_database.dart';
import 'package:fcash_app/data/models/expense.dart';
import 'package:fcash_app/data/repositories/expense_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

void main() {
  ExpensesRepository repository;
  GetIt getIt = GetIt.I;

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();

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
    await repository.insertExpense(Expense());

    List<Expense> lista = await repository.findAll();

    expect(lista.length, 1);
  });

  
  test('Should update a expense', () async {
    await repository.insertExpense(Expense());

    List<Expense> lista = await repository.findAll();

    await repository.deleteExpense(lista.elementAt(0));

    lista = await repository.findAll();

    expect(lista.length, 0);
  });

  // test('Should delete a expense', () async {
  //   await repository.insertExpense(expense);

  //   List<Expense> lista = await repository.findAll();

  //   await repository.deleteExpense(expense);

  //   lista = await repository.findAll();

  //   expect(lista.length, 0);
  // });
}
