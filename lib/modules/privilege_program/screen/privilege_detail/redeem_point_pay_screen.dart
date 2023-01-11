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

class RedeemPointToPay extends StatelessWidget {
  const RedeemPointToPay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.subtitle2!;
    final walletController = Get.put(WalletController());
    return Scaffold(
      appBar: CustomAppBarWhiteColor(
        context: context,
        elevation: 0,
        title: 'Redeem MVP',
        colorTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
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
                          onEditingComplete: () {},
                          onFieldSubmitted: (_) {},
                          initialValue: walletController.qrRecievingPhone.text,
                          inputFormatterList: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true, signed: false),
                          // focusScope: _phoneNumberFocus,
                          // controller: _walletController.qrRecievingPhone,
                          isRequired: true,
                          autoFocus: false,
                          labelText: 'Receiver Phone Number',
                          hintText: 'Receiver Phone Number',
                        ),
                        // _walletController.validateMessage.value.isNotEmpty &&
                        //         _walletController.qrRecievingPhone.text != ""
                        //?
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, bottom: 10, right: 20),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // _walletController.userFound.value
                              // ?
                              SvgPicture.asset(
                                  'assets/images/wallet_found.svg'),
                              // : const Icon(
                              //     CupertinoIcons
                              //         .exclamationmark_circle_fill,
                              //     color: AppColor.primaryColor,
                              //   ),
                              const SizedBox(width: 5),
                              Text(
                                // _walletController.validateMessage.value,
                                'Kim Oan',
                                style: textStyle.copyWith(
                                    color:
                                        //_walletController.userFound.value
                                        // ?
                                        const Color(0xff4FA30F)
                                    //: AppColor.primaryColor,
                                    ),
                              )
                            ],
                          ),
                        ),
                        //  : const SizedBox.shrink(),

                        CustomTextFieldNew(
                          initialValue: walletController.qrRecievingAmount.text,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          // controller: _walletController.qrRecievingAmount,
                          inputFormatterList: [
                            DigitFormatWithDecimal(),
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d+\.?\d{0,2}')),
                          ],
                          onChange: (value) {
                            // setState(() {});
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
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
            child: CustomButton(
              width: double.infinity,
              onPressed: () {
                context.push(
                    '/profile/setting/privilege/all-store/redeem-point-pay-review');

                // _walletController.checkValidateAccount().then((value) {
                //   if (_walletController.userFound.value) {
                //     context.push(
                //         '/wallet/transfer-to-other-mmacount/review-transfer');
                //   }
                // });
              },
              title: 'Proceed to pay',
              isDisable:
                  //  _walletController.qrRecievingPhone.text.isNotEmpty &&
                  //         _walletController.qrRecievingAmount.text.isNotEmpty &&
                  //         double.tryParse(_walletController.qrRecievingAmount.text
                  //                 .clean())! <
                  //             _walletController
                  //                 .walletAmount.value.wallet!.balance! &&
                  //         _walletController.userFound.value
                  // ? false
                  false,
              isOutline: false,
            ),
          ),
        ],
      ),
    );
  }
}
