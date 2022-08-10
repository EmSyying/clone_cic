import 'package:flutter/material.dart';

showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Container(
            width: 100.0,
            height: 100.0,
            padding: const EdgeInsets.all(30.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: const [
                BoxShadow(
                    offset: Offset(0.0, 0.0),
                    blurRadius: 6.0,
                    color: Colors.black12)
              ],
            ),
            child: const CircularProgressIndicator()),
      );
    },
  );
}
