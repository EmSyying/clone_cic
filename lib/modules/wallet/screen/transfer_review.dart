import 'package:cicgreenloan/modules/wallet/controller/wallet_controller.dart';
import 'package:cicgreenloan/utils/helper/custom_appbar.dart';
import 'package:cicgreenloan/utils/helper/extension/string_extension.dart';
import 'package:cicgreenloan/widgets/wallets/custom_stack_dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../widgets/investments/slide_button.dart';
import '../../../widgets/wallets/custom_cash_out_and_transfer_amount_mma.dart';
import '../../../widgets/wallets/custom_positioned_boxshape_circle.dart';

class TransferReview extends StatelessWidget {
  const TransferReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final walletController = Get.put(WalletController());
    return Scaffold(
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
                        Container(
                          margin: const EdgeInsets.only(top: 20.0),
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.grey[50],
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/images/svgfile/cic_logo.svg',
                              fit: BoxFit.cover,
                              width: 54,
                              height: 30,
                            ),
                          ),
                        ),
                        //=======title CiC MM acount======
                        containerMMAccount(context),
                        const SizedBox(height: 20),
                        //====border StackDottedDecoration=====
                        const CustomStackDottedDecoration(
                          dottedDecorationTransfer: true,
                          title: 'You are about to Transfer',
                        ),
                        //Amount Cash Out MMA=========
                        Container(
                          margin: const EdgeInsets.only(
                            bottom: 20.0,
                            top: 20.0,
                          ),
                          child: CustomCashOutAndTransferAmount(
                            amountCashOutTransfer:
                                '${walletController.qrRecievingAmount.text.toCurrencyAmount()} ',
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          child: SvgPicture.asset(
                            'assets/images/wallet/arrow_down.svg',
                            width: 40,
                            height: 40,
                          ),
                        ),

                        Container(
                          margin: const EdgeInsets.only(
                            bottom: 20.0,
                            top: 20.0,
                          ),
                          child: Column(
                            children: [
                              Text(
                                walletController.validateMessage.value,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                walletController.qrRecievingPhone.text,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2!
                                    .copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: const Color(0xff515151),
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  ////Posistion Boxshap Chircle on border dotted========
                  const CustomPositionedBoxShapCircle(
                    top: 195,
                    left: 6,
                  ),
                  const CustomPositionedBoxShapCircle(
                    top: 195,
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
                    await walletController.transferToOtherMMA(context);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'By submitting you agree to',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      GestureDetector(
                        onTap: () {
                          context.push(
                              '/investment/view-contract-term?fromPage=FIF');
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Text(
                            'CiC Service Agreement',
                            style: Theme.of(context)
                                .textTheme
                                .headline3!
                                .copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget containerMMAccount(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 18.0,
        top: 20.0,
      ),
      child: Column(
        children: [
          Text(
            'CiC MM Account',
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            'Pay securely with CiC MM Account',
            style: Theme.of(context).textTheme.headline2!.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.0,
                  color: const Color(0xff848F92),
                ),
          ),
        ],
      ),
    );
  }
}
