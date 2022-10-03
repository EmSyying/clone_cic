import 'package:cicgreenloan/Utils/app_settings/controllers/appsetting_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';

import '../../../../Utils/form_builder/custom_button.dart';
import '../../../../core/auth/login.dart';
import '../../../../utils/helper/custom_appbar.dart';

class PrivacyPolcy extends StatelessWidget {
  final String? fromPage;
  const PrivacyPolcy({Key? key, this.fromPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settingController = Get.put(SettingController());
    settingController.fetchPrivacyPolicy();
    return Scaffold(
      appBar: CustomAppBar(
        isLogo: false,
        isLeading: true,
        context: context,
        title: "Privacy Policy",
      ),
      body: SafeArea(
        child: Obx(
          () => !settingController.isPrivacyPolicy.value &&
                  settingController.privacyPolicy.value.privacyPolicyEnglish !=
                      null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              settingController.privacyPolicy.value
                                          .privacyPolicyEnglish !=
                                      null
                                  ? HtmlWidget(
                                      settingController.privacyPolicy.value
                                          .privacyPolicyEnglish!,
                                      textStyle: const TextStyle(
                                        height: 1.5,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      key: const Key("IhaveReadAndAgreePolicyPrivacy"),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: CustomButton(
                        isOutline: false,
                        isDisable: false,
                        onPressed: () {
                          if (fromPage != null) {
                            Navigator.pop(context);
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          }
                        },
                        title: 'I have read and agree',
                      ),
                    ),
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }
}
