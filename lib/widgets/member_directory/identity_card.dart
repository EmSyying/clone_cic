import 'package:cicgreenloan/widgets/member_directory/member_displayinfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IdenttityInformationCard extends StatelessWidget {
  final String? identitytype;
  final String? identityNum;
  final String? issueDate;
  final String? issueExpire;
  final bool? isEditable;
  final bool? isHide;
  final Function? onTap;
  const IdenttityInformationCard(
      {Key? key,
      this.identitytype,
      this.onTap,
      this.identityNum,
      this.issueDate,
      this.issueExpire,
      this.isEditable,
      this.isHide})
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
                      'Identities',
                      style: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    if (isEditable != null && isEditable!)
                      GestureDetector(
                          onTap: () => onTap,
                          child: SvgPicture.asset(
                              'assets/images/svgfile/edit-3.svg'))
                  ],
                ),
              ),
              if (identitytype != '')
                MemberDisplayInfo(
                  label: 'Identity type:',
                  value: identitytype!,
                  isLongLabel: true,
                ),
              if (identityNum != '')
                MemberDisplayInfo(
                    label: 'Identity number:',
                    value: identityNum!,
                    isLongLabel: true),
              if (issueDate != '')
                MemberDisplayInfo(
                    label: 'Issue date:', value: issueDate!, isLongLabel: true),
              if (issueExpire != '')
                MemberDisplayInfo(
                    label: 'Issue Expire:',
                    value: issueExpire!,
                    isLongLabel: true),
            ],
          );
  }
}
