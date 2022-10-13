import 'package:cicgreenloan/modules/wallet/screen/transfer_review.dart';
import 'package:cicgreenloan/utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/utils/form_builder/custom_textformfield.dart';
import 'package:cicgreenloan/utils/helper/extension/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../Utils/helper/custom_appbar.dart';
import '../../../widgets/mmaccount/wallet_total_amount_card.dart';
import '../../qr_code/qr_code.dart';
import '../controller/wallet_controller.dart';

class TransferToMMA extends StatefulWidget {
  const TransferToMMA({Key? key}) : super(key: key);

  @override
  State<TransferToMMA> createState() => _TransferToMMAState();
}

class _TransferToMMAState extends State<TransferToMMA> {
  final _walletController = Get.put(WalletController());
  final _phoneNumberFocus = FocusNode();

  @override
  void dispose() {
    _walletController.clearMMATransfer();
    super.dispose();
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: WalletTotalCard(
              amount:
                  _walletController.walletAmount.value.wallet!.balanceFormat,
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
              children: [
                CustomTextFieldNew(
                  initialValue: _walletController.qrRecievingPhone.text,
                  inputFormatterList: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: const TextInputType.numberWithOptions(
                      decimal: true, signed: false),
                  focusScope: _phoneNumberFocus,
                  controller: _walletController.qrRecievingPhone,
                  isRequired: true,
                  autoFocus: false,
                  labelText: 'Receiver Phone Number',
                  hintText: 'Receiver Phone Number',
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
                                    builder: (context) => const Material(
                                      child: QrCodeScreen(
                                        pageName: 'transfer',
                                      ),
                                    ),
                                  )).then((value) {
                                _phoneNumberFocus.unfocus();
                              });
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
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
                CustomTextFieldNew(
                  initialValue: _walletController.qrRecievingAmount.text,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  controller: _walletController.qrRecievingAmount,
                  inputFormatterList: [
                    FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
                    TextInputFormatter.withFunction((oldValue, newValue) {
                      double? number = double.tryParse(newValue.text);
                      if (number != null) {
                        debugPrint('New');
                        return newValue.copyWith(
                            text: newValue.text.asInput(),
                            selection: TextSelection.collapsed(
                                offset: newValue.text.asInput().length));
                      } else if (newValue.text.isEmpty) {
                        return const TextEditingValue();
                      } else {
                        debugPrint('Old');
                        return oldValue;
                      }
                      // try {
                      //   final text = newValue.text;
                      //   if (text.isNotEmpty) double.parse(text);
                      //   debugPrint('ERROR');
                      //   return newValue;
                      // } catch (e) {
                      //   return oldValue;
                      // }
                    }),
                  ],
                  isRequired: true,
                  labelText: 'Amount',
                  hintText: 'Amount',
                  suffixText: 'USD',
                ),
                CustomTextFieldNew(
                  initialValue: _walletController.remarkTextController.text,
                  controller: _walletController.remarkTextController,
                  labelText: 'Remark',
                  hintText: 'Remark',
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              readAgreement = !readAgreement;
              debugPrint(
                  '${_walletController.qrRecievingAmount.text.isNotEmpty}');
              setState(() {});
            },
            child: Container(
              padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      _tickIcon(readAgreement),
                      const SizedBox(width: 20),
                      Text(
                        'I have read  and agree to CiC serivce agreement',
                        style: textStyle.copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: const Color(0XFF464646)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        minimum: const EdgeInsets.all(20),
        child: CustomButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TransferReview(),
                ));
          },
          title: 'Process to Pay',
          isDisable: readAgreement &&
                  _walletController.qrRecievingPhone.text.isNotEmpty &&
                  _walletController.qrRecievingAmount.text.isNotEmpty &&
                  double.tryParse(
                          _walletController.qrRecievingAmount.text.clean())! <
                      _walletController.walletAmount.value.wallet!.balance!
              ? false
              : true,
          isOutline: false,
        ),
      ),
    );
  }

  bool readAgreement = false;

  // bool _validateButton() => ;

  Widget _tickIcon(bool select, {double? width, Color? color}) => select
      ? SvgPicture.asset('assets/images/svgfile/circle_check-selected.svg',
          width: width, color: color)
      : SvgPicture.asset(
          'assets/images/svgfile/cicle_check.svg',
          width: width,
          color: Colors.grey,
        );
}
