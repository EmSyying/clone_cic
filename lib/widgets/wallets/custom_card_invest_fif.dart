import 'package:flutter/material.dart';

import '../../Utils/form_builder/custom_button.dart';
import '../../Utils/helper/color.dart';

class CustomCardInvestFIF extends StatelessWidget {
  final Widget? column;
  final String? titleFIF;
  final String? titleButton;
  final String? assetImage;
  final VoidCallback? onPressed;
  final GestureTapCallback? onTap;
  const CustomCardInvestFIF({
    Key? key,
    this.column,
    this.titleFIF,
    this.titleButton,
    this.assetImage,
    this.onPressed,
    this.onTap,
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
            image: AssetImage(assetImage ?? ''),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(14.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                titleFIF ?? '',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: AppColor.arrowforwardColor['dark'],
                    ),
              ),
              column!,
              CustomButton(
                title: titleButton,
                isCardInvestfif: true,
                width: 106,
                height: 36,
                style: Theme.of(context).textTheme.headline2!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.0,
                      color: AppColor.mainColor,
                    ),
                colorText: AppColor.mainColor,
                backgroundColor: AppColor.arrowforwardColor['dark'],
                isDisable: false,
                isOutline: false,
                onPressed: onPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
