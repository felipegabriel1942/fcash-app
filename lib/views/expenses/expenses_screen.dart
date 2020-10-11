import 'package:fcash_app/controllers/expenses/expenses_controller.dart';
import 'package:fcash_app/utils/app_format_utils.dart';
import 'package:fcash_app/utils/app_routes.dart';
import 'package:fcash_app/views/expenses/widgets/expense_list_item.dart';
import 'package:fcash_app/widgets/app_drawer.dart';
import 'package:fcash_app/widgets/custom_month_picker.dart';
import 'package:fcash_app/widgets/empty_list_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class ExpensesScreen extends StatefulWidget {
  @override
  _ExpensesScreenState createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  final controller = GetIt.I<ExpensesController>();

  @override
  void initState() {
    super.initState();
    if (controller.expensesList.isEmpty) {
      controller.loadExpenses();
    }
  }

  @override
  Widget build(BuildContext context) {
    final _availableHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        56;

    final _availableWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              width: _availableWidth * 0.20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Despesas',
                    style: TextStyle(fontSize: 17),
                  ),
                  Observer(builder: (_) {
                    return Text(
                      AppFormatUtils.toCurrencyString(
                        value: controller.totalValue,
                      ),
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    );
                  })
                ],
              ),
            ),
            Observer(
              builder: (_) {
                return Container(
                  width: _availableWidth * 0.57,
                  child: CustomMonthPicker(
                    onDecrease:
                        controller.isBusy ? null : controller.decreaseMonth,
                    onIncrease:
                        controller.isBusy ? null : controller.increaseMonth,
                    selectedMonth: controller.selectedMonth,
                  ),
                );
              },
            )
          ],
        ),
        backgroundColor: Colors.red[400],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              ExpensesList(
                availableHeight: _availableHeight,
                controller: controller,
              )
            ],
          ),
        ),
      ),
      drawer: AppDrawer(),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
        backgroundColor: Colors.amber[600],
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.EXPENSES_FORM);
        },
      ),
    );
  }
}

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    Key key,
    @required double availableHeight,
    @required this.controller,
  })  : _availableHeight = availableHeight,
        super(key: key);

  final double _availableHeight;
  final ExpensesController controller;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Container(
          height: _availableHeight * 0.92,
          padding: const EdgeInsets.only(
            bottom: 45,
          ),
          child: controller.isBusy
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : controller.expensesList.length == 0
                  ? EmptyListImage()
                  : ListView.builder(
                      itemCount: controller.expensesList.length,
                      itemBuilder: (_, index) => Column(
                        children: [
                          ExpenseListItem(
                            expense: controller.expensesList[index],
                            onPressDelete: () {
                              controller.deleteExpense(index);
                            },
                            onPressEdit: () {
                              Navigator.of(context).pushNamed(
                                AppRoutes.EXPENSES_FORM,
                                arguments: controller.expensesList[index],
                              );
                            },
                          ),
                          Divider(),
                        ],
                      ),
                    ),
        );
      },
    );
  }
}
