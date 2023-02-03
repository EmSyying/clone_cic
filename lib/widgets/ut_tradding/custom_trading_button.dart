// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';

import '../../Utils/helper/color.dart';
import '../../Utils/helper/container_partern.dart';

// ignore: must_be_immutable
class CustomTradingbutton extends StatelessWidget {
  String title;
  Widget? icon;
  Color? color;
  double? height;
  final VoidCallback onTap;
  CustomTradingbutton(
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
      child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            fixedSize: Size(double.infinity, height ?? 37),
            backgroundColor: color ?? Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRaduis)),
          ),
          onPressed: onTap,
          icon: icon ?? Container(),
          label: Text(
            title,
            style: Theme.of(context).textTheme.button,
          )),
    );
  }
}
