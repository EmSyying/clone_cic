import 'package:cicgreenloan/utils/helper/extension/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DigitFormatWithDecimal extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    double? number = double.tryParse(newValue.text);
    if (number != null) {
      debugPrint('NewValue = ${newValue.text}');
      debugPrint('NewValue Clean = ${newValue.text.clean()}');
      return newValue.copyWith(
          text: newValue.text.replaceAll(',', '.').asInput(),
          selection:
              TextSelection.collapsed(offset: newValue.text.asInput().length));
    } else if (newValue.text.isEmpty) {
      return const TextEditingValue();
    } else {
      debugPrint('Old');
      return oldValue;
    }
  }
}
