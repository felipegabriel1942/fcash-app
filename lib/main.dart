import 'package:fcash_app/controllers/expenses/expenses_controller.dart';
import 'package:fcash_app/controllers/revenues/revenues_controller.dart';
import 'package:fcash_app/controllers/widgets/app_drawer_controller.dart';
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
  GetIt getIt = GetIt.I;
  getIt.registerSingleton<AppDatabase>(await $FloorAppDatabase.databaseBuilder('fcash_database.db').build());
  getIt.registerSingleton<ExpensesController>(ExpensesController());
  getIt.registerSingleton<RevenuesController>(RevenuesController());
  getIt.registerSingleton<AppDrawerController>(AppDrawerController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              bodyText1: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 14,
               fontWeight: FontWeight.w500,
              ),
              bodyText2: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
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
