import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomOptionBonus extends StatelessWidget {
  final String? imageUrl, title;
  final bool? isOptionStyle;
  final Function? onTap;
  const CustomOptionBonus(
      {Key? key,
      this.imageUrl,
      this.title,
      this.isOptionStyle = false,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap!(),
      child: Container(
        child: isOptionStyle == true
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade400, blurRadius: 0.2)
                          ]),
                      child: Center(
                        child: SvgPicture.asset(
                          imageUrl!,
                          width: 24,
                          height: 24,
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, top: 10),
                    child: Text(
                      title!,
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(fontSize: 12, color: Colors.white70),
                    ),
                  )
                ],
              )
            : Column(
                children: [
                  const SizedBox(height: 20),
                  SvgPicture.asset(imageUrl!),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, top: 20),
                    child: Text(
                      title!,
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(fontSize: 12),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
