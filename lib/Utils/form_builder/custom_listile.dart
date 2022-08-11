import 'package:cicgreenloan/Utils/helper/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserListile extends StatelessWidget {
  final String? icon;
  final String? label;
  final GestureTapCallback? onTap;
  final Widget? trailing;
  final Color? labelColor;
  final Color? iconColor;
  final bool? isMainColor;
  const UserListile(
      {Key? key,
      this.icon,
      this.label,
      this.onTap,
      this.trailing,
      this.labelColor,
      this.iconColor,
      this.isMainColor = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 50,
        width: double.infinity,
        color: Theme.of(context).cardColor,
        child: Row(
          children: [
            if (icon != null)
              SvgPicture.asset(
                icon!,
                color: iconColor,
              ),
            if (icon != null)
              const SizedBox(
                width: 20,
              ),
            Text(
              label!,
              style: isMainColor == true
                  ? Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(color: AppColor.mainColor)
                  : Theme.of(context).textTheme.bodyText2,
            ),
            const Spacer(),
            if (trailing != null)
              trailing!
            else
              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
          ],
        ),
      ),
    );
  }
}