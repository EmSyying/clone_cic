import 'package:flutter/material.dart';

class CustomDepostheaderDetail extends StatelessWidget {
  const CustomDepostheaderDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "",
              style: Theme.of(context).textTheme.headline2!.copyWith(
                  fontSize: 12,
                  color: const Color(0XFF464646),
                  fontWeight: FontWeight.w400),
            ),
            const Spacer(),
            Text(
              "",
              style: Theme.of(context).textTheme.headline2!.copyWith(
                  fontSize: 12,
                  color: const Color(0XFF0A0B09),
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
        const SizedBox(height: 10.0)
      ],
    );
  }
}
