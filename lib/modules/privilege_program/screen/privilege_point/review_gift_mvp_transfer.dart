import 'package:cicgreenloan/modules/privilege_program/controller/privilege_controller.dart';
import 'package:cicgreenloan/utils/helper/custom_route_snackbar.dart';
import 'package:cicgreenloan/utils/helper/format_number.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../../Utils/helper/custom_appbar.dart';
import '../../../../widgets/investments/slide_button.dart';
import '../../../../widgets/wallets/custom_cash_out_and_transfer_amount_mma.dart';
import '../../../../widgets/wallets/custom_positioned_boxshape_circle.dart';
import '../../../../widgets/wallets/custom_stack_dotted_decoration.dart';
import '../../../setting_modules/screens/sub_setting_screen/contract_terms.dart';

class ReviewGiftMVPTransfer extends StatelessWidget {
  const ReviewGiftMVPTransfer({super.key});

  @override
  Widget build(BuildContext context) {
    final privilegeController = Get.put(PrivilegeController());
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
            }),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Stack(
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
                            height: 24,
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
                                "assets/images/svgfile/pointnew.svg",
                                fit: BoxFit.cover,
                                width: 50,
                                height: 50,
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
                            title: 'You are about to gift',
                          ),
                          //Amount Cash Out MMA=========
                          const SizedBox(
                            height: 22,
                          ),
                          CustomCashOutAndTransferAmount(
                            amountCashOutTransfer: FormatNumber.formatNumber(
                                num.tryParse(privilegeController
                                        .amountgiftMVPController.value.text) ??
                                    0),
                            // priController.amountToRedeemDisplay.value,
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
                                privilegeController.receiverWalletName.value,
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
                                '098378476',
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
                      top: 158,
                      left: 6,
                    ),
                    const CustomPositionedBoxShapCircle(
                      top: 158,
                      right: 6,
                    ),
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
                      await privilegeController.sentMVPGift().then((value) {
                        if (value != null) {
                          context.pushNamed(
                            'GiftMVPSuccessfully',
                            queryParams: {
                              'amount': value.amount,
                              'accountMVP': value.toAccountName,
                              'transactionID': value.transactionId,
                              'date': value.date,
                              'reference': value.reference,
                              'fromAccount': value.fromAccountName,
                              'originalAmount': value.originalAmount,
                              'remark': value.remark ?? '',
                            },
                            extra: {
                              'onPressed': () {
                                try {
                                  final location =
                                      GoRouterState.of(context).location;
                                  if (location.contains("/giftmvp")) {
                                    context.go("/");
                                  } else {
                                    context.go('/mymvp');
                                  }
                                  debugPrint("location$location");
                                } catch (e) {
                                  debugPrint("Routing Error => $e");
                                }
                              },
                            },
                          );
                        } else {
                          customRouterSnackbar(
                            title: 'Error',
                            description:
                                'Somethings went wrong please try again.',
                            type: SnackType.error,
                          );
                        }
                      });
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
    );
  }
}
