import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../../Utils/form_builder/custom_button.dart';
import '../../../../Utils/form_builder/custom_textformfield.dart';
import '../../../../Utils/function/format_account_number.dart';
import '../../../../Utils/helper/custom_appbar_colorswhite.dart';
import '../../../../widgets/privilege/custom_card_current_point.dart';
import '../../../wallet/controller/wallet_controller.dart';

class GiftMVPTransferScreen extends StatelessWidget {
  const GiftMVPTransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final walletController = Get.put(WalletController());
    return Scaffold(
      appBar: CustomAppBarWhiteColor(
        context: context,
        elevation: 0,
        title: 'Gift MVP',
        colorTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          icon: kIsWeb
              ? const Icon(Icons.arrow_back)
              : Platform.isAndroid
                  ? const Icon(Icons.arrow_back)
                  : const Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: () {
            context.pop();
            walletController.amountgiftMVPController.value.text = '';
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20.0),
                    child: CardCurrentPoints(
                      title: 'MVP Balance',
                      amount:
                          walletController.mvpBalance.value.mvpAmountFormat ??
                              '0.00',
                    ),
                  ),
                  Container(
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
                        const SizedBox(
                          height: 10.0,
                        ),
                        CustomTextFieldNew(
                          enable: false,
                          isValidate: walletController
                              .isGiftMVPVerifyAccountValidate.value,
                          validateText: walletController
                              .isGiftMVPVerifyAccountValidateMessage.value,
                          inputFormatterList: [
                            FilteringTextInputFormatter.digitsOnly,
                            AccountNumberFormatter(),
                          ],
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                            signed: false,
                          ),
                          isRequired: true,
                          autoFocus: false,
                          labelText: 'Receiver Wallet Number',
                          hintText: 'Receiver Wallet Number',
                          onChange: (value) async {},
                        ),
                        if (walletController
                                .isGiftMVPVerifyAccountValidate.value ==
                            true)
                          Padding(
                            padding: EdgeInsets.only(
                                left: 20,
                                bottom: walletController
                                            .receiveWalletNumber.value !=
                                        ''
                                    ? 10
                                    : 0,
                                right: 20),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (walletController
                                        .receiveWalletNumber.value !=
                                    '')
                                  SvgPicture.asset(
                                      'assets/images/wallet_found.svg'),
                                const SizedBox(width: 5),
                                if (walletController
                                        .receiveWalletNumber.value !=
                                    '')
                                  Text(
                                    walletController.receiveWalletNumber.value,
                                    style: const TextStyle(
                                        fontSize: 12, color: Color(0xff4FA30F)),
                                  )
                              ],
                            ),
                          ),
                        Focus(
                          onFocusChange: (value) {},
                          child: CustomTextFieldNew(
                            validateText: 'You have not enought Gift MVP',
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            // inputFormatterList: [DecimalTextInputFormatter()],
                            onChange: (value) {
                              debugPrint('hany test amount===$value');
                            },

                            controller:
                                walletController.amountgiftMVPController.value,
                            isRequired: true,
                            labelText: 'Amount',
                            hintText: 'Amount',
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(
                                top: 15,
                              ),
                              child: Text(
                                'MVP',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                        CustomTextFieldNew(
                          labelText: 'Remark',
                          hintText: 'Remark',
                          onChange: (value) {},
                        ),
                        const SizedBox(height: 14),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.white,
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
            child: CustomButton(
              width: double.infinity,
              onPressed: () {
                context.push('/mymvp/gift-mvp-transfer/review-gift-mvp');
              },
              title: 'Pay Now',
              isDisable: false,
              isOutline: false,
            ),
          ),
        ],
      ),
    );
  }
}
