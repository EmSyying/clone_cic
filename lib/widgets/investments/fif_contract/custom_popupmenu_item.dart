import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomPopUpMenu extends StatelessWidget {
  final String? imagePath;
  final String? title;
  final Color? textColor;
  final GestureTapCallback? onTap;
  const CustomPopUpMenu({
    Key? key,
    this.imagePath,
    this.title,
    this.onTap,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        color: Colors.transparent,
        child: Column(
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  imagePath ?? "",
                  width: 20,
                ),
                const SizedBox(width: 20),
                Text(
                  title ?? "",
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: textColor ?? Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
