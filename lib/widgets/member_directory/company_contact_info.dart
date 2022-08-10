import 'package:cicgreenloan/widgets/member_directory/member_displayinfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CompanyContactInFo extends StatelessWidget {
  final String? phone;
  final String? email;
  final String? telegram;
  final String? whatApp;
  final String? skpye;
  final String? messenger;
  final GestureTapCallback? onTap;
  final bool? isHide;
  final bool? isEditable;

  const CompanyContactInFo(
      {Key? key,
      this.phone,
      this.email,
      this.telegram,
      this.whatApp,
      this.messenger,
      this.skpye,
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
                    Text('Contact Information',
                        style: Theme.of(context).textTheme.headline2),
                    const Spacer(),
                    if (isEditable != null && isEditable!)
                      GestureDetector(
                          onTap: onTap!,
                          child: SvgPicture.asset(
                              'assets/images/svgfile/edit-3.svg'))
                  ],
                ),
              ),
              if (phone != '')
                MemberDisplayInfo(label: 'Phone:', value: phone!),
              if (email != '')
                MemberDisplayInfo(label: 'Email:', value: email!),
              if (telegram != '')
                MemberDisplayInfo(label: 'Telegram:', value: telegram!),
              if (whatApp != '')
                MemberDisplayInfo(label: 'What App:', value: whatApp!),
              if (skpye != '')
                MemberDisplayInfo(label: 'Skype:', value: skpye!),
              if (messenger != '')
                MemberDisplayInfo(label: 'Messenger:', value: messenger!),
            ],
          );
  }
}
