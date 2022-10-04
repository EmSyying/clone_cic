import 'package:flutter/material.dart';

import '../model/keyboard_key.dart';

class CustomKeyboard extends StatefulWidget {
  ValueChanged<String>? onChanged;
  CustomKeyboard({Key? key, this.onChanged}) : super(key: key);

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
    if (val == '0' && amount.isEmpty) {
      return;
    }
    amount = amount + val;
    widget.onChanged?.call(amount);
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
          (x) => Row(
            children: x.map(
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
