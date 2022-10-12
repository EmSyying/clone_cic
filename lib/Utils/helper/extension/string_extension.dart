import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension CiCAmount on String {
  static final numberFormat = NumberFormat("#,##0.00", "en_US");
  static final digitFormat = NumberFormat("#,###", "en_US");

  ///Format 1,200.00 and 1,200.50
  String toCurrencyAmount() {
    var numb = double.tryParse(replaceAll(',', ''));
    if (numb != null) {
      return numberFormat.format(numb);
    } else {
      debugPrint('here');
      return this;
    }
  }

  ///RealTime Format
  String asInput() {
    String result = '';
    var number = double.tryParse(this);

    if (number != null) {
      if (contains('.')) {
        result = '${digitFormat.format(number)}.${substring(indexOf('.') + 1)}';
        return result;
      } else {
        result = digitFormat.format(number);
        return result;
      }
    } else {
      return this;
    }
  }

  String clean() => replaceAll(RegExp(','), '');
}
