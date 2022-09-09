// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Utils/helper/color.dart';

// ignore: must_be_immutable
class CustomTradingButton extends StatelessWidget {
  String? title;
  Widget? icon;
  Color? color;
  final bool? isBuying;
  final VoidCallback? onTap;
  CustomTradingButton(
      {Key? key,
      this.icon,
      this.color,
      this.onTap,
      @required this.title,
      this.isBuying = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 37,
      width: MediaQuery.of(context).size.width,
      child: FlatButton.icon(
          color: color ?? AppColor.mainColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          onPressed: onTap,
          icon: icon ?? Container(),
          label: Row(
            children: [
              SvgPicture.asset(
                isBuying == true
                    ? "assets/images/svgfile/ut-buy-in.svg"
                    : "assets/images/svgfile/ut-sell-out.svg",
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  title!,
                  style: Theme.of(context).textTheme.button!.copyWith(
                      color: isBuying == true
                          ? const Color(0XFF4FA30F)
                          : const Color(0XFFF54E5E)),
                ),
              ),
            ],
          )),
    );
  }
}
