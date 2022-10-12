import 'package:intl/intl.dart';

class FormatNumber {
  static final numberFormatdefual = NumberFormat('#,##0', 'en');
  static final numberFormat = NumberFormat('#,##0.00', 'en');
  static final decimalFormat = NumberFormat('00', 'en');
  static final percentage = NumberFormat('#', 'en');
  static final formatDate = DateFormat("EEEE, dd MMM yyyy");
  static final formatCode = NumberFormat('### ### ###', 'en');

  static formatNumberDefualt(num number) => numberFormatdefual.format(number);
  static formatNumber(num number) => numberFormat.format(number);
  static formDecimalNumber(num number) => decimalFormat.format(number);
  static formatPercentage(num number) => percentage.format(number);
  static formDateTime(String date) => formatDate.format(DateTime.parse(date));
  static formatCodeData(String code) => formatCode.format(code);
}
