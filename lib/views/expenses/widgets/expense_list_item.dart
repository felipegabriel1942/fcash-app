import 'package:fcash_app/data/models/expense.dart';
import 'package:fcash_app/utils/app_format_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ExpenseListItem extends StatelessWidget {
  final Expense expense;
  final Function onPressDelete;
  final Function onPressEdit;

  ExpenseListItem({
    this.expense,
    this.onPressDelete,
    this.onPressEdit,
  });

  Icon _setIcon() {
    if (expense.categorie.contains('alimentacao')) {
      return Icon(
        Icons.fastfood,
        color: Colors.white,
      );
    }

    if (expense.categorie.contains('educacao')) {
      return Icon(
        Icons.school,
        color: Colors.white,
      );
    }

    if (expense.categorie.contains('lazer')) {
      return Icon(
        Icons.beach_access,
        color: Colors.white,
      );
    }

    if (expense.categorie.contains('moradia')) {
      return Icon(
        Icons.home,
        color: Colors.white,
      );
    }

    if (expense.categorie.contains('pagamentos')) {
      return Icon(
        Icons.payment,
        color: Colors.white,
      );
    }

    if (expense.categorie.contains('roupa')) {
      return Icon(
        MdiIcons.shopping,
        color: Colors.white,
      );
    }

    if (expense.categorie.contains('saude')) {
      return Icon(
        MdiIcons.medicalBag,
        color: Colors.white,
      );
    }

    if (expense.categorie.contains('transporte')) {
      return Icon(
        MdiIcons.car,
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
        backgroundColor: Colors.red[400],
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
            value: expense.value,
          )}'),
          Text(
            '${expense.description}',
            style: TextStyle(color: Colors.black54),
          )
        ],
      ),
      subtitle: Text(
        '${DateFormat('dd/MM/yyyy').format(DateTime.parse(expense.date))}',
      ),
    );
  }
}
