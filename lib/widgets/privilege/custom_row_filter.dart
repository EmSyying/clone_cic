import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Utils/helper/color.dart';

class CustomNumberStoresFilter extends StatelessWidget {
  final String? titleStores;
  final GestureTapCallback? onTapFilter;
  const CustomNumberStoresFilter({
    Key? key,
    this.titleStores,
    this.onTapFilter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          color: Colors.transparent,
          child: Text(
            titleStores ?? '',
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColor.chartLabelColor,
                ),
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: onTapFilter,
          child: Container(
            decoration: BoxDecoration(
                color: AppColor.lightblue.withOpacity(0.06),
                borderRadius: BorderRadius.circular(8.0)),
            width: 87,
            height: 34,
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 7.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SvgPicture.asset(
                  'assets/images/privilege/filter_icon.svg',
                  color: AppColor.mainColor,
                ),
                Text(
                  'Filter',
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
