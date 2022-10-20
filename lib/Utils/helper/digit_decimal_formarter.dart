import 'package:flutter/services.dart';

class DigitFormatWithDecimal extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text.replaceAll(',', '.');
    // double? number = double.tryParse(newText);
    int count = newText.length - newText.replaceAll(".", "").length;

    if (oldValue.text.contains('.') && count > 1) {
      return oldValue;
    } else {
      return newValue.copyWith(text: newText);
    }

    // bool endWithdottComma =
    //     newValue.text.endsWith('.') || newValue.text.endsWith(',');

    ///no dupplicate ..when typing .,
    // if (oldValue.text.contains('.') &&
    //     endWithdottComma &&
    //     newValue.text.length > oldValue.text.length) {
    //   debugPrint('Success 1');
    //   return oldValue;
    // } else {}

    ///No dupplicate 0
    // if (oldValue.text == '0' && newValue.text.endsWith('0')) {
    //   debugPrint('Success No dupplicate 0');
    //   return oldValue;
    // }

    ///if user enter , or . turn into 0.
    // if ((newValue.text == '.' || newValue.text == ',') &&
    //     oldValue.text.isEmpty) {
    //   debugPrint('Success 2');
    //   return oldValue.copyWith(
    //     text: '0.',
    //     selection: const TextSelection.collapsed(offset: 2),
    //   );
    // }

    //for inputing only (ignore when backspace)
    // if (newValue.text.length > oldValue.text.length) {
    //   //if oldValue.text.isNotEmpty and newValue.text.endsWith . or , turn to oldValue + '.'
    //   if (oldValue.text.isNotEmpty && endWithdottComma) {
    //     debugPrint('Success 3');
    //     return newValue.copyWith(text: '${oldValue.text}.');
    //   }

    //   //if newValue end with . and oldValue,isNotEmpty
    //   if (oldValue.text.isNotEmpty &&
    //       (newValue.text.endsWith('.') || newValue.text.endsWith(','))) {
    //     debugPrint('Success 4');
    //     return oldValue.copyWith(
    //         text: '${oldValue.text}.', selection: newValue.selection);
    //   }
    // }

    // if (number != null) {
    //   return newValue.copyWith(
    //       text: newValue.text,
    //       selection: TextSelection.collapsed(offset: newValue.text.length));
    // } else if (newValue.text.isEmpty) {
    //   return const TextEditingValue();
    // } else {
    //   debugPrint('Old');
    //   return oldValue;
    // }
  }
}
