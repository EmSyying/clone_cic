import 'dart:io';

import 'package:dotted_decoration/dotted_decoration.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../Utils/helper/custom_appbar.dart';
import '../../../Utils/helper/custom_success_screen.dart';
import '../../../widgets/defualt_size_web.dart';
import '../../../widgets/investments/slide_button.dart';
import '../../bonus/controllers/bonus_controller.dart';

class ReviewMMATransferScreen extends StatelessWidget {
  final bool? isStatusPending;
  const ReviewMMATransferScreen({Key? key, this.isStatusPending = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final fifController = Get.put(PriceController());
    final newCashOutCon = Get.put(BonusController());
    return DefaultSizeWeb(
      child: Scaffold(
        appBar: CustomAppBar(
          elevation: 0,
          context: context,
          title: 'Review',
          leading: IconButton(
            icon: Platform.isIOS
                ? const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  )
                : const Icon(
                    Icons.arrow_back,
                  ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
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
                          //=======
                          Container(
                            margin: const EdgeInsets.only(
                              bottom: 18.0,
                              top: 20.0,
                            ),
                            child: Column(
                              children: [
                                Text(
                                  'CiC MM account',
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
                                  'Pay securely with CiC MM Account',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2!
                                      .copyWith(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.0,
                                        color: const Color(0xff848F92),
                                      ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 20),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                decoration: DottedDecoration(
                                    strokeWidth: 2,
                                    shape: Shape.line,
                                    color: Colors.grey[100]!),
                              ),
                              Container(
                                color: Colors.white,
                                child: Text(
                                  'You are about to Cash Out',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2!
                                      .copyWith(
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 0.28,
                                        fontSize: 16.0,
                                        color: const Color(0xff515151),
                                      ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                              bottom: 20.0,
                              top: 20.0,
                            ),
                            child: Text(
                              '${newCashOutCon.cashoutAmount.value} USD',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 24,
                                  ),
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
                                  newCashOutCon.bankName.value,
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
                                  newCashOutCon.accountNumberController.text,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2!
                                      .copyWith(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        color: const Color(0xff515151),
                                      ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  newCashOutCon.accountNameController.text,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2!
                                      .copyWith(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.0,
                                        color: const Color(0xff848F92),
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 195,
                      left: 6,
                      child: Container(
                        width: 26,
                        height: 26,
                        decoration: BoxDecoration(
                          color: Colors.grey[50],
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 195,
                      right: 6,
                      child: Container(
                        width: 26,
                        height: 26,
                        decoration: BoxDecoration(
                          color: Colors.grey[50],
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SafeArea(
              top: false,
              bottom: false,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                    ),
                    child: SlideButton(
                      callback: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return CustomSucessScreen(
                                title: 'Success',
                                description:
                                    'The Cash out is completed successfully.',
                                buttonTitle: 'Done',
                                onPressedButton: () {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                      bottom: 30.0,
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
      ),
    );
  }
}
