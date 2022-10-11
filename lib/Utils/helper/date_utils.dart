import 'package:cicgreenloan/utils/function/format_date_time.dart';

extension DateUtilsMaturity on DateTime {
  String asDate() => FormatDate.investmentDateDisplay(toString());

  ///Get total day of Month
  static int getDayofMonth(DateTime date) {
    int dayOfmonth = date.month;
    int currentYear = date.year;

    if (dayOfmonth == 1 ||
        dayOfmonth == 3 ||
        dayOfmonth == 5 ||
        dayOfmonth == 7 ||
        dayOfmonth == 8 ||
        dayOfmonth == 10 ||
        dayOfmonth == 12) {
      return 31;
    } else if (dayOfmonth == 2 && (currentYear % 4) == 0) {
      return 29;
    } else if (dayOfmonth == 2 && (currentYear % 4) != 0) {
      return 28;
    } else {
      return 30;
    }
  }

  //Get the next date
  static getNextMonth({required DateTime startDate, required int addMonths}) {
    DateTime? nextDate;
    int nextYear, nextMonth, nextDay, totalDayNextMonth;

    if (addMonths == 0) {
      return startDate;
    } else if (addMonths > 0) {
      nextYear = startDate.month + addMonths > 12
          ? startDate.year + (startDate.month + addMonths) ~/ 12
          : startDate.year;

      nextMonth = startDate.month + addMonths > 12
          ? (startDate.month + addMonths) % 12
          : startDate.month + addMonths;

      totalDayNextMonth = getDayofMonth(DateTime(nextYear, nextMonth - 1));

      nextDay =
          startDate.day < totalDayNextMonth ? startDate.day : totalDayNextMonth;

      nextDate = DateTime(nextYear, nextMonth - 1, nextDay);

      return nextDate;
    } else {
      return 'Nagative value is not allowed';
    }
  }
}
