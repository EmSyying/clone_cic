import 'package:flutter/material.dart';

import '../../Utils/helper/color.dart';

class CustomTitleCardInvestFIF extends StatelessWidget {
  final String? title;
  const CustomTitleCardInvestFIF({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Row(
        children: [
          Icon(
            Icons.play_arrow_sharp,
            size: 14,
            color: AppColor.arrowforwardColor['dark'],
          ),
          const SizedBox(
            width: 4.0,
          ),
          Text(
            title ?? '',
            style: Theme.of(context).textTheme.headline2!.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.0,
                  color: AppColor.arrowforwardColor['dark'],
                ),
          ),
        ],
      ),
    );
  }
}
