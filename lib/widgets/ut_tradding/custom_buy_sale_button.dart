// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../../Utils/helper/color.dart';

// ignore: must_be_immutable
class CustomTradingButton extends StatelessWidget {
  String? title;
  Widget? icon;
  Color? color;
  final VoidCallback? onTap;
  CustomTradingButton(
      {Key? key, this.icon, this.color, this.onTap, @required this.title})
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
          label: Text(
            title!,
            style: Theme.of(context).textTheme.button,
          )),
    );
  }
}
