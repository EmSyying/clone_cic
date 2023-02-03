import 'package:cicgreenloan/modules/bonus/controllers/bonus_controller.dart';
import 'package:cicgreenloan/Utils/app_settings/controllers/appsetting_controller.dart';
import 'package:cicgreenloan/widgets/custom_showbottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../Utils/helper/color.dart';
import '../../../Utils/helper/container_partern.dart';

class CustomInvestBalanceCard extends StatelessWidget {
  final String? leftTitle,
      rightTitle,
      leftSubTitle,
      rightSubTitle,
      titleBalance;
  final num? currency;
  final bool isContainStack;
  const CustomInvestBalanceCard({
    Key? key,
    this.leftTitle,
    this.currency,
    this.rightTitle,
    this.leftSubTitle,
    this.rightSubTitle,
    this.titleBalance,
    this.isContainStack = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isContainStack ? null : 170,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(borderRaduis),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: SvgPicture.asset('assets/images/svgfile/wallet.svg'),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(titleBalance!,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Colors.white)),
                    Row(
                      children: [
                        Text(
                          FormatToK.digitNumber(currency),
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(fontSize: 19, color: Colors.white),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'USD',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                        )
                      ],
                    ),
                  ],
                ),
                GetBuilder<SettingController>(
                  init: SettingController(),
                  builder: (controller) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: TextButton(
                        onPressed: () {
                          onShowBottomSheet(
                            icondata: Icons.close,
                            isLoading: controller.isloading,
                            title: 'Available Balance',
                            context: context,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: controller
                                              .uiSettingData.availableBalance !=
                                          null
                                      ? HtmlWidget(
                                          "${controller.uiSettingData.availableBalance!.description}",
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .displayMedium!
                                              .copyWith(
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 14))
                                      : Container(),
                                )
                              ],
                            ),
                          );
                        },
                        child: SvgPicture.asset(
                          'assets/images/svgfile/questicon.svg',
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          if (isContainStack == false)
            Positioned(
              bottom: 0,
              left: 35,
              right: 35,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 2,
                      )
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20, bottom: 10, top: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              leftTitle!,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              leftSubTitle!,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                      color: Theme.of(context).primaryColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      child: SvgPicture.asset(
                          'assets/images/svgfile/investordivider.svg'),
                    ),
                    // Container(
                    //   margin: EdgeInsets.only(top: 10, bottom: 10),
                    //   width: 1,
                    //   height: 40,
                    //   color: Colors.grey[400],
                    // ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              rightTitle!,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              rightSubTitle!,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                      color: Theme.of(context).primaryColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
