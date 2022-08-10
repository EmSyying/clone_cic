import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../modules/bonus/controllers/bonus_controller.dart';
import '../../utils/helper/color.dart';

class CustomHeaderBottomStyle extends StatelessWidget {
  const CustomHeaderBottomStyle(
      {Key? key, this.type, this.label, this.time, this.amount})
      : super(key: key);
  final String? type;
  final String? label;
  final String? time;
  final num? amount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10),
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: type == 'bonus' || type == 'cash-in'
                  ? AppColor.statusColor['green']!.withOpacity(0.2)
                  : AppColor.statusColor['late']!.withOpacity(0.2)),
          child: Center(
              child: type == 'bonus' || type == 'cash-in'
                  ? SvgPicture.asset(
                      'assets/images/svgfile/dividend.svg',
                    )
                  : type == 'cash-out'
                      ? SvgPicture.asset(
                          'assets/images/svgfile/cashout1.svg',
                        )
                      : type == 'inves-fif'
                          ? SvgPicture.asset(
                              'assets/images/svgfile/investfif.svg',
                              color: AppColor.statusColor['late'],
                            )
                          : SvgPicture.asset(
                              'assets/images/svgfile/subscribe_card.svg')),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  label ?? "",
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        time ?? "",
                        style: Theme.of(context)
                            .textTheme
                            .headline2!
                            .copyWith(fontSize: 12, color: Colors.grey),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Text(
                        "${FormatToK.digitNumber(amount ?? 0)} USD",
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                            color: type == 'bonus' || type == 'cash-in'
                                ? AppColor.statusColor['green']
                                : AppColor.statusColor['late'],
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
