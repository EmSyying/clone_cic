import 'package:cicgreenloan/widgets/member_directory/member_displayinfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReferenceInformationCard extends StatelessWidget {
  final String? recommendBy;
  final String? expertise;
  final String? memberType;
  final String? yearJoined;
  final String? profile;
  final bool? isEditable;

  final bool? isHide;

  const ReferenceInformationCard(
      {Key? key,
      this.recommendBy,
      this.expertise,
      this.memberType,
      this.yearJoined,
      this.profile,
      this.isHide,
      this.isEditable})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return isHide != null && isHide!
        ? Container()
        : Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
                child: Row(
                  children: [
                    const Text(
                      'Reference',
                      style: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    if (isEditable != null && isEditable!)
                      GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(
                              'assets/images/svgfile/edit-3.svg'))
                  ],
                ),
              ),
              if (recommendBy != '')
                MemberDisplayInfo(
                  label: 'Recomment by:',
                  value: recommendBy,
                  isLongLabel: true,
                ),
              if (expertise != '')
                MemberDisplayInfo(
                  label: 'Expertise:',
                  value: expertise,
                  isLongLabel: true,
                ),
              if (memberType != '')
                MemberDisplayInfo(
                  label: 'Member Type:',
                  value: memberType,
                  isLongLabel: true,
                ),
              if (yearJoined != '')
                MemberDisplayInfo(
                  label: 'Year joined:',
                  value: yearJoined,
                  isLongLabel: true,
                ),
              if (profile != '')
                MemberDisplayInfo(
                  label: 'Profile/Biography:',
                  value: profile,
                  isLongLabel: true,
                ),
            ],
          );
  }
}
