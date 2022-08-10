import 'package:cicgreenloan/Utils/form_builder/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactForSupport extends StatelessWidget {
  final List<String> phoneNumList;
  const ContactForSupport({Key? key, this.phoneNumList = const []})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const Spacer(),
          SvgPicture.asset("assets/images/contact_us.svg"),
          const SizedBox(height: 25),
          Text(
            "Need Help?",
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                fontFamily: "DMSans-Bold",
                fontWeight: FontWeight.w700,
                fontSize: 16),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              "Contact us by choosing any channel you would love to below",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  height: 1.5,
                  fontFamily: "DMSans-Medium",
                  fontWeight: FontWeight.w500,
                  fontSize: 14),
            ),
          ),
          const Spacer(),
          CustomButton(
            title: "Call Hotline",
            onPressed: () async {
              showCupertinoModalPopup<void>(
                context: context,
                builder: (BuildContext context) => CupertinoActionSheet(
                    // title: const Text('Title'),
                    // message: const Text('Message'),
                    cancelButton: CupertinoActionSheetAction(
                      child: const Text('Cancel'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    actions: phoneNumList.isNotEmpty
                        ? phoneNumList
                            .map(
                              (e) => e.contains("+")
                                  ? CupertinoActionSheetAction(
                                      child: Text(e),
                                      onPressed: () async {
                                        Navigator.pop(context);
                                        await launchUrl(Uri.parse(
                                            "tel:${e.replaceAll(' ', '')}"));
                                      },
                                    )
                                  : Container(),
                            )
                            .toList()
                        : []),
              );
            },
            isDisable: false,
            isOutline: false,
            iconUrl: "assets/images/call.svg",
          ),
          const SizedBox(height: 20),
          CustomButton(
            title: "Messenger",
            onPressed: () {},
            isDisable: false,
            isOutline: true,
            iconUrl: "assets/images/messenger.svg",
          ),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                "I want to keep application",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                    ),
              ),
            ),
          ),
          const SizedBox(height: 47)
        ],
      ),
    );
  }
}
