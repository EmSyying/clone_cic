import 'package:flutter/material.dart';

import '../../Utils/helper/color.dart';

class CustomTitleCardInvestFIF extends StatelessWidget {
  final String? title;
  const CustomTitleCardInvestFIF({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3.0),
      child: Row(
        children: [
          Icon(
            Icons.play_arrow_sharp,
            size: 14,
            color: AppColor.arrowforwardColor['dark'],
          ),
          const SizedBox(
            width: 6.0,
          ),
          Text(
            title ?? '',
            style: Theme.of(context).textTheme.headline2!.copyWith(
              shadows: [
                Shadow(
                  offset: const Offset(0.0, 4.0),
                  blurRadius: 10.0,
                  color: Colors.white.withOpacity(0.3),
                ),
              ],
              fontWeight: FontWeight.w600,
              fontSize: 12.5,
              color: AppColor.arrowforwardColor['dark'],
            ),
          ),
        ],
      ),
    );
  }
}
