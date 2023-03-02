import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PiointEmptyState extends StatelessWidget {
  final String? title, description;
  const PiointEmptyState({super.key, this.title, this.description});

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headlineMedium!;
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/emptypoint.svg',
          ),
          Text(
            '$title',
            style:
                textStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          Text(
            '$description',
            style:
                textStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
