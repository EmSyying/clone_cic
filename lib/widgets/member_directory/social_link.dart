import 'package:cicgreenloan/widgets/member_directory/member_displayinfo.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialInformationCard extends StatelessWidget {
  final String? website;
  final String? facebook;
  final String? linkedIn;
  final String? twitter;
  final bool? isEditable;
  final GestureTapCallback? onTap;
  final bool? isHide;

  const SocialInformationCard(
      {Key? key,
      this.website,
      this.facebook,
      this.linkedIn,
      this.twitter,
      this.isHide,
      this.isEditable = false,
      this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return isHide != null && isHide!
        ? Container()
        : Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: website != '' ||
                        facebook != '' ||
                        linkedIn != '' ||
                        twitter != ''
                    ? Row(
                        children: [
                          const Text(
                            'Social Link Information',
                            style: TextStyle(
                                fontFamily: 'DMSans',
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          if (website != '' && isEditable! ||
                              facebook != '' && isEditable! ||
                              linkedIn != '' && isEditable! ||
                              twitter != '' && isEditable!)
                            GestureDetector(
                                onTap: onTap!,
                                child: SvgPicture.asset(
                                    'assets/images/svgfile/edit-3.svg'))
                        ],
                      )
                    : Container(),
              ),
              if (website == '' &&
                  facebook == '' &&
                  linkedIn == '' &&
                  twitter == '' &&
                  isEditable!)
                GestureDetector(
                  onTap: onTap!,
                  child: Container(
                    height: 60,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Stack(children: [
                      Positioned(
                        top: 10,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          color: Theme.of(context).primaryColor,
                          radius: const Radius.circular(10),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[100]),
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Add Social Link Information',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]
                        // strokeCap: StrokeCap.round,

                        ),
                  ),
                ),
              if (website != '')
                MemberDisplayInfo(
                    label: 'Website:', value: website, type: 'link'),
              if (facebook != '')
                MemberDisplayInfo(
                    label: 'Facebook:', value: facebook, type: 'link'),
              if (linkedIn != '')
                MemberDisplayInfo(
                    label: 'LinkedIn:', value: linkedIn, type: 'link'),
              if (twitter != '')
                MemberDisplayInfo(
                    label: 'Twitter:', value: twitter, type: 'link'),
            ],
          );
  }
}
