import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Utils/helper/container_partern.dart';

class CustomRejectReason extends StatelessWidget {
  final Function? onEdit;
  final String? title;
  final String? reason;
  final Widget? icon;
  final bool? isReson;
  const CustomRejectReason({
    Key? key,
    this.onEdit,
    this.reason,
    this.title,
    this.icon,
    this.isReson,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffF9E4E5),
      width: MediaQuery.of(context).size.width,
      padding:
          const EdgeInsets.symmetric(horizontal: padding, vertical: padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset('assets/images/svgfile/clea_icon.svg'),
              //const SizedBox(width: padding),
              SizedBox(width: isReson == true ? 10 : padding),
              Text(
                title!,
                style: const TextStyle(
                    color: Color(0xffED1E26),
                    fontSize: 15,
                    fontFamily: 'DMSans',
                    fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => onEdit!(),
                child: isReson == true ? Container() : icon,
              ),
            ],
          ),
          //  const SizedBox(height: padding),
          SizedBox(height: isReson == true ? 10 : padding),
          Text(
            reason!,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontFamily: 'DMSans',
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
