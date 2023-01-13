import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Utils/helper/color.dart';

class CustomCardPoint extends StatelessWidget {
  final String? point;
  final GestureDoubleTapCallback? onTap;

  const CustomCardPoint({Key? key, this.point, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        color: AppColor.arrowforwardColor['dark'],
        border: Border.all(
          width: 0.6,
          color: AppColor.paymentBackgroundColor,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(50),
            blurRadius: 6,
            offset: const Offset(0, 1),
          )
        ],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/images/point.svg"),
                const SizedBox(
                  width: 14,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'MVP Balance',
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff464646),
                            fontSize: 12,
                          ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      point ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: Theme.of(context).textTheme.headline2!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const VerticalDivider(
            width: 0,
            thickness: 1,
          ),
          Expanded(
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                height: double.infinity,
                color: Colors.transparent,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Redeem MVP',
                      style: Theme.of(context).textTheme.headline2!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Theme.of(context).primaryColor,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
