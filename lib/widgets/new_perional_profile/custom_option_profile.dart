import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomOptionProfile extends StatelessWidget {
  final String? title;
  final String? imageSvg;
  final GestureTapCallback? onPress;
  final String? disableIcon;
  const CustomOptionProfile(
      {Key? key, this.title, this.imageSvg, this.onPress, this.disableIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: disableIcon != '' && disableIcon != null
              ? () {
                  onPress!();
                }
              : null,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: disableIcon != '' && disableIcon != null
                  ? Theme.of(context).primaryColor.withOpacity(0.1)
                  : Colors.grey[200],
            ),
            child: Center(
              child: SvgPicture.asset(
                '$imageSvg',
                fit: BoxFit.cover,
                color: disableIcon != '' && disableIcon != null
                    ? Theme.of(context).primaryColor
                    : Colors.grey,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          '$title',
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
