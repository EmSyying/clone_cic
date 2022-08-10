import 'package:cicgreenloan/Utils/app_settings/controllers/appsetting_controller.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/widgets/defualt_size_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';

import '../../../../Utils/helper/custom_appbar.dart';
import '../../../../core/auth/login.dart';

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
            isLeading: true,
            context: context,
            title: widget.fromPage != null
                ? 'CiC Service Agreement'
                : 'Contractual Terms of Use of Laon Installment',
          ),
          body: Obx(
            () => !settingController.isLoading.value &&
                    settingController
                            .termAndcondtion.value.termAndConditionEnglish !=
                        null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/Logo/cic.png',
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(20),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                settingController.termAndcondtion.value
                                            .termAndConditionEnglish !=
                                        null
                                    ? HtmlWidget(
                                        settingController.termAndcondtion.value
                                            .termAndConditionEnglish!,
                                        textStyle: const TextStyle(
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
                        key: const Key("IhaveReadAndAgree"),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: CustomButton(
                          isOutline: false,
                          isDisable: false,
                          onPressed: () {
                            if (widget.fromPage != null) {
                              Navigator.pop(context);
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()));
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
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          )),
    );
  }
}
