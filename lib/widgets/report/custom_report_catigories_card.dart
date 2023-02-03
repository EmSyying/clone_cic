import 'package:flutter/material.dart';

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
        height: 86,
        decoration: BoxDecoration(
          color: AppColor.arrowforwardColor['dark'],
          border: Border.all(
            width: 0.6,
            color: AppColor.dividerBackground,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha(40),
              blurRadius: 6,
              offset: const Offset(0, 1),
            )
          ],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Stack(
          //mainAxisSize: MainAxisSize.min,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Positioned(
              bottom: 0,
              right: 0,
              child: SizedBox(
                width: 85,
                height: 48,
                child: Image.network(
                  icons ?? '',
                  // 'assets/images/wallet/navigation_icons.svg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned.fill(
                child: Container(
              padding: const EdgeInsets.only(
                  left: 14, right: 14, top: 14, bottom: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    '${item.toString()} Document',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColor.chartLabelColor,
                          fontSize: 12.0,
                        ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
