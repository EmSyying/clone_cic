import 'package:flutter/material.dart';

customShowDialog() {
  BuildContext? context;
  return showDialog(
      context: context!,
      builder: (context) => const AlertDialog(
            title: Text('heloo'),
            content: Text('hiiii'),
            backgroundColor: Colors.red,
          ));
}
