import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../Utils/helper/custom_appbar.dart';
import '../../../../Utils/helper/custom_success_screen.dart';
import '../../../../widgets/investments/slide_button.dart';
import '../../../../widgets/wallets/custom_cash_out_and_transfer_amount_mma.dart';
import '../../../../widgets/wallets/custom_positioned_boxshape_circle.dart';
import '../../../../widgets/wallets/custom_stack_dotted_decoration.dart';

class RedeemPointPayReviewScreen extends StatelessWidget {
  const RedeemPointPayReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        const SizedBox(
                          height: 40,
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
                          height: 20,
                        ),
                        containerMMAccount(context),
                        const SizedBox(height: 38),
                        //====border StackDottedDecoration=====
                        const CustomStackDottedDecoration(
                          dottedDecorationTransfer: true,
                          title: 'You are about to Transfer',
                        ),
                        //Amount Cash Out MMA=========
                        const SizedBox(
                          height: 24,
                        ),
                        const CustomCashOutAndTransferAmount(
                          amountCashOutTransfer: '1020',
                          pointTrue: true,
                        ),
                        const SizedBox(
                          height: 36,
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
                          height: 36,
                        ),

                        Column(
                          children: [
                            Text(
                              'Hany',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              '0964776129',
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
                        const SizedBox(
                          height: 54.0,
                        ),
                      ],
                    ),
                  ),
                  ////Posistion Boxshap Chircle on border dotted========
                  const CustomPositionedBoxShapCircle(
                    top: 210,
                    left: 6,
                  ),
                  const CustomPositionedBoxShapCircle(
                    top: 210,
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
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return CustomSucessScreen(
                            title: 'Success',
                            description: 'Point redeem successfully',
                            buttonTitle: 'Done',
                            onPressedButton: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                          );
                        },
                      ),
                    );
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
                                  fontSize: 12, fontWeight: FontWeight.normal),
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
    );
  }

  Widget containerMMAccount(BuildContext context) {
    return Column(
      children: [
        Text(
          'Points',
          style: Theme.of(context).textTheme.headline4!.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
        const SizedBox(
          height: 2.0,
        ),
        Text(
          'Lorem Ipsum amets',
          style: Theme.of(context).textTheme.headline2!.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 12.0,
                color: const Color(0xff848F92),
              ),
        ),
      ],
    );
  }
}
