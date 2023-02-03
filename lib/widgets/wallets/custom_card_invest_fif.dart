import 'package:flutter/material.dart';

import '../../Utils/helper/color.dart';

class CustomCardInvestFIF extends StatelessWidget {
  final Widget? column;
  final String? titleFIF;
  final String? titlebutton;
  final String? assetImage;
  final String? exploreMore;
  // final VoidCallback? onPressed;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onTapExplore;
  const CustomCardInvestFIF({
    Key? key,
    this.column,
    this.titleFIF,
    this.titlebutton,
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
          left: 20.0,
          right: 20.0,
        ),
        height: 180.0,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(assetImage ?? ''),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(14.0),
        ),
        clipBehavior: Clip.antiAlias,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.2),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                titleFIF ?? '',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  shadows: [
                    Shadow(
                      offset: const Offset(0.0, 4.0),
                      blurRadius: 10.0,
                      color: Colors.white.withOpacity(0.2),
                    ),
                  ],
                  fontWeight: FontWeight.w700,
                  fontSize: 18.5,
                  color: AppColor.arrowforwardColor['dark'],
                ),
              ),
              const SizedBox(
                height: 14.0,
              ),
              column!,
              // GestureDetector(
              //   onTap: onTapExplore ?? () {},
              //   child: Container(
              //     width: 106,
              //     height: 38,
              //     padding: const EdgeInsets.all(6.0),
              //     decoration: BoxDecoration(
              //       color: AppColor.arrowforwardColor['dark'],
              //       borderRadius: BorderRadius.circular(8.0),
              //     ),
              //     child: Center(
              //       child: Text(
              //         exploreMore ?? '',
              //         style: Theme.of(context).textTheme.displayMedium!.copyWith(
              //               fontWeight: FontWeight.w600,
              //               fontSize: 12.5,
              //               color: onTapExplore != null
              //                   ? Theme.of(context).primaryColor
              //                   : Colors.grey,
              //             ),
              //       ),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
