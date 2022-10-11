import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cicgreenloan/Utils/app_settings/controllers/appsetting_controller.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/widgets/defualt_size_web.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../Utils/helper/custom_appbar.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
  final _settingCon = Get.put(SettingController());

  @override
  void initState() {
    _settingCon.fetchCompanyInfo();
    _settingCon.fetchAppVersion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultSizeWeb(
      child: Scaffold(
        appBar: CustomAppBar(
          context: context,
          title: 'About CiC Mobile',
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: kIsWeb
                  ? const Icon(Icons.arrow_back)
                  : Platform.isIOS
                      ? const Icon(Icons.arrow_back_ios)
                      : const Icon(Icons.arrow_back),
              color: Colors.white),
        ),
        body: Obx(
          () => !_settingCon.isLoadingAboutCiC.value
              ? SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      CachedNetworkImage(
                        imageUrl: _settingCon
                            .appSettingVersion.value.applicationLogo!,
                        width: 100,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            HtmlWidget(
                              _settingCon
                                  .aboutApp.value.aboutApp!.aboutAppEnglish!,
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: Text(
                                'Version ${_settingCon.appSettingVersion.value.applicationNewVersion}',
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : const LinearProgressIndicator(),
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            border: BorderDirectional(
              top: BorderSide(
                  color: Colors.grey, width: 0.2, style: BorderStyle.solid),
            ),
          ),
          child: Row(children: [
            Expanded(
              child: Container(
                height: 50.0,
                width: double.infinity,
                margin:
                    const EdgeInsets.only(left: 15.0, top: 20.0, bottom: 25.0),
                child: (CustomButton(
                  title: "Call",
                  isOutline: true,
                  isDisable: false,
                  onPressed: _settingCon.technicalSupport.value.phone != null
                      ? () async {
                          await launchUrl(Uri.parse(
                              'tel://${_settingCon.technicalSupport.value.phone}'));
                        }
                      : null,
                )),
              ),
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: Container(
                height: 50.0,
                width: double.infinity,
                margin:
                    const EdgeInsets.only(right: 15.0, top: 20.0, bottom: 25.0),
                child: CustomButton(
                  title: "Telegram",
                  isOutline: false,
                  isDisable: false,
                  onPressed: _settingCon.technicalSupport.value.link != null
                      ? () async {
                          await launchUrl(
                            Uri.parse(
                                '${_settingCon.technicalSupport.value.link}'),
                            mode: LaunchMode.externalApplication,
                          );
                        }
                      : null,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
