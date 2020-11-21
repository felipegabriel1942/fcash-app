import 'package:fcash_app/controllers/expenses/expenses_controller.dart';
import 'package:fcash_app/controllers/expenses/expenses_form_controller.dart';
import 'package:fcash_app/data/database/app_database.dart';
import 'package:fcash_app/data/models/expense.dart';
import 'package:fcash_app/data/repositories/expense_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

class MockRepository extends Mock implements ExpensesRepository {}

void main() {
  ExpensesRepository repository;
  MockRepository mockRepository;
  ExpensesFormController controller;

  GetIt getIt = GetIt.I;

  setUp(() async {
    getIt.registerSingleton<AppDatabase>(
      await $FloorAppDatabase.inMemoryDatabaseBuilder().build(),
    );
    getIt.registerSingleton<ExpensesController>(ExpensesController());
    repository = ExpensesRepository();
    controller = ExpensesFormController();
    mockRepository = MockRepository();
    controller.setDescription('Teste de despesa');
    //controller.setCategorie('alimentacao');
    controller.setDate(DateTime.parse('2020-10-12'));
    controller.setExpenseValue('150');
    controller.setObservation('Uma observação');
  });

  tearDown(() {
    GetIt.I.get<AppDatabase>().close();
    getIt.reset();
  });

  test('Should add a expense', () async {
    final newExpense = Expense(
      id: 1,
      description: controller.description,
      value: double.parse(controller.expenseValue),
      date: controller.date.toIso8601String(),
      //categorie: controller.categorie,
      observation: controller.observation,
    );

    final id = await repository.insertExpense(newExpense);

    Expense savedExpense = await repository.findById(id);

    expect(savedExpense.id, newExpense.id);
    expect(savedExpense.description, newExpense.description);
    expect(savedExpense.value, newExpense.value);
    expect(savedExpense.date, newExpense.date);
    expect(savedExpense.categorie, newExpense.categorie);
    expect(savedExpense.observation, newExpense.observation);
  });

  test('Should add a expense with mockito', () async {
    /// cenario
    final expense = Expense(
      description: controller.description,
      value: double.parse(controller.expenseValue),
      date: controller.date.toIso8601String(),
      //categorie: controller.categorie,
      observation: controller.observation,
    );

    when(mockRepository.insertExpense(expense))
        .thenAnswer((_) => Future.value(1));

    final id = await mockRepository.insertExpense(expense);

    expect(id, 1);

    // /// execucao
    // final id = await repository.updateExpense(expense);

    // Expense savedExpense = await repository.findById(id);

    // // verificacao
    // expect(savedExpense.id, expense.id);
    // expect(savedExpense.description, expense.description);
    // expect(savedExpense.value, expense.value);
    // expect(savedExpense.date, expense.date);
    // expect(savedExpense.categorie, expense.categorie);
    // expect(savedExpense.observation, expense.observation);
  });

  test('Should update a expense with mockito', () async {
    /// cenario
    final id = 1;

    Expense updatingExpense = Expense(id: id);

    final updatedExpense = Expense(
      description: controller.description,
      value: double.parse(controller.expenseValue),
      date: controller.date.toIso8601String(),
      //categorie: controller.categorie,
      observation: controller.observation,
    );

    updatedExpense.id = id;

    when(mockRepository.insertExpense(updatingExpense))
        .thenAnswer((realInvocation) => Future.value(1));
    
  });
}
