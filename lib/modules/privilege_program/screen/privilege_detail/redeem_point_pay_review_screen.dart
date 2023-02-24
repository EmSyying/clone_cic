import 'package:cicgreenloan/Utils/function/format_date_time.dart';
import 'package:cicgreenloan/Utils/helper/color.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../Utils/helper/custom_appbar.dart';
import '../../../../widgets/investments/slide_button.dart';
import '../../../../widgets/wallets/custom_cash_out_and_transfer_amount_mma.dart';
import '../../../../widgets/wallets/custom_positioned_boxshape_circle.dart';
import '../../../../widgets/wallets/custom_stack_dotted_decoration.dart';
import '../../../setting_modules/screens/sub_setting_screen/contract_terms.dart';
import '../../controller/privilege_controller.dart';

class RedeemPointPayReviewScreen extends StatelessWidget {
  const RedeemPointPayReviewScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final priController = Get.put(PrivilegeController());
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: CustomAppBar(
            elevation: 0,
            isLeading: true,
            context: context,
            title: "Review",
            isCallonPressed: true,
            onPressed: () async {
              Navigator.pop(context);
              debugPrint('cashout======');
            }),
        body: Obx(
          () => Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.05),
                                    spreadRadius: 0.1,
                                    offset: const Offset(0, 2),
                                    blurRadius: 8),
                              ],
                            ),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: 74,
                                  height: 74,
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      colors: [
                                        Color.fromARGB(235, 56, 70, 147),
                                        Color.fromARGB(235, 53, 137, 232),
                                      ],
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      'assets/images/svgfile/Union.svg',
                                      fit: BoxFit.cover,
                                      width: 38,
                                      height: 38,
                                    ),
                                  ),
                                ),
                                //=======title CiC MM acount======
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'MVP',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                        fontWeight: FontWeight.w700,
                                      ),
                                ),
                                const SizedBox(height: 30),
                                //====border StackDottedDecoration=====
                                const CustomStackDottedDecoration(
                                  dottedDecorationTransfer: true,
                                  title: 'You are about to Transfer',
                                ),
                                //Amount Cash Out MMA=========
                                const SizedBox(
                                  height: 22,
                                ),
                                CustomCashOutAndTransferAmount(
                                  amountCashOutTransfer:
                                      priController.amountToRedeemDisplay.value,
                                  pointTrue: true,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  color: Colors.white,
                                  child: SvgPicture.asset(
                                    'assets/images/wallet/arrow_down.svg',
                                    width: 40,
                                    height: 40,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),

                                Column(
                                  children: [
                                    Text(
                                      priController.receiveAccountname.value,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium!
                                          .copyWith(
                                            fontWeight: FontWeight.w700,
                                          ),
                                    ),
                                    const SizedBox(
                                      height: 8.0,
                                    ),
                                    Text(
                                      '${FormatDate.formatAccountNumber(priController.receiveAccountNumber.value)}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                            color: const Color(0xff515151),
                                          ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 30.0,
                                ),
                              ],
                            ),
                          ),
                          ////Posistion Boxshap Chircle on border dotted========
                          const CustomPositionedBoxShapCircle(
                            top: 156,
                            left: 6,
                          ),
                          const CustomPositionedBoxShapCircle(
                            top: 156,
                            right: 6,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      //Card Detail Summery MVP
                      Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 20.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.05),
                                    spreadRadius: 0.1,
                                    offset: const Offset(0, 2),
                                    blurRadius: 8),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Detail Summary',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14.0,
                                      ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                detailSummaryMVP(context,
                                    title: 'Amount',
                                    amount: priController
                                        .amountToRedeemDisplay.value
                                        .toString()),
                                // const SizedBox(
                                //   height: 14.0,
                                // ),
                                // detailSummaryMVP(context,
                                //     title: 'Discount (40%)',
                                //     amount: '- 244',
                                //     colorDiscount: true),
                                const SizedBox(
                                  height: 32,
                                ),
                                Container(
                                  decoration: DottedDecoration(
                                    strokeWidth: 1,
                                    shape: Shape.line,
                                    color: Colors.grey[300]!,
                                  ),
                                ),
                                const SizedBox(
                                  height: 26,
                                ),
                                detailSummaryMVP(
                                  context,
                                  title: 'Total',
                                  amount: priController.amountToPay.value,
                                  colorTotal: true,
                                ),
                              ],
                            ),
                          ),
                          const CustomPositionedBoxShapCircle(
                            top: 96,
                            left: 6,
                          ),
                          const CustomPositionedBoxShapCircle(
                            top: 96,
                            right: 6,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SafeArea(
                top: false,
                minimum: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    SlideButton(
                      callback: () async {
                        await priController.onRedeemToSubmitMVP(context);
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'By submitting you agree to',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ContractTerm(
                                  fromPage: 'Review Payment',
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              'CiC Service Agreement',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  // Widget containerMMAccount(BuildContext context) {
  //   return Column(
  //     children: [
  //       Text(
  //         'MVP',
  //         style: Theme.of(context).textTheme.headlineMedium!.copyWith(
  //               fontWeight: FontWeight.w700,
  //             ),
  //       ),
  //       const SizedBox(
  //         height: 2.0,
  //       ),
  //       Text(
  //         'Most Valuable Player',
  //         style: Theme.of(context).textTheme.displayMedium!.copyWith(
  //               fontWeight: FontWeight.w400,
  //               fontSize: 12.0,
  //               color: const Color(0xff848F92),
  //             ),
  //       ),
  //     ],
  //   );
  // }

  Widget detailSummaryMVP(
    BuildContext context, {
    bool colorDiscount = false,
    bool colorTotal = false,
    String? title,
    String? amount,
  }) {
    return Row(
      children: [
        Text(
          title ?? '',
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                fontWeight:
                    colorTotal == true ? FontWeight.w600 : FontWeight.w400,
                fontSize: 14.0,
                color: colorTotal == true
                    ? AppColor.darkColor
                    : const Color(0xff515151),
              ),
        ),
        const Spacer(),
        Text(
          '$amount MVP',
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 14.0,
              color: colorDiscount == true
                  ? AppColor.newRedStatus
                  : colorTotal == true
                      ? AppColor.statusColor['pending']
                      : AppColor.darkColor),
        ),
      ],
    );
  }
}
