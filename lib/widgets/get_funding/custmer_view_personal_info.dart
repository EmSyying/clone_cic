import 'package:cicgreenloan/widgets/member_directory/member_displayinfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomReviewProfileCard extends StatelessWidget {
  final String? fullName;
  final String? gender;
  final String? email;
  final String? phone;
  final String? dob;
  final bool? isEdit;
  final GestureTapCallback? onTap;

  const CustomReviewProfileCard(
      {Key? key,
      this.isEdit,
      this.email,
      this.fullName,
      this.gender,
      this.phone,
      this.dob,
      this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
              blurRadius: 4,
              offset: Offset(
                0.0,
                1.0,
              ),
              color: Colors.black12),
        ],
        color: Theme.of(context).cardColor,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Personal Information',
                        style: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: '*',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                if (isEdit!)
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
          if (fullName != '')
            MemberDisplayInfo(
              changeColorText: true,
              isTextAlignRight: true,
              label: 'Full Name : ',
              value: fullName,
            ),
          if (dob != "")
            MemberDisplayInfo(
              changeColorText: true,
              isTextAlignRight: true,
              label: 'Date of Birth :',
              value: dob,
            ),
          if (gender != "")
            MemberDisplayInfo(
              changeColorText: true,
              isTextAlignRight: true,
              label: 'Gender :',
              value: gender,
            ),
          if (email != "")
            MemberDisplayInfo(
              changeColorText: true,
              isTextAlignRight: true,
              label: 'Email :',
              value: email,
            ),
          if (phone != "")
            MemberDisplayInfo(
              changeColorText: true,
              isTextAlignRight: true,
              label: 'Phone :',
              value: phone,
            ),
          const SizedBox(
            height: 20.0,
          )
        ],
      ),
    );
  }
}
