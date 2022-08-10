import 'package:cicgreenloan/widgets/member_directory/member_displayinfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Utils/form_builder/custom_form_card.dart';

class CustomReviewAdress extends StatelessWidget {
  final String? currentAddress;
  final String? permanentadress;

  final GestureTapCallback? onTap;

  final bool? isEditable;
  const CustomReviewAdress(
      {Key? key,
      this.currentAddress,
      this.isEditable,
      this.onTap,
      this.permanentadress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Address',
                style: TextStyle(
                    fontFamily: 'DMSans',
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
              if (isEditable!)
                GestureDetector(
                  child: SvgPicture.asset('assets/images/editIcon.svg'),
                ),
            ],
          ),
        ),
        CustomFormCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (currentAddress != '')
                MemberDisplayInfo(
                    changeColorText: true,
                    label: 'Current Address :',
                    isMultipleLine: true,
                    value: currentAddress!),
              if (permanentadress != '')
                MemberDisplayInfo(
                    changeColorText: true,
                    isMultipleLine: true,
                    label: 'Permanent Address :',
                    value: permanentadress!),
            ],
          ),
        ),
      ],
    );
  }
}
