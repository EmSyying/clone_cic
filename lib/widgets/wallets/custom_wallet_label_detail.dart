import 'package:flutter/material.dart';

class CustomWalletDetail extends StatelessWidget {
  final String? label;
  final String? value;
  const CustomWalletDetail({Key? key, this.label, this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "$label",
              style: Theme.of(context).textTheme.headline2!.copyWith(
                  fontSize: 12,
                  color: const Color(0XFF464646),
                  fontWeight: FontWeight.w400),
            ),
            const Spacer(),
            Text(
              "$value".toUpperCase(),
              style: Theme.of(context).textTheme.headline2!.copyWith(
                  fontSize: 12,
                  color: value!.toUpperCase() == "UNPAID"
                      ? Colors.red
                      : value!.toUpperCase() == "PAID"
                          ? Colors.green
                          : const Color(0XFF0A0B09),
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
        const SizedBox(height: 10.0)
      ],
    );
  }
}
