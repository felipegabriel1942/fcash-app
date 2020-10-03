import 'package:flutter/material.dart';

class CustomMonthPicker extends StatelessWidget {
  final Function onIncrease;
  final Function onDecrease;
  final DateTime selectedMonth;

  CustomMonthPicker({
    @required this.onIncrease,
    @required this.onDecrease,
    @required this.selectedMonth,
  });

  _buildMonthLabel(DateTime date) {
    if (date.month == 1) {
      return 'Janeiro/${date.year}';
    }

    if (date.month == 2) {
      return 'Fevereiro/${date.year}';
    }

    if (date.month == 3) {
      return 'Março/${date.year}';
    }

    if (date.month == 4) {
      return 'Abril/${date.year}';
    }

    if (date.month == 5) {
      return 'Maio/${date.year}';
    }

    if (date.month == 6) {
      return 'Junho/${date.year}';
    }

    if (date.month == 7) {
      return 'Julho/${date.year}';
    }

    if (date.month == 8) {
      return 'Agosto/${date.year}';
    }

    if (date.month == 9) {
      return 'Setembro/${date.year}';
    }

    if (date.month == 10) {
      return 'Outubro/${date.year}';
    }

    if (date.month == 11) {
      return 'Novembro/${date.year}';
    }

    if (date.month == 12) {
      return 'Dezembro/${date.year}';
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
