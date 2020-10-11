import 'package:fcash_app/controllers/revenues/revenues_controller.dart';
import 'package:fcash_app/utils/app_format_utils.dart';
import 'package:fcash_app/utils/app_routes.dart';
import 'package:fcash_app/views/revenues/widgets/revenue_list_item.dart';
import 'package:fcash_app/widgets/app_drawer.dart';
import 'package:fcash_app/widgets/custom_month_picker.dart';
import 'package:fcash_app/widgets/empty_list_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class RevenuesScreen extends StatefulWidget {
  @override
  _RevenuesScreenState createState() => _RevenuesScreenState();
}

class _RevenuesScreenState extends State<RevenuesScreen> {
  final controller = GetIt.I<RevenuesController>();

  @override
  void initState() {
    super.initState();
    if (controller.revenuesList.isEmpty) {
      controller.loadRevenues();
    }
  }

  @override
  Widget build(BuildContext context) {
    final _availableHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        56;

    final _availableWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: AppDrawer(),
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
                    'Receitas',
                    style: TextStyle(fontSize: 17),
                  ),
                  Observer(
                    builder: (_) {
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
                    },
                  )
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
        backgroundColor: Colors.green
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              RevenuesList(
                availableHeight: _availableHeight,
                controller: controller,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
        backgroundColor: Colors.amber[600],
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.REVENUES_FORM);
        },
      ),
    );
  }
}

class RevenuesList extends StatelessWidget {
  const RevenuesList({
    Key key,
    @required double availableHeight,
    @required this.controller,
  })  : _availableHeight = availableHeight,
        super(key: key);

  final double _availableHeight;
  final RevenuesController controller;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Container(
          height: _availableHeight * 0.92,
          padding: const EdgeInsets.only(
            top: 15,
            bottom: 45,
          ),
          child: controller.isBusy
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : controller.revenuesList.length == 0
                  ? EmptyListImage()
                  : ListView.builder(
                      itemCount: controller.revenuesList.length,
                      itemBuilder: (_, index) => Column(
                        children: [
                          RevenueListItem(
                            revenue: controller.revenuesList[index],
                            onPressDelete: () {
                              controller.deleteRevenue(index);
                            },
                            onPressEdit: () {
                              Navigator.of(context).pushNamed(
                                AppRoutes.REVENUES_FORM,
                                arguments: controller.revenuesList[index],
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
