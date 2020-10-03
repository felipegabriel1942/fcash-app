import 'package:fcash_app/controllers/expenses/expenses_controller.dart';
import 'package:fcash_app/utils/app_format_utils.dart';
import 'package:fcash_app/utils/app_routes.dart';
import 'package:fcash_app/views/expenses/widgets/expense_list_item.dart';
import 'package:fcash_app/widgets/app_drawer.dart';
import 'package:fcash_app/widgets/custom_month_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ExpensesScreen extends StatefulWidget {
  @override
  _ExpensesScreenState createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  final controller = ExpensesController();

  @override
  void initState() {
    super.initState();
    controller.loadExpenses();
  }

  @override
  Widget build(BuildContext context) {
    final _availableHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        56;

    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas'),
        backgroundColor: Colors.red[400],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MonthSelector(
              availableHeight: _availableHeight,
              controller: controller,
            ),
            TotalExpenseInformative(
              availableHeight: _availableHeight,
              controller: controller,
            ),
            ExpensesList(
              availableHeight: _availableHeight,
              controller: controller,
            )
          ],
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

class MonthSelector extends StatelessWidget {
  const MonthSelector({
    Key key,
    @required double availableHeight,
    @required this.controller,
  })  : _availableHeight = availableHeight,
        super(key: key);

  final double _availableHeight;
  final ExpensesController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red[400],
      ),
      height: _availableHeight * 0.08,
      child: Observer(
        builder: (_) {
          return CustomMonthPicker(
            onDecrease: controller.isBusy ? null : controller.decreaseMonth,
            onIncrease: controller.isBusy ? null : controller.increaseMonth,
            selectedMonth: controller.selectedMonth,
          );
        },
      ),
    );
  }
}

class TotalExpenseInformative extends StatelessWidget {
  const TotalExpenseInformative({
    Key key,
    @required double availableHeight,
    @required this.controller,
  })  : _availableHeight = availableHeight,
        super(key: key);

  final double _availableHeight;
  final ExpensesController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _availableHeight * 0.14,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Icon(
                    Icons.account_balance_wallet,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  'Total',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Observer(
                builder: (_) {
                  return controller.isBusy
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Text(
                          AppFormatUtils.toCurrencyString(
                            value: controller.totalValue,
                          ),
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[700],
                          ),
                        );
                },
              ),
            ),
          ],
        ),
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
          height: _availableHeight * 0.78,
          padding: const EdgeInsets.only(
            bottom: 45,
            top: 10,
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

class EmptyListImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Nenhuma despesa encontrada!',
          style: TextStyle(
            fontSize: 20,
            color: Colors.grey[500],
          ),
        ),
        Image.asset('assets/images/empty-list.png')
      ],
    );
  }
}
