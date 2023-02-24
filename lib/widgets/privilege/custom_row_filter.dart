import 'package:cicgreenloan/widgets/privilege/privilege_point/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Utils/helper/color.dart';

class CustomNumberStoresFilter extends StatelessWidget {
  final String? titleStores;
  final int? initialIndex;
  final GestureTapCallback? onTapFilter;
  final GestureTapCallback? onTapSearch;
  final Function(String)? onSelected;

  const CustomNumberStoresFilter({
    Key? key,
    this.titleStores,
    this.onTapFilter,
    this.onTapSearch,
    this.onSelected, this.initialIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   debugPrint("initialIndex$initialIndex");
    return Row(
      children: [
        // Container(
        //   color: Colors.transparent,
        //   child: Text(
        //     titleStores ?? '',
        //     style: Theme.of(context).textTheme.titleMedium!.copyWith(
        //           fontWeight: FontWeight.w500,
        //           color: AppColor.chartLabelColor,
        //         ),
        //   ),
        // ),
        CustomDropDownbutton(
          initialIndex: initialIndex,
          onSelected: onSelected,
        ),
        const Spacer(),
        GestureDetector(
          onTap: onTapSearch,
          child: Container(
            decoration: BoxDecoration(
                color: AppColor.lightblue.withOpacity(0.06),
                borderRadius: BorderRadius.circular(8.0)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/privilege/search.svg',
                    color: Theme.of(context).primaryColor,
                    width: 18.0,
                    height: 18.0,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Search',
                    style: Theme.of(context).textTheme.displaySmall,
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
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
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        fontWeight: FontWeight.w600,
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
