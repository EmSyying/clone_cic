import 'package:cicgreenloan/Utils/app_settings/controllers/appsetting_controller.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/modules/setting_modules/screens/sub_setting_screen/privacy_policy.dart';
import 'package:cicgreenloan/widgets/defualt_size_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../../Utils/helper/custom_appbar.dart';

class ContractTerm extends StatefulWidget {
  final String? fromPage;
  const ContractTerm({Key? key, this.fromPage}) : super(key: key);

  @override
  State<ContractTerm> createState() => _ContractTermState();
}

class _ContractTermState extends State<ContractTerm> {
  final settingController = Get.put(SettingController());

  @override
  void initState() {
    settingController.fetchTermAndCondtions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultSizeWeb(
      child: Scaffold(
        appBar: CustomAppBar(
          isLogo: false,
          isLeading: true,
          context: context,
          title: widget.fromPage != null
              ? 'CiC Service Agreement'
              : 'Contractual Terms of Use of Laon Installment',
        ),
        body: SafeArea(
          child: Obx(
            () => !settingController.isLoading.value &&
                    settingController
                            .termAndcondtion.value.termAndConditionEnglish !=
                        null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Center(
                                child: Image.asset(
                                  'assets/images/Logo/cic.png',
                                  width: 150,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 20),
                              settingController.termAndcondtion.value
                                          .termAndConditionEnglish !=
                                      null
                                  ? HtmlWidget(
                                      settingController.termAndcondtion.value
                                          .termAndConditionEnglish!,
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
                      Container(
                        key: const Key("IhaveReadAndAgree"),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: CustomButton(
                          isOutline: false,
                          isDisable: false,
                          onPressed: () {
                            if (widget.fromPage != null) {
                              context.pop();
                            } else {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             const PrivacyPolcy()));
                              context.push(
                                  '/privacy-policy?fromPage${widget.fromPage}');
                            }
                          },
                          title: 'I have read and agree',
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '${DateTime.now().year} CIC Mobile.',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          Text(
                            ' All right reserved.',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ],
                      ),
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
        ),
      ),
    );
  }
}
