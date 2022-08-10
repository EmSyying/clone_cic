import 'package:cicgreenloan/Utils/form_builder/custom_form_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomReviewCard extends StatelessWidget {
  final String? titleLabel;
  final List<Widget>? children;
  final bool? isOldStyle;

  final GestureTapCallback? onTap;
  final bool? isEditable;
  const CustomReviewCard({
    Key? key,
    this.isEditable,
    this.titleLabel,
    this.onTap,
    this.children,
    this.isOldStyle = false,
  }) : super(key: key);
//==
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                titleLabel!,
                style: const TextStyle(
                    fontFamily: 'DMSans',
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              ),
              if (isEditable!)
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    color: Colors.transparent,
                    padding: const EdgeInsets.all(6.0),
                    width: 30,
                    height: 32,
                    child: SvgPicture.asset(
                        'assets/images/svgfile/editedIcon.svg'),
                  ),
                ),
            ],
          ),
        ),
        CustomFormCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children!,
          ),
        ),
      ],
    );
  }
}
