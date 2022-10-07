import 'package:flutter/material.dart';

showCustomDialogWalletDetail({Widget? children, BuildContext? context}) {
  return showDialog(
      barrierDismissible: false,
      context: context!,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          titlePadding:
              const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          contentPadding: const EdgeInsets.all(0),
          content: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.47,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: children),
        );
      });
}
