import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Utils/app_settings/controllers/appsetting_controller.dart';
import '../../../Utils/form_builder/custom_button.dart';

class WaitingApprovalScreen extends StatelessWidget {
  const WaitingApprovalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settingCon = Get.put(SettingController());
    settingCon.fetchTechnicalSupport();
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                        'assets/images/registration/waiting_approval.png'),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Waiting For Approval',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(
                              fontWeight: FontWeight.w700, fontSize: 20.0),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    SizedBox(
                      width: 339.0,
                      child: Text(
                        'We’ll send you an alert as soon as your account is approved, so you can start using our app right away.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.0,
                                color: const Color(0xff848F92)),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.error_outline,
                    color: Colors.grey,
                    size: 15.0,
                  ),
                  const SizedBox(
                    width: 6.0,
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet consectetur.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0,
                        color: const Color(0xff848F92)),
                  ),
                ],
              ),
              const SizedBox(
                height: 14.0,
              ),
              SafeArea(
                top: false,
                minimum: const EdgeInsets.only(
                  bottom: 20.0,
                ),
                child: CustomButton(
                  width: double.infinity,
                  onPressed: () {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return CupertinoActionSheet(
                          actions: [
                            CupertinoActionSheetAction(
                              onPressed: () async {
                                await launchUrl(
                                  Uri.parse(
                                      '${settingCon.technicalSupport.value.link}'),
                                  mode: LaunchMode.externalApplication,
                                );
                                debugPrint(
                                    'test telegram====${settingCon.technicalSupport.value.link}');
                              },
                              child: Text(
                                "Chat Telegram",
                                style: TextStyle(
                                  fontFamily: 'DMSans',
                                  fontSize: 16,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                            CupertinoActionSheetAction(
                              onPressed: () async {
                                await launchUrl(Uri.parse(
                                  'tel://${settingCon.technicalSupport.value.phone}',
                                ));
                                debugPrint(
                                    'test phone====${settingCon.technicalSupport.value.phone}');
                              },
                              child: Text(
                                '${settingCon.technicalSupport.value.phone}',
                                style: TextStyle(
                                  fontFamily: 'DMSans',
                                  fontSize: 16,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ],
                          cancelButton: CupertinoActionSheetAction(
                            onPressed: () {
                              context.pop();
                            },
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                fontFamily: 'DMSans',
                                fontSize: 16,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  title: 'Contact Us',
                  isDisable: false,
                  isOutline: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
