import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomFovarite extends StatelessWidget {
  final bool isBoxIsScrolled;
  final VoidCallback? onPressed;
  final bool isFav;
  final Color? backgroundColor;
  final Color? iconColor;
  const CustomFovarite({
    Key? key,
    this.isBoxIsScrolled = false,
    this.onPressed,
    this.isFav = false,
    this.backgroundColor,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.black.withOpacity(0.3),
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: IconButton(
        icon: isFav
            ? SvgPicture.asset(
                'assets/images/privilege/favorite.svg',
                height: 20,
              )
            : SvgPicture.asset(
                'assets/images/privilege/heart.svg',
                height: 20,
                color: iconColor ?? Colors.white,
              ),
        onPressed: onPressed,
      ),
    );
  }
}
