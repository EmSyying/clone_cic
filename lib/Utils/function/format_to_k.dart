import 'package:intl/intl.dart';

class FormatToK {
  static String convertNumber(num? number) {
    String formatNumber =
        NumberFormat.compactCurrency(decimalDigits: 2, symbol: '')
            .format(number);
    if (formatNumber == "0.00") {
      formatNumber = '0';
      return formatNumber;
    }
    return formatNumber;
  }

  static String digitNumber(num? dnumber) {
    String digitNum = NumberFormat.currency(name: '').format(dnumber ?? 0);
    return digitNum;
  }
}
