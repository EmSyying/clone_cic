import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAssocieateMember extends StatelessWidget {
  final String? title;
  final String? imageSvg;
  final GestureTapCallback? onTap;
  const CustomAssocieateMember(
      {Key? key, this.title, this.imageSvg, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
        margin: const EdgeInsets.only(left: 10, right: 10, top: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 0),
              color: Colors.grey[200]!,
              blurRadius: 6,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 3, top: 5),
              child: Text('$title',
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'assets/fonts/Mitr-Bold.ttf')),
            ),
            Column(
              children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 13, bottom: 5),
                  child: SvgPicture.network('$imageSvg'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
