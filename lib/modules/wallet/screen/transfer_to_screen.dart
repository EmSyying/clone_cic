import 'package:cicgreenloan/utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/utils/form_builder/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../Utils/helper/custom_appbar.dart';
import '../../../utils/helper/digit_decimal_formarter.dart';
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
      body: ListView(
        shrinkWrap: true,
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
                  // keyboardType:
                  //     const TextInputType.numberWithOptions(decimal: true),
                  controller: _walletController.qrRecievingAmount,
                  inputFormatterList: [
                    FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
                    DigitFormatWithDecimal()
                  ],
                  isRequired: true,
                  labelText: 'Amount',
                  hintText: 'Amount',
                  suffixText: 'USD',
                ),
                const CustomTextFieldNew(
                  labelText: 'Remark',
                  hintText: 'Remark',
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),

          ///bottom block
          GestureDetector(
            onTap: () {
              readAgreement = !readAgreement;
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
          onPressed: () {},
          title: 'Process to Pay',
          isDisable: _validateButton(),
          isOutline: false,
        ),
      ),
    );
  }

  bool readAgreement = false;

  bool _validateButton() {
    return true;
  }

  Widget _tickIcon(bool select, {double? width, Color? color}) => select
      ? SvgPicture.asset('assets/images/svgfile/circle_check-selected.svg',
          width: width, color: color)
      : SvgPicture.asset(
          'assets/images/svgfile/cicle_check.svg',
          width: width,
          color: Colors.grey,
        );
}
