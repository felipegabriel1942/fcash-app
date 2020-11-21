import 'package:intl/intl.dart';

class AppFormatUtils {
  static String toCurrencyString({double value, int digits = 2}) {
    final currencyFormat = new NumberFormat.currency(
      locale: 'pt_BR',
      symbol: 'R\$',
      decimalDigits: digits
    );

    return currencyFormat.format(value);
  }
}