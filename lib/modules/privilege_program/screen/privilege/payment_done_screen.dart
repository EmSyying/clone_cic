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
  final int? id;
  // final GestureTapCallback? onTap;
  const PaymentDoneScreen({
    Key? key,
    this.numberRated,
    this.digiteCode,
    // this.onTap,
    this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final priCont = Get.put(PrivilegeController());
    final settingCon = Get.put(SettingController());
    // if (id != null) {
    //   priCont.shopId.value = id!;
    // }
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.5,
            title: const Center(
              child: Text(
                'Claim Discount',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            automaticallyImplyLeading: false,
          ),
          body: GetBuilder(
            init: priCont,
            initState: (state) {
              // priCont.shopId.value = id!;
              // priCont.onPaymentPrivilege(context: context);
            },
            builder: (_) {
              return Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 250,
                            color: Colors.transparent,
                            child: Center(
                              child: LottieBuilder.asset(
                                "assets/images/50465-done.json",
                                repeat: false,
                                fit: BoxFit.cover,
                                alignment: Alignment.center,
                                frameRate: FrameRate(90),
                              ),
                            ),
                          ),
                          Text(
                            "Success",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: Colors.black,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                          const SizedBox(
                            height: 6.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 50),
                            child: Text(
                              priCont.messagePayment.value,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
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
                            priCont.descountRate.value,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
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
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
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
                                ClipboardData(
                                    text: priCont.fourDigitsCode.value),
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
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
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
                        //context.go('/privilege-payment/$id');
                        context.go('/');
                      },
                      title: 'Done',
                      isDisable: false,
                      isOutline: false,
                    ),
                  ),
                ],
              );
            },
          )),
    );
  }
}
