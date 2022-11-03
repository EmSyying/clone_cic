import 'package:cicgreenloan/utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/utils/form_builder/custom_textformfield.dart';
import 'package:cicgreenloan/utils/helper/color.dart';
import 'package:cicgreenloan/utils/helper/extension/string_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../Utils/helper/custom_appbar.dart';
import '../../../utils/helper/digit_decimal_formarter.dart';
import '../../../widgets/mmaccount/wallet_total_amount_card.dart';
import '../../qr_code/qr_code.dart';
import '../controller/wallet_controller.dart';

class TransferToMMA extends StatefulWidget {
  final String? receiverAccount;
  final String? receiverAmount;

  const TransferToMMA({
    Key? key,
    this.receiverAccount,
    this.receiverAmount,
  }) : super(key: key);

  @override
  State<TransferToMMA> createState() => _TransferToMMAState();
}

class _TransferToMMAState extends State<TransferToMMA> {
  final _walletController = Get.put(WalletController());
  final _phoneNumberFocus = FocusNode();

  @override
  void dispose() {
    _walletController.clearMMATransfer();
    _phoneNumberFocus.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _walletController.fetchWalletAmount();
    if (widget.receiverAccount != null && widget.receiverAccount!.isNotEmpty) {
      _walletController.fetchWalletAmount();
      _walletController.qrRecievingPhone.text = widget.receiverAccount!;
      _walletController.qrRecievingAmount.text = widget.receiverAmount!;

      _walletController.checkValidateAccount();
    }
    _phoneNumberFocus.addListener(() {
      if (!_phoneNumberFocus.hasFocus) {
        _walletController.checkValidateAccount();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.subtitle2!;
    return Scaffold(
      appBar: CustomAppBar(
          elevation: 0,
          isLeading: true,
          context: context,
          title: "MM Account Transfer",
          isCallonPressed: true,
          onPressed: () async {
            Navigator.pop(context);
            debugPrint('cashout======');
          }),
      body: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: WalletTotalCard(
                        amount:
                            _walletController.fetchWalletLoading.value == true
                                ? '--'
                                : _walletController
                                    .walletAmount.value.wallet!.balanceFormat,
                      ),
                    ),

                    ///middle block
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
                          CustomTextFieldNew(
                            onEditingComplete: () {
                              _walletController.checkValidateAccount();
                            },
                            onFieldSubmitted: (_) {
                              _walletController.checkValidateAccount();
                            },
                            initialValue:
                                _walletController.qrRecievingPhone.text,
                            inputFormatterList: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true, signed: false),
                            focusScope: _phoneNumberFocus,
                            controller: _walletController.qrRecievingPhone,
                            isRequired: true,
                            autoFocus: false,
                            labelText: 'Receiver Account Number',
                            hintText: 'Receiver Account Number',
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IntrinsicHeight(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const VerticalDivider(
                                      thickness: 1,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const Material(
                                                child: QrCodeScreen(
                                                  pageName: 'transfer',
                                                ),
                                              ),
                                            )).then((value) {
                                          _phoneNumberFocus.unfocus();
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: SvgPicture.asset(
                                          'assets/images/svgfile/qr_s.svg',
                                          height: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          _walletController.validateMessage.value.isNotEmpty &&
                                  _walletController.qrRecievingPhone.text != ""
                              ? Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, bottom: 5, right: 20),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      _walletController.userFound.value
                                          ? SvgPicture.asset(
                                              'assets/images/wallet_found.svg')
                                          : const Icon(
                                              CupertinoIcons
                                                  .exclamationmark_circle_fill,
                                              color: AppColor.primaryColor,
                                            ),
                                      const SizedBox(width: 5),
                                      Text(
                                        _walletController.validateMessage.value,
                                        style: textStyle.copyWith(
                                          color:
                                              _walletController.userFound.value
                                                  ? const Color(0xff4FA30F)
                                                  : AppColor.primaryColor,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              : const SizedBox.shrink(),
                          CustomTextFieldNew(
                            initialValue:
                                _walletController.qrRecievingAmount.text,
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            controller: _walletController.qrRecievingAmount,
                            inputFormatterList: [
                              // FilteringTextInputFormatter.allow(
                              //     RegExp(r'^\d+\.?\d{0,2}')),

                              // ThousandsFormatter(allowFraction: true)
                              // FilteringTextInputFormatter.allow(
                              //     RegExp(r"[0-9.,]")),
                              DigitFormatWithDecimal(),
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'^\d+\.?\d{0,2}')), //all ow 2 decimal
                              // FilteringTextInputFormatter.allow(
                              //     RegExp(r"[0-9.]")),
                              // TextInputFormatter.withFunction(
                              //     (oldValue, newValue) {
                              //   double? number = double.tryParse(newValue.text);
                              //   if (number != null) {
                              //     debugPrint('New');
                              //     return newValue.copyWith(
                              //         text: newValue.text.asInput(),
                              //         selection: TextSelection.collapsed(
                              //             offset:
                              //                 newValue.text.asInput().length));
                              //   } else if (newValue.text.isEmpty) {
                              //     return const TextEditingValue();
                              //   } else {
                              //     debugPrint('Old');
                              //     return oldValue;
                              //   }

                              // }),
                            ],
                            onChange: (value) {
                              setState(() {});
                            },
                            isRequired: true,
                            labelText: 'Amount',
                            hintText: 'Amount',
                            suffixText: 'USD',
                          ),
                          CustomTextFieldNew(
                            initialValue:
                                _walletController.remarkTextController.text,
                            controller: _walletController.remarkTextController,
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
            // GestureDetector(
            //   onTap: () {
            //     readAgreement = !readAgreement;
            //     debugPrint(
            //         '${_walletController.qrRecievingAmount.text.isNotEmpty}');
            //     setState(() {});
            //   },
            //   child: Container(
            //     padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
            //     child: Column(
            //       children: [
            //         Row(
            //           children: [
            //             _tickIcon(readAgreement),
            //             const SizedBox(width: 20),
            //             Text(
            //               'I have read and agreed to CiC service agreement',
            //               style: textStyle.copyWith(
            //                   fontSize: 13,
            //                   fontWeight: FontWeight.w400,
            //                   color: const Color(0XFF464646)),
            //             ),
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 20, bottom: 30),
              child: CustomButton(
                width: double.infinity,
                onPressed: () {
                  _walletController.checkValidateAccount().then((value) {
                    if (_walletController.userFound.value) {
                      context.push(
                          '/wallet/transfer-to-other-mmacount/review-transfer');
                    }
                  });
                },
                title: 'Proceed to pay',
                isDisable: _walletController.qrRecievingPhone.text.isNotEmpty &&
                        _walletController.qrRecievingAmount.text.isNotEmpty &&
                        double.tryParse(_walletController.qrRecievingAmount.text
                                .clean())! <
                            _walletController
                                .walletAmount.value.wallet!.balance! &&
                        _walletController.userFound.value
                    ? false
                    : true,
                isOutline: false,
              ),
            ),
          ],
        ),
      ),
    );
  }

  //bool readAgreement = false;

  // bool _validateButton() => ;

  // Widget _tickIcon(bool select, {double? width, Color? color}) => select
  //     ? SvgPicture.asset('assets/images/svgfile/circle_check-selected.svg',
  //         width: width, color: color)
  //     : SvgPicture.asset(
  //         'assets/images/svgfile/cicle_check.svg',
  //         width: width,
  //         color: Colors.grey,
  //       );
}
