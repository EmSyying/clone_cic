import 'package:cicgreenloan/Utils/helper/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomOptionProfile extends StatelessWidget {
  final String? title;
  final String? imageSvg;
  final GestureTapCallback? onPress;
  const CustomOptionProfile({Key? key, this.title, this.imageSvg, this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPress,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.mainColor.withOpacity(0.1),
            ),
            child: Center(
              child: SvgPicture.asset(
                '$imageSvg',
                fit: BoxFit.cover,
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
              .headline5!
              .copyWith(fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
