import 'package:fcash_app/controllers/expenses/expenses_controller.dart';
import 'package:fcash_app/controllers/revenues/revenues_controller.dart';
import 'package:fcash_app/data/database/app_database.dart';
import 'package:fcash_app/utils/app_routes.dart';
import 'package:fcash_app/views/expenses/expenses_form_screen.dart';
import 'package:fcash_app/views/expenses/expenses_screen.dart';
import 'package:fcash_app/views/home/home_screen.dart';
import 'package:fcash_app/views/revenues/revenues_from_screen.dart';
import 'package:fcash_app/views/revenues/revenues_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppDatabase db = await $FloorAppDatabase.databaseBuilder('fcash_database.db').build();
  GetIt.instance.registerSingleton<AppDatabase>(db);
  GetIt.instance.registerSingleton<ExpensesController>(ExpensesController());
  GetIt.instance.registerSingleton<RevenuesController>(RevenuesController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        AppRoutes.HOME: (ctx) => HomeScreen(),
        AppRoutes.EXPENSES: (ctx) => ExpensesScreen(),
        AppRoutes.EXPENSES_FORM: (ctx) => ExpensesFormScreen(),
        AppRoutes.REVENUES: (ctx) => RevenuesScreen(),
        AppRoutes.REVENUES_FORM: (ctx) => RevenuesFormScreen()
      },
    );
  }
}
