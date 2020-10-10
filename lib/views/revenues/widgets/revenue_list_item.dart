import 'package:fcash_app/data/models/revenue.dart';
import 'package:fcash_app/utils/app_format_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RevenueListItem extends StatelessWidget {
  final Revenue revenue;
  final Function onPressDelete;
  final Function onPressEdit;

  RevenueListItem({
    this.revenue,
    this.onPressDelete,
    this.onPressEdit,
  });

  Icon _setIcon() {
    if (revenue.categorie.contains('investimentos')) {
      return Icon(
        Icons.show_chart,
        color: Colors.white,
      );
    }

    if (revenue.categorie.contains('salario')) {
      return Icon(
        Icons.monetization_on,
        color: Colors.white,
      );
    }

    if (revenue.categorie.contains('premio')) {
      return Icon(
        Icons.stars,
        color: Colors.white,
      );
    }

    if (revenue.categorie.contains('presente')) {
      return Icon(
        Icons.card_giftcard,
        color: Colors.white,
      );
    }

    return Icon(
      Icons.sentiment_dissatisfied,
      color: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.green,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: FittedBox(
            child: _setIcon(),
          ),
        ),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
                icon: Icon(
                  Icons.edit,
                  color: Colors.blue,
                ),
                onPressed: onPressEdit),
            IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: onPressDelete,
            ),
          ],
        ),
      ),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${AppFormatUtils.toCurrencyString(
            value: revenue.value,
          )}'),
          Text(
            '${revenue.description}',
            style: TextStyle(color: Colors.black54),
          )
        ],
      ),
      subtitle: Text(
        '${DateFormat('dd/MM/yyyy').format(DateTime.parse(revenue.date))}',
      ),
    );
  }
}
