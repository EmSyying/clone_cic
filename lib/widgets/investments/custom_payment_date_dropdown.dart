import 'package:flutter/material.dart';

class CustomPaymentDate extends StatelessWidget {
  final String? title;
  final String? date;
  const CustomPaymentDate({Key? key, this.date, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text('$title'), const SizedBox(height: 20), Text('$date')],
    );
  }
}
