import 'package:flutter/material.dart';

class CustomResponsesInfo extends StatelessWidget {
  final String? title;
  final int? value;
  const CustomResponsesInfo({Key? key, this.title, this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
              offset: Offset(1.0, 0.0), blurRadius: 6, color: Colors.black12)
        ],
      ),
      child: Center(
        child: Column(
          children: [
            Text(
              title!,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 5),
            Text(
              value!.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
