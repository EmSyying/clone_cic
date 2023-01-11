import 'package:cicgreenloan/Utils/function/convert_to_double.dart';
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
  const RedeemPointToPay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.subtitle2!;
    final walletController = Get.put(WalletController());
    final priController = Get.put(PrivilegeController());
    return Scaffold(
      appBar: CustomAppBarWhiteColor(
        context: context,
        elevation: 0,
        title: 'Redeem MVP',
        colorTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
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
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20.0),
                        child: CardCurrentPoints(),
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
                              labelText: 'Receiver Phone Number',
                              hintText: 'Receiver Phone Number',
                              onChange: (value) {
                                priController.receiveAccountNumber.value =
                                    value;
                              },
                            ),
                            if (priController
                                    .isRedeemToVerifyAccountValidate.value ==
                                true)
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, bottom: 10, right: 20),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SvgPicture.asset(
                                        'assets/images/wallet_found.svg'),
                                    const SizedBox(width: 5),
                                    Text(
                                      priController.receiveAccountname.value,
                                      style: textStyle.copyWith(
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
                                  priController.amountToRedeem.value =
                                      onConvertToDouble(value);
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
                                        .subtitle1!
                                        .copyWith(color: Colors.grey),
                                  ),
                                ),
                              ),
                            ),
                            CustomTextFieldNew(
                              initialValue:
                                  walletController.remarkTextController.text,
                              // controller: _walletController.remarkTextController,
                              labelText: 'Remark',
                              hintText: 'Remark',
                            ),
                            const SizedBox(height: 20),
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
                    horizontal: 20.0, vertical: 30.0),
                child: CustomButton(
                  width: double.infinity,
                  onPressed: () async {
                    await priController.onRedeemToMVPReview(context).then(
                        (value) => context.push(
                            '/profile/setting/privilege/all-store/redeem-point-pay-review'));
                  },
                  title: 'Proceed to pay',
                  isDisable: false,
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
