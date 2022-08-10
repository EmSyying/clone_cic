import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSelect2GetFunding extends StatelessWidget {
  final bool? islongLabel;
  final bool? isMultipleSelect;
  final bool isFromCreateOrUpdated;
  final String? title;
  final VoidCallback? ontap;
  final bool? isSelect;
  const CustomSelect2GetFunding(
      {Key? key,
      this.ontap,
      this.isSelect,
      this.isFromCreateOrUpdated = false,
      this.title,
      this.islongLabel = false,
      this.isMultipleSelect = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 20,
            child: isSelect!
                ? SvgPicture.asset(
                    'assets/images/Circle Check-selected.svg',
                    height: 20.0,
                    width: 20.0,
                  )
                : SvgPicture.asset('assets/images/circle-check.svg',
                    height: 20.0, width: 20.0, color: Colors.grey),
          ),
          const SizedBox(
            width: 8.0,
          ),
          !islongLabel!
              ? Container(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Text(
                    title!,
                    style: TextStyle(
                        fontFamily: 'DMSans-Medium',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: isSelect! || isFromCreateOrUpdated
                            ? Colors.black
                            : isMultipleSelect == true
                                ? Colors.black
                                : Colors.grey),
                  ),
                )
              : Expanded(
                  child: Text(
                    title!,
                    style: TextStyle(
                        fontFamily: 'DMSans-Medium',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: isSelect! || isFromCreateOrUpdated
                            ? Colors.black
                            : isMultipleSelect == true
                                ? Colors.black
                                : Colors.grey),
                  ),
                ),
        ],
      ),
    );
  }
}
