import 'package:cicgreenloan/widgets/member_directory/member_displayinfo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CompanyProductionServiceCard extends StatelessWidget {
  final String? companyproductService;
  final String? companykhmerName;
  final String? position;
  final bool? isEdiable;
  final GestureDoubleTapCallback? onTap;

  const CompanyProductionServiceCard(
      {Key? key,
      this.onTap,
      this.companykhmerName,
      this.companyproductService,
      this.position,
      this.isEdiable = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                companyproductService == ""
                    ? Container()
                    : MemberDisplayInfo(
                        isLabelNotSimple: true,
                        label: "Product and Service",
                        isMultipleLine: true,
                        value: companyproductService != ''
                            ? "$companyproductService"
                            : "",
                      ),
                companykhmerName == ''
                    ? Container()
                    : MemberDisplayInfo(
                        isLongLabel: true,
                        label: "Khmer name:",
                        value:
                            companykhmerName != "" ? "$companykhmerName" : "",
                      ),
                position == ''
                    ? Container()
                    : MemberDisplayInfo(
                        isLongLabel: true,
                        label: "Position:",
                        value: position != null ? "$position" : ""),
              ],
            ),
          ),
          isEdiable == true
              ? GestureDetector(
                  onTap: onTap,
                  child: SvgPicture.asset('assets/images/svgfile/edit-3.svg'),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
