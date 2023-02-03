import 'dart:io';

import 'package:cicgreenloan/Utils/function/convert_to_double.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../../Utils/form_builder/custom_button.dart';
import '../../../../Utils/form_builder/custom_textformfield.dart';
import '../../../../Utils/helper/custom_appbar_colorswhite.dart';
import '../../../../Utils/helper/digit_decimal_formarter.dart';
import '../../../../widgets/privilege/custom_card_current_point.dart';
import '../../../wallet/controller/wallet_controller.dart';
import '../../controller/privilege_controller.dart';

class RedeemPointToPay extends StatelessWidget {
  const RedeemPointToPay(
      {Key? key,
      this.receiveAccountName,
      this.receiveAccountNumber,
      this.shopStoreId})
      : super(key: key);
  final String? receiveAccountName;
  final String? receiveAccountNumber;
  final int? shopStoreId;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.titleSmall!;
    final walletController = Get.put(WalletController());
    final priController = Get.put(PrivilegeController());
    if (receiveAccountName != null && receiveAccountNumber != null) {
      walletController.onFetchMyPoin();
      priController.shopStoreId.value = shopStoreId!;
      priController.receiveAccountNumber.value = receiveAccountNumber!;
      priController.receiveAccountname.value = receiveAccountName!;
    }

    return Scaffold(
      appBar: CustomAppBarWhiteColor(
          context: context,
          elevation: 0,
          title: 'Redeem MVP',
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
                priController.receiveAccountNumber.value = '';
                priController.receiveAccountname.value = '';
                context.pop();
              })),
      body: Obx(
        () => GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);

            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Column(
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
                          amount: walletController
                                  .mvpBalance.value.mvpAmountFormat ??
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
                              height: 33,
                            ),
                            CustomTextFieldNew(
                              isValidate: priController
                                  .isRedeemToVerifyAccountValidate.value,
                              validateText: priController
                                  .isRedeemToVerifyAccountValidateMessage.value,
                              initialValue:
                                  priController.receiveAccountNumber.value,
                              inputFormatterList: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true, signed: false),
                              isRequired: true,
                              autoFocus: false,
                              labelText: 'Receiver Account Number',
                              hintText: 'Receiver Account Number',
                              onChange: (value) {
                                priController.receiveAccountNumber.value =
                                    value;
                              },
                            ),
                            if (priController
                                    .isRedeemToVerifyAccountValidate.value ==
                                true)
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 20,
                                    bottom: priController
                                                .receiveAccountname.value !=
                                            ''
                                        ? 10
                                        : 0,
                                    right: 20),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if (priController
                                            .receiveAccountname.value !=
                                        '')
                                      SvgPicture.asset(
                                          'assets/images/wallet_found.svg'),
                                    const SizedBox(width: 5),
                                    if (priController
                                            .receiveAccountname.value !=
                                        '')
                                      Text(
                                        priController.receiveAccountname.value,
                                        style: textStyle.copyWith(
                                            fontSize: 12,
                                            color: const Color(0xff4FA30F)),
                                      )
                                  ],
                                ),
                              ),
                            Focus(
                              onFocusChange: (value) {
                                debugPrint("is Validate change:$value");

                                priController.onRedeemToVerifyAccount(context);
                              },
                              child: CustomTextFieldNew(
                                validateText: 'You have not enought MVP',

                                isValidate:
                                    priController.isValidateAmoutToRedeem.value,

                                initialValue:
                                    priController.amountToRedeem.value == 0.0
                                        ? ''
                                        : priController.amountToRedeem.value
                                            .toString(),
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        decimal: true),
                                // controller: _walletController.qrRecievingAmount,
                                inputFormatterList: [
                                  DigitFormatWithDecimal(),
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'^\d+\.?\d{0,2}')),
                                ],
                                onChange: (value) {
                                  if (onConvertToDouble(value) >
                                      walletController
                                          .mvpBalance.value.mvpAmount!) {
                                    priController
                                        .isValidateAmoutToRedeem.value = false;
                                  } else {
                                    priController
                                        .isValidateAmoutToRedeem.value = true;
                                  }
                                  if (value.isEmpty) {
                                    priController.amountToRedeem.value = 0.0;
                                  } else {
                                    priController.amountToRedeem.value =
                                        onConvertToDouble(value);
                                  }
                                },

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
                              initialValue: priController.remark.value,
                              // controller: _walletController.remarkTextController,
                              labelText: 'Remark',
                              hintText: 'Remark',
                              onChange: (value) {
                                priController.remark.value = value;
                              },
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
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 24.0),
                child: CustomButton(
                  width: double.infinity,
                  onPressed: priController.amountToRedeem.value != 0.0
                      ? () async {
                          await priController.onRedeemToMVPReview(context).then(
                              (value) => context.push(
                                  '/privilege/all-store/redeem-point-pay-review'));
                        }
                      : null,
                  title: 'Redeem Now',
                  isDisable:
                      priController.isValidateAmoutToRedeem.value == true &&
                              priController.amountToRedeem.value != 0.0
                          ? false
                          : true,
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
