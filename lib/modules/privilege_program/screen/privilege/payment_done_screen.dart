import 'package:cicgreenloan/Utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/modules/privilege_program/controller/privilege_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../../Utils/app_settings/controllers/appsetting_controller.dart';
import '../../../../Utils/helper/color.dart';
import '../../../../widgets/privilege/custom_dashedline.dart';

class PaymentDoneScreen extends StatelessWidget {
  final String? numberRated;
  final String? digiteCode;
  final GestureTapCallback? onTap;
  const PaymentDoneScreen({
    Key? key,
    this.numberRated,
    this.digiteCode,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final priCont = Get.put(PrivilegeController());
    final settingCon = Get.put(SettingController());
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1.0,
          title: const Text(
            'Member ID: CiC123456',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: Obx(
          () => Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          top: 20.0,
                        ),
                        child: LottieBuilder.asset(
                          "assets/images/animation/lf30_editor_g4pvkudk.json",
                          height: 220,
                          repeat: false,
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                          frameRate: FrameRate(100),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Success",
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Colors.black,
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: Text(
                          priCont.messagePayment.value,
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.headline2!.copyWith(
                                    color: Colors.black,
                                    height: 1.5,
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        '${priCont.descountRate.value} %',
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                              color: AppColor.statusColor['pending'],
                              fontWeight: FontWeight.w700,
                              fontSize: 37,
                            ),
                      ),
                      const CustomDasheLine(),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        '4 digits code',
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      const SizedBox(
                        height: 18.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          Clipboard.setData(
                            ClipboardData(text: priCont.fourDigitsCode.value),
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 88,
                          height: 31,
                          decoration: BoxDecoration(
                            color: AppColor.statusColor['pending']!
                                .withOpacity(0.2),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: Text(
                            priCont.fourDigitsCode.value,
                            style:
                                Theme.of(context).textTheme.headline2!.copyWith(
                                      color: AppColor.statusColor['pending'],
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                    ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SafeArea(
                top: false,
                minimum: const EdgeInsets.all(20),
                child: CustomButton(
                  onPressed: () {
                    settingCon.selectedIndex =
                        0; //change homescreen to dashboard
                    settingCon.onHideBottomNavigationBar(false);
                    settingCon.update();

                    context.go('/');
                  },
                  title: 'Done',
                  isDisable: false,
                  isOutline: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
