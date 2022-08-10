import 'dart:async';

import 'package:flutter/material.dart';
import 'package:passcode_screen/passcode_screen.dart';

class CustomKeyboard extends StatefulWidget {
  const CustomKeyboard({Key? key}) : super(key: key);

  @override
  State<CustomKeyboard> createState() => _CustomKeyboardState();
}

class _CustomKeyboardState extends State<CustomKeyboard> {
  String? enteredPassword;
  final StreamController<bool> _verificationNotifier =
      StreamController<bool>.broadcast();

  onPasscodeEntered(String enteredPasscode) {
    bool isValid = '123456' == enteredPassword;
    _verificationNotifier.add(isValid);
  }

  @override
  void dispose() {
    _verificationNotifier.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PasscodeScreen(
      backgroundColor: Theme.of(context).primaryColor,
      passwordEnteredCallback: onPasscodeEntered,
      passwordDigits: 4,
      cancelButton: const Text('Cancel'),
      deleteButton: const Text('Delete'),
      title: const Text('Enter your passcode'),
      shouldTriggerVerification: _verificationNotifier.stream,
    );
  }
}
