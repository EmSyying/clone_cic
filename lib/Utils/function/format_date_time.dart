import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

class FormatDate {
  static String formatDateTime(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    String formatDate = DateFormat('dd-MMM-yyyy', 'en_US').format(dateTime);
    return formatDate;
  }

  static String formatDateTimeGetfunding(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    String formatDate = DateFormat('dd-MM-yyyy', 'en_US').format(dateTime);
    return formatDate;
  }

  static today() {
    var now = DateTime.now();
    var today = DateTime(now.year, now.month, now.day);
    return today;
  }

  static isAfterDateTime(endDate) {
    DateTime valEnd = endDate;
    DateTime date = DateTime.now();
    bool valDate = date.isBefore(valEnd);
    debugPrint("is Compare DateTime:$valDate");
    return valDate;
  }

  static inCreaseDateTime(increaseDate) {
    var date = DateTime(increaseDate);
    var newDate = DateTime(date.year, date.month, date.day + 1);
    debugPrint("Increate Date:$newDate");
    return newDate;
  }

  String? getFormatedDate(date) {
    var inputFormat = DateFormat('yyyy-MM-dd');
    var inputDate = inputFormat.parse(date);
    var outputFormat = DateFormat('EEEE, dd MMM yyyy');
    return outputFormat.format(inputDate);
  }

  static String? formatAccountNumber(value) {
    var bufferString = StringBuffer();
    for (int i = 0; i < value.length; i++) {
      bufferString.write(value[i]);
      var nonZeroIndexValue = i + 1;
      if (nonZeroIndexValue % 3 == 0 && nonZeroIndexValue != value.length) {
        bufferString.write(' ');
      }
    }
    return bufferString.toString();
  }

  static String? eventDateTime(date) {
    var inputFormat = DateFormat('yyyy-MM-dd');
    var inputDate = inputFormat.parse(date);
    var outputFormat = DateFormat('EEE, dd MMM yyyy');
    return outputFormat.format(inputDate);
  }

  static String? notificationDate(date) {
    var inputFormat = DateFormat('yyyy-MM-dd');
    var inputDate = inputFormat.parse(date);
    var outputFormat = DateFormat('EEE, dd yyyy');
    return outputFormat.format(inputDate);
  }

  static String investmentDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    String formatDate = DateFormat('dd-MMM-yyyy', 'en_US').format(dateTime);
    return formatDate;
  }

  static String investmentDateDisplay(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);

    String formatDate = DateFormat('dd MMM yyyy', 'en_US').format(dateTime);

    return formatDate;
  }

  static String investmentDateDisplayUTPrice(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);

    String formatDate = DateFormat('dd MMMM yyyy', 'en_US').format(dateTime);

    return formatDate;
  }

  static String displayDayOnly(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);

    String formatDate = DateFormat('EEEE', 'en_US').format(dateTime);

    return formatDate;
  }

// Display Month
  static String displayMonthOnly(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);

    String formatDate = DateFormat('MMM', 'en_US').format(dateTime);

    return formatDate;
  }

  static String investmentDateDropDown(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    String formatDate = DateFormat('dd-MM-yyyy', 'en_US').format(dateTime);
    return formatDate;
  }

  static formatDateDays(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    var date = Jiffy(DateTime(dateTime.year, dateTime.month, dateTime.day))
        .format("EEE, do MMM yyyy");
    return date;
  }

  static String? withdrawFormatDate(date) {
    // var inputFormat = DateFormat('dd-MMM-yyyy');
    // var inputDate = inputFormat.parse(date);
    var outputFormat = DateFormat('yyyy-MM-dd').format(DateTime.parse(date));

    return outputFormat;
  }
}
