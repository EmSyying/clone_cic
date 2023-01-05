import 'package:cicgreenloan/utils/helper/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../Utils/form_builder/custom_textformfield.dart';
import '../../../Utils/helper/custom_appbar.dart';
import '../../../widgets/investments/slide_button.dart';
import '../../../widgets/mmaccount/wallet_total_amount_card.dart';
import '../controller/wallet_controller.dart';

class WalletExchange extends StatelessWidget {
  WalletExchange({super.key});
  final _walletController = Get.put(WalletController());

  @override
  Widget build(BuildContext context) {
    final textstyle = Theme.of(context).textTheme;
    return Scaffold(
      appBar: CustomAppBar(
        elevation: 0,
        isLogo: true,
        isLeading: true,
        context: context,
        title: "Exchange",
        // action: [
        //   Padding(
        //     padding: const EdgeInsets.only(right: 10.0),
        //     child: GestureDetector(
        //       onTap: () async {},
        //       child: SvgPicture.asset('assets/images/demo.svg'),
        //     ),
        //   ),
        // ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: WalletTotalCard(
              amount: _walletController.fetchWalletLoading.value == true
                  ? '--'
                  : _walletController.walletAmount.value.wallet!.balanceFormat,
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Amount to Exchange',
                          style: textstyle.subtitle2?.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w700),
                        ),
                        SvgPicture.asset(
                          'assets/images/demo.svg',
                          color: const Color(0xfff2f2f2),
                        ),
                      ],
                    ),
                  ),
                  CustomTextFieldNew(
                    // initialValue: _walletController.qrRecievingAmount.text,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    controller: _walletController.qrRecievingAmount,
                    inputFormatterList: [
                      FilteringTextInputFormatter.digitsOnly,
                      // FilteringTextInputFormatter.allow(
                      //     RegExp(r'\d{1,3}(,\d{3})*(\.\d+)?')),
                      // NumericInputFormatter(),
                    ],
                    onChange: (value) {
                      // _walletController.pointAmountController.text = value;
                    },
                    isRequired: true,
                    labelText: 'Amount',
                    hintText: 'Amount',
                    suffixText: 'USD',
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Text(
                      '1\$ = 1 Point',
                      style: textstyle.subtitle2?.copyWith(
                          color: const Color(0xffbdbdbd),
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        const Divider(
                          thickness: 1,
                          color: Color(0xffbdbdbd),
                        ),
                        Container(
                          width: 41,
                          height: 41,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: const Color(0xffbdbdbd),
                              ),
                              shape: BoxShape.circle),
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            'assets/images/wallet/wallet_exchange.svg',
                            height: 21,
                          ),
                        )
                      ],
                    ),
                  ),
                  CustomTextFieldNew(
                    controller: _walletController.pointAmountController,
                    enable: false,
                    labelText: 'Point Amount',
                    hintText: 'Point Amount',
                    suffixText: 'pts',
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SlideButton(
                      callback: () async {
                        context.pushNamed(
                          'SuccessScreen',
                          queryParams: {
                            'title': 'Success',
                            'description': 'Exchange successfully',
                            'appbarTitle': 'Point Exchange',
                          },
                          extra: {
                            'onPressedButton': () {
                              context.go('/wallet');
                            },
                          },
                        );
                      },
                    ),
                  ),
                  SafeArea(
                    top: false,
                    left: false,
                    right: false,
                    minimum: const EdgeInsets.only(bottom: 20),
                    child: Padding(
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
                                style: textstyle.headline3!.copyWith(
                                    color: AppColor.mainColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
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

class NumericInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    String newText = newValue.text;
    newText = newText.replaceAll(',', '.');
    double value = double.parse(newText);
    final formatter = NumberFormat.currency(locale: 'en_US');
    newText = formatter.format(value).replaceAll('USD', '');
    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}