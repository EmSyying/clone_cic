import 'package:cicgreenloan/utils/helper/extension/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DigitFormatWithDecimal extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newTextValue = newValue.text.replaceAll(',', '.');
    double? number = double.tryParse(newTextValue);

    ///
    debugPrint("VALUE ${oldValue.text}");
    debugPrint("VALUE ${newValue.text}");
    // if (newValue.text == '.' && oldValue.text.length < newValue.text.length) {
    //   return const TextEditingValue(
    //     text: '0.',
    //     selection: TextSelection.collapsed(offset: 2),
    //   );
    // } else if (newValue.text == '0' && oldValue.text == '0') {
    //   return oldValue;
    // } else
    if (number != null) {
      return newValue.copyWith(
          text: newValue.text.replaceAll(',', '.').asInput(),
          selection:
              TextSelection.collapsed(offset: newValue.text.asInput().length));
    }
    return oldValue;
  }
}
