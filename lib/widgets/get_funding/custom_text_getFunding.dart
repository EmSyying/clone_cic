import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Utils/helper/color.dart';

class CustomTextGetfunding extends StatelessWidget {
  final String? label1, label2;
  final bool? isrequire;
  final VoidCallback? onTap;
  final bool isEdit;
  final bool isColorReView;
  const CustomTextGetfunding(
      {Key? key,
      this.label1,
      this.onTap,
      this.label2,
      this.isrequire = false,
      this.isEdit = false,
      this.isColorReView = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: label1,
                    style: TextStyle(
                        fontSize: 14,
                        color: isColorReView
                            ? const Color(0xff464646)
                            : Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                  TextSpan(
                    text: label2,
                    style: TextStyle(
                        color: AppColor.darkColor.withOpacity(0.8),
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                  if (isrequire == true)
                    const TextSpan(
                      text: '*',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                ],
              ),
            ),
          ),
          if (isEdit == true)
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: GestureDetector(
                onTap: onTap,
                child: SvgPicture.asset('assets/images/editIcon.svg'),
              ),
            ),
        ],
      ),
    );
  }
}
