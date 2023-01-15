import 'package:flutter/material.dart';

class PiointEmptyState extends StatelessWidget {
  final String? title, description;
  const PiointEmptyState({super.key, this.title, this.description});

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headline4!;
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 50, right: 50, top: 20),
          width: double.infinity,
          child: Image.asset(
            'assets/images/emptypoint.png',
            height: 200,
          ),
        ),
        Text(
          '$title',
          style: textStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        Text(
          '$description',
          style: textStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
