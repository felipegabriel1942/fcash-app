import 'package:fcash_app/controllers/home/home_controller.dart';
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
  Widget build(BuildContext context) {
    final _availableHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        56;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MonthSelector(
              availableHeight: _availableHeight,
              controller: controller,
            ),
            Container(
              height: 200,
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
                        bottom: 5,
                        left: 23,
                        right: 23,
                        top: 10,
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
                    CardItem(
                      title: 'Receita',
                      value: '1500',
                      icon: Icons.add_box,
                      color: Colors.green,
                    ),
                    CardItem(
                      title: 'Despesa',
                      value: '1000',
                      icon: MdiIcons.minusBox,
                      color: Colors.red[400],
                    ),
                    CardItem(
                      title: 'Resultado',
                      value: '500',
                      icon: MdiIcons.equalBox,
                      color: Colors.blue[400],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 380,
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
                        bottom: 5,
                        left: 23,
                        right: 23,
                        top: 10,
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
                    CardItem(
                      title: 'Alimentação',
                      value: '300',
                      icon: Icons.fastfood,
                    ),
                    CardItem(
                      title: 'Educação',
                      value: '250',
                      icon: Icons.school,
                    ),
                    CardItem(
                      title: 'Lazer',
                      value: '130',
                      icon: Icons.beach_access,
                    ),
                    CardItem(
                      title: 'Moradia',
                      value: '50',
                      icon: Icons.home,
                    ),
                    CardItem(
                      title: 'Pagamentos',
                      value: '130',
                      icon: Icons.payment,
                    ),
                    CardItem(
                      title: 'Roupa',
                      value: '265',
                      icon: MdiIcons.shopping,
                    ),
                    CardItem(
                      title: 'Saúde',
                      value: '132',
                      icon: MdiIcons.medicalBag,
                    ),
                    CardItem(
                      title: 'Transporte',
                      value: '156',
                      icon: MdiIcons.car,
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
          Text('R\$ $value'),
        ],
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
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue[500],
      ),
      height: _availableHeight * 0.08,
      child: Observer(
        builder: (_) {
          return CustomMonthPicker(
            onDecrease: controller.increaseMonth,
            onIncrease: controller.decreaseMonth,
            selectedMonth: controller.selectedMonth,
          );
        },
      ),
    );
  }
}
