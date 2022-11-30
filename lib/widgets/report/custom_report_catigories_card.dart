import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Utils/helper/color.dart';

class CustomReportCatigoriesCard extends StatelessWidget {
  final String? icons;
  final String? title;
  final String? item;
  final GestureTapCallback? onTap;
  const CustomReportCatigoriesCard(
      {Key? key, this.icons, this.title, this.item, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160,
        decoration: BoxDecoration(
          color: AppColor.arrowforwardColor['dark'],
          border: Border.all(
            width: 0.5,
            color: AppColor.dividerBackground,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha(40),
              blurRadius: 6,
              offset: const Offset(0, 1),
            )
          ],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Stack(
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 14.0, horizontal: 14.0),
              child: Text(
                title ?? '',
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: SvgPicture.asset(
                'assets/images/empty state.svg',
                color: AppColor.mainColor.withOpacity(0.1),
                height: 68,
              ),
            ),
          ],
        ),
      ),
    );
    //  GestureDetector(
    //   onTap: onTap,
    //   child: Container(
    //     padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 14.0),
    //     width: 160,
    //     decoration: BoxDecoration(
    //       color: AppColor.arrowforwardColor['dark'],
    //       border: Border.all(
    //         width: 0.6,
    //         color: AppColor.dividerBackground,
    //       ),
    //       boxShadow: [
    //         BoxShadow(
    //           color: Colors.grey.withAlpha(40),
    //           blurRadius: 6,
    //           offset: const Offset(0, 1),
    //         )
    //       ],
    //       borderRadius: BorderRadius.circular(10.0),
    //     ),
    //     child: Column(
    //       mainAxisSize: MainAxisSize.min,
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Row(
    //           children: [
    //             Container(
    //               width: 38,
    //               height: 38,
    //               decoration: BoxDecoration(
    //                 color: AppColor.mainColor.withOpacity(0.2),
    //                 shape: BoxShape.circle,
    //               ),
    //               alignment: Alignment.center,
    //               child: SvgPicture.network(
    //                 icons ?? '',
    //                 // 'assets/images/wallet/navigation_icons.svg',
    //                 fit: BoxFit.cover,
    //               ),
    //             ),
    //             const Spacer(),
    //             Text(
    //               item.toString(),
    //               style: Theme.of(context).textTheme.headline4!.copyWith(
    //                     fontWeight: FontWeight.w700,
    //                     fontSize: 22,
    //                   ),
    //             ),
    //           ],
    //         ),
    //         const Spacer(),
    //         // const SizedBox(
    //         //   height: 12.0,
    //         // ),
    //         Text(
    //           title ?? '',
    //           style: Theme.of(context).textTheme.headline4!.copyWith(
    //                 fontWeight: FontWeight.w700,
    //                 fontSize: 14,
    //                 color: AppColor.chartLabelColor,
    //                 letterSpacing: 0.2,
    //               ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
