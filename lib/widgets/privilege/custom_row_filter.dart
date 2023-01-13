import 'package:cicgreenloan/widgets/privilege/privilege_point/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Utils/helper/color.dart';

class CustomNumberStoresFilter extends StatelessWidget {
  final String? titleStores;
  final GestureTapCallback? onTapFilter;
  final GestureTapCallback? onTapSearch;
  const CustomNumberStoresFilter({
    Key? key,
    this.titleStores,
    this.onTapFilter,
    this.onTapSearch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Container(
        //   color: Colors.transparent,
        //   child: Text(
        //     titleStores ?? '',
        //     style: Theme.of(context).textTheme.subtitle1!.copyWith(
        //           fontWeight: FontWeight.w500,
        //           color: AppColor.chartLabelColor,
        //         ),
        //   ),
        // ),
        const CustomDropDownButton(),
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
                  color: Theme.of(context).primaryColor,
                ),
                Text(
                  'Filter',
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: onTapSearch,
          child: Container(
            decoration: BoxDecoration(
              color: AppColor.lightblue.withOpacity(0.06),
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                'assets/images/privilege/search.svg',
                color: Theme.of(context).primaryColor,
                width: 18.0,
                height: 18.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
