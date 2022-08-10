// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';

import '../../Utils/helper/color.dart';
import '../../Utils/helper/container_partern.dart';

// ignore: must_be_immutable
class CustomTradingButton extends StatelessWidget {
  String title;
  Widget? icon;
  Color? color;
  double? height;
  final VoidCallback onTap;
  CustomTradingButton(
      {this.icon,
      this.color,
      this.height,
      required this.onTap,
      required this.title,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: FlatButton.icon(
          height: height ?? 37,
          color: color ?? AppColor.mainColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRaduis)),
          onPressed: onTap,
          icon: icon ?? Container(),
          label: Text(
            title,
            style: Theme.of(context).textTheme.button,
          )),
    );
  }
}
