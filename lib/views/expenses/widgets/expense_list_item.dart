import 'package:fcash_app/data/models/expense.dart';
import 'package:fcash_app/utils/app_format_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseListItem extends StatelessWidget {
  final Expense expense;
  final Function onPressDelete;
  final Function onPressEdit;

  ExpenseListItem({
    this.expense,
    this.onPressDelete,
    this.onPressEdit,
  });

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
            child: Icon(
              Icons.fastfood,
              color: Colors.white,
            ),
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
          Text('R\$ ${AppFormatUtils.toCurrencyString(
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
