import 'package:flutter/material.dart';

import '../../Utils/helper/color.dart';

class CustomCardInvestFIF extends StatelessWidget {
  final Widget? column;
  final String? titleFIF;
  final String? titleButton;
  final String? assetImage;
  final String? exploreMore;
  // final VoidCallback? onPressed;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onTapExplore;
  const CustomCardInvestFIF({
    Key? key,
    this.column,
    this.titleFIF,
    this.titleButton,
    this.assetImage,
    this.onTap,
    this.exploreMore,
    this.onTapExplore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(
          top: 20.0,
          left: 10.0,
          right: 10.0,
        ),
        height: 210.0,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(assetImage ?? ''),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(14.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                titleFIF ?? '',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: AppColor.arrowforwardColor['dark'],
                    ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              column!,
              const Spacer(),
              onTapExplore != null
                  ? GestureDetector(
                      onTap: onTapExplore,
                      child: Container(
                        width: 106,
                        height: 36,
                        padding: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          color: AppColor.arrowforwardColor['dark'],
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Center(
                          child: Text(
                            exploreMore ?? '',
                            // 'Explore More',
                            style:
                                Theme.of(context).textTheme.headline2!.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.0,
                                      color: AppColor.mainColor,
                                    ),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}
