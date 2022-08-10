import 'package:cicgreenloan/widgets/member_directory/member_displayinfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactInformationCard extends StatelessWidget {
  final String? phone;
  final String? email;
  final String? telegram;
  final String? whatspp;
  final String? skype;
  final String? messenger;
  final bool? isEditable;
  final GestureTapCallback? onTap;
  final bool? isHide;

  const ContactInformationCard(
      {Key? key,
      this.phone,
      this.email,
      this.telegram,
      this.whatspp,
      this.skype,
      this.messenger,
      this.isEditable,
      this.onTap,
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
                    Text('Contact Information',
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
              if (phone != '')
                MemberDisplayInfo(
                  label: 'Phone',
                  value: phone!,
                  type: 'phone',
                ),
              if (email != '')
                MemberDisplayInfo(
                  label: 'Email: ',
                  value: email!,
                  type: 'email',
                ),
              if (telegram != '')
                MemberDisplayInfo(label: 'Telegram:', value: telegram!),
              if (whatspp != '')
                MemberDisplayInfo(label: 'What app:', value: whatspp!),
              if (skype != '')
                MemberDisplayInfo(label: 'Skype:', value: skype!),
              if (messenger != '')
                MemberDisplayInfo(label: 'Messenger:', value: messenger!),
            ],
          );
  }
}
