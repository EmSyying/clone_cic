import 'package:cicgreenloan/widgets/member_directory/member_displayinfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CompanyLocationInfo extends StatelessWidget {
  final String? houseNo;
  final String? streetNo;
  final String? address;
  final bool? isHide;
  final bool? isEditable;
  final GestureTapCallback? onTap;

  const CompanyLocationInfo(
      {Key? key,
      this.houseNo,
      this.streetNo,
      this.address,
      this.isEditable,
      this.isHide,
      this.onTap})
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
                    Text('Location',
                        style: Theme.of(context).textTheme.displayMedium),
                    const Spacer(),
                    if (isEditable != null && isEditable!)
                      GestureDetector(
                          onTap: onTap,
                          child: SvgPicture.asset(
                              'assets/images/svgfile/edit-3.svg'))
                  ],
                ),
              ),
              if (houseNo != '')
                MemberDisplayInfo(label: 'House No:', value: houseNo!),
              if (streetNo != '')
                MemberDisplayInfo(label: 'Street No:', value: streetNo!),
              if (address != '')
                MemberDisplayInfo(label: 'Address:', value: address!),
            ],
          );
  }
}
