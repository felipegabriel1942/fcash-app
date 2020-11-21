import 'package:flutter/material.dart';

class CustomMonthPicker extends StatelessWidget {
  final Function onIncrease;
  final Function onDecrease;
  final DateTime selectedMonth;
  final bool abbreviateDate;

  CustomMonthPicker({
    @required this.onIncrease,
    @required this.onDecrease,
    @required this.selectedMonth,
    @required this.abbreviateDate
  });

  _buildMonthLabel(DateTime date) {

    if (date.month == 1) {
      return '${abbreviateDate ? 'Jan' : 'Janeiro'}/${date.year}';
    }

    if (date.month == 2) {
      return '${abbreviateDate ? 'Fev' : 'Fevereiro'}/${date.year}';
    }

    if (date.month == 3) {
      return '${abbreviateDate ? 'Mar' : 'Março'}/${date.year}';
    }

    if (date.month == 4) {
      return '${abbreviateDate ? 'Abr' : 'Abril'}/${date.year}';
    }

    if (date.month == 5) {
      return '${abbreviateDate ? 'Mai' : 'Maio'}/${date.year}';
    }

    if (date.month == 6) {
      return '${abbreviateDate ? 'Jun' : 'Junho'}/${date.year}';
    }

    if (date.month == 7) {
      return '${abbreviateDate ? 'Jul' : 'Julho'}/${date.year}';
    }

    if (date.month == 8) {
      return '${abbreviateDate ? 'Ago' : 'Agosto'}/${date.year}';
    }

    if (date.month == 9) {
      return '${abbreviateDate ? 'Set' : 'Setembro'}/${date.year}';
    }

    if (date.month == 10) {
      return '${abbreviateDate ? 'Out' : 'Outubro'}/${date.year}';
    }

    if (date.month == 11) {
      return '${abbreviateDate ? 'Nov' : 'Novembro'}/${date.year}';
    }

    if (date.month == 12) {
      return '${abbreviateDate ? 'Dez' : 'Dezembro'}/${date.year}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: IconButton(
              icon: Icon(Icons.keyboard_arrow_left),
              iconSize: 34,
              color: Colors.white,
              onPressed: onDecrease,
            ),
          ),
          Container(
            child: Text(
              _buildMonthLabel(selectedMonth),
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Container(
            child: IconButton(
              icon: Icon(Icons.keyboard_arrow_right),
              iconSize: 34,
              color: Colors.white,
              onPressed: onIncrease,
            ),
          )
        ],
      ),
    );
  }
}
