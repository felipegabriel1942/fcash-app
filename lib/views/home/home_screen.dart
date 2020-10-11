import 'package:fcash_app/controllers/home/home_controller.dart';
import 'package:fcash_app/utils/app_format_utils.dart';
import 'package:fcash_app/widgets/app_drawer.dart';
import 'package:fcash_app/widgets/custom_month_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = HomeController();

  @override
  void initState() {
    if (controller.expensesList.isEmpty) {
      controller.loadExpenses();
    }

    if (controller.revenuesList.isEmpty) {
      controller.loadRevenues();
    }

    controller.loadExpensesByCategory();
    super.initState();
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: _availableWidth * 0.77,
              child: CustomMonthPicker(
                onDecrease: controller.decreaseMonth,
                onIncrease: controller.increaseMonth,
                selectedMonth: controller.selectedMonth,
              ),
            )
          ],
        ),
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 240,
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              width: double.infinity,
              child: Card(
                elevation: 2,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                        bottom: 10,
                        left: 23,
                        right: 23,
                        top: 15,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Resumo',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(
                      indent: 15,
                      endIndent: 15,
                    ),
                    Observer(
                      builder: (_) {
                        return CardItem(
                          title: 'Receita',
                          value: AppFormatUtils.toCurrencyString(
                            value: controller.totalRevenueValue,
                          ),
                          icon: Icons.add_box,
                          color: Colors.green,
                        );
                      },
                    ),
                    Divider(
                      indent: 15,
                      endIndent: 15,
                    ),
                    Observer(
                      builder: (_) {
                        return CardItem(
                          title: 'Despesa',
                          value: AppFormatUtils.toCurrencyString(
                            value: controller.totalExpenseValue,
                          ),
                          icon: MdiIcons.minusBox,
                          color: Colors.red[400],
                        );
                      },
                    ),
                    Divider(
                      indent: 15,
                      endIndent: 15,
                    ),
                    Observer(
                      builder: (_) {
                        return CardItem(
                          title: 'Resultado',
                          value: AppFormatUtils.toCurrencyString(
                            value: controller.totalResultValue,
                          ),
                          icon: MdiIcons.equalBox,
                          color: Colors.blue[400],
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 480,
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              width: double.infinity,
              child: Card(
                elevation: 2,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                        bottom: 10,
                        left: 23,
                        right: 23,
                        top: 15,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Despesa por categoria',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(
                      indent: 15,
                      endIndent: 15,
                    ),
                    Observer(
                      builder: (_) {
                        return CardItem(
                          title: 'Alimentação',
                          value: AppFormatUtils.toCurrencyString(
                            value: controller.alimentacaoTotalValue,
                          ),
                          icon: Icons.fastfood,
                        );
                      },
                    ),
                    Divider(
                      indent: 15,
                      endIndent: 15,
                    ),
                    Observer(
                      builder: (_) {
                        return CardItem(
                          title: 'Educação',
                          value: AppFormatUtils.toCurrencyString(
                            value: controller.educacaoTotalValue,
                          ),
                          icon: Icons.school,
                        );
                      },
                    ),
                    Divider(
                      indent: 15,
                      endIndent: 15,
                    ),
                    Observer(
                      builder: (_) {
                        return CardItem(
                          title: 'Lazer',
                          value: AppFormatUtils.toCurrencyString(
                            value: controller.lazerTotalValue,
                          ),
                          icon: Icons.beach_access,
                        );
                      },
                    ),
                    Divider(
                      indent: 15,
                      endIndent: 15,
                    ),
                    Observer(
                      builder: (_) {
                        return CardItem(
                          title: 'Moradia',
                          value: AppFormatUtils.toCurrencyString(
                            value: controller.moradiaTotalValue,
                          ),
                          icon: Icons.home,
                        );
                      },
                    ),
                    Divider(
                      indent: 15,
                      endIndent: 15,
                    ),
                    Observer(
                      builder: (_) {
                        return CardItem(
                          title: 'Pagamentos',
                          value: AppFormatUtils.toCurrencyString(
                            value: controller.pagamentosTotalValue,
                          ),
                          icon: Icons.payment,
                        );
                      },
                    ),
                    Divider(
                      indent: 15,
                      endIndent: 15,
                    ),
                    Observer(
                      builder: (_) {
                        return CardItem(
                          title: 'Roupa',
                          value: AppFormatUtils.toCurrencyString(
                            value: controller.roupaTotalValue,
                          ),
                          icon: MdiIcons.shopping,
                        );
                      },
                    ),
                    Divider(
                      indent: 15,
                      endIndent: 15,
                    ),
                    Observer(
                      builder: (_) {
                        return CardItem(
                          title: 'Saúde',
                          value: AppFormatUtils.toCurrencyString(
                            value: controller.saudeTotalValue,
                          ),
                          icon: MdiIcons.medicalBag,
                        );
                      },
                    ),
                    Divider(
                      indent: 15,
                      endIndent: 15,
                    ),
                    Observer(
                      builder: (_) {
                        return CardItem(
                          title: 'Transporte',
                          value: AppFormatUtils.toCurrencyString(
                            value: controller.transporteTotalValue,
                          ),
                          icon: MdiIcons.car,
                        );
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem({
    Key key,
    String title,
    String value,
    IconData icon,
    Color color,
  })  : this.title = title,
        this.value = value,
        this.icon = icon,
        this.color = color,
        super(key: key);

  final String title;
  final String value;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: color == null ? Colors.grey : color,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(title),
              ),
            ],
          ),
          Text(
            '$value',
            style: TextStyle(
              color: value.contains('-') ? Colors.red : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
