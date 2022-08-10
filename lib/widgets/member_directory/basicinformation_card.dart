import 'package:cicgreenloan/widgets/member_directory/member_displayinfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BasicInformationCard extends StatelessWidget {
  final String? khmerName;
  final String? fullName;
  final String? dateOfBirth;
  final String? gender;
  final String? nationality;
  final GestureTapCallback? onTap;
  final bool? isHide;
  final bool? isEditable;

  const BasicInformationCard(
      {Key? key,
      this.khmerName,
      this.fullName,
      this.dateOfBirth,
      this.gender,
      this.nationality,
      this.onTap,
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
                    Text('Basic Information',
                        style: Theme.of(context).textTheme.headline2),
                    const Spacer(),
                    if (isEditable != null && isEditable!)
                      GestureDetector(
                          onTap: onTap,
                          child: SvgPicture.asset(
                              'assets/images/svgfile/edit-3.svg'))
                  ],
                ),
              ),
              if (khmerName != '')
                MemberDisplayInfo(label: 'Khmer name:', value: khmerName!),
              if (fullName != '')
                MemberDisplayInfo(label: 'Full name:', value: fullName!),
              if (dateOfBirth != '')
                MemberDisplayInfo(label: 'Date of Birth:', value: dateOfBirth!),
              if (gender != '')
                MemberDisplayInfo(label: 'Gender:', value: gender!),
              if (nationality != '')
                MemberDisplayInfo(label: 'Nationality:', value: nationality!),
            ],
          );
  }
}
