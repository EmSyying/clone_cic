import 'package:flutter/material.dart';

import '../model/keyboard_key.dart';

class CustomKeyboard extends StatefulWidget {
  final num? digit;
  final ValueChanged<String>? onChanged;
  final num? maximum;
  const CustomKeyboard({
    Key? key,
    this.digit,
    this.onChanged,
    this.maximum,
  }) : super(key: key);

  @override
  CustomKeyboardState createState() => CustomKeyboardState();
}

class CustomKeyboardState extends State<CustomKeyboard> {
  final List<List<dynamic>> keys = [
    ['1', '2', '3'],
    ['4', '5', '6'],
    ['7', '8', '9'],
    [
      '.',
      '0',
      const Icon(
        Icons.backspace,
        color: Colors.black,
      )
    ],
  ];

  String amount = '';

  _onKeyTap(val) {
    if (val == '0' && amount == '0') {
      return; //stop function
    }

    if (val == '.' && amount.contains('.')) {
      return; //stop function
    }

    if (val == '.' && (amount.isEmpty || amount == '0')) {
      amount = '0.';
      widget.onChanged?.call(amount);
      return; //stop function
    }

    if (val != '0' && amount == '0') {
      amount = val;
      widget.onChanged?.call(amount);
      return;
    }
    //1000.000
    if (amount.contains('.') &&
        amount.length - 1 - amount.indexOf('.') >= (widget.digit ?? 2)) {
      return;
    }

    final num? total = num.tryParse(amount + val);

    ///
    if (total != null) {
      if (widget.maximum == null ||
          (widget.maximum != null && total <= widget.maximum!)) {
        amount = amount + val;
        widget.onChanged?.call(amount);
        debugPrint('Total Number : $amount');
      }
    }
  }

  _onBackspacePress() {
    if (amount.isEmpty) {
      return;
    }

    amount = amount.substring(0, amount.length - 1);
    widget.onChanged?.call(amount);
  }

  List<Row> renderKeyboard() {
    return keys
        .map(
          (e) => Row(
            children: e.map(
              (y) {
                return Expanded(
                  child: KeyboardKey(
                    label: y,
                    value: y,
                    onTap: (val) {
                      debugPrint(val.toString());
                      if (val is Widget) {
                        _onBackspacePress();
                      } else {
                        _onKeyTap(val);
                      }
                    },
                  ),
                );
              },
            ).toList(),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          ...renderKeyboard(),
        ],
      ),
    );
  }
}
