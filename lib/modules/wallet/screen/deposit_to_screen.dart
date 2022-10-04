import 'package:cicgreenloan/modules/wallet/screen/custom_keyboard.dart';
import 'package:cicgreenloan/modules/wallet/screen/deposit_mmaccount_screen.dart';
import 'package:cicgreenloan/utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/utils/helper/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../Utils/helper/custom_appbar.dart';
import '../../../Utils/helper/custom_loading_button.dart';
import '../../../Utils/helper/numerice_format.dart';

import '../../../widgets/mmaccount/wallet_total_amount_card.dart';
import '../controller/wallet_controller.dart';

class DepositToScreen extends StatefulWidget {
  const DepositToScreen({Key? key}) : super(key: key);

  @override
  State<DepositToScreen> createState() => _DepositToScreenState();
}

class _DepositToScreenState extends State<DepositToScreen> {
  final _walletController = Get.put(WalletController());
  final frm = NumberFormat('#,###.00', 'en');

  @override
  void dispose() {
    _walletController.clearDepositAmount();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headline2!;
    return Scaffold(
      backgroundColor: const Color(0xfffafafa),
      appBar: CustomAppBar(
        elevation: 0,
        isLeading: true,
        context: context,
        title: "To Deposit via banks",
      ),
      body: Column(
        children: [
          Obx(
            () => WalletTotalCard(
              amount: _walletController.walletAmount.value.balanceFormat,
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
                children: [
                  const SizedBox(height: 30),
                  Text(
                    'Enter Deposit Amount',
                    style: textStyle.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  TextFormField(
                    controller: _walletController.controllerToDepositAmount,
                    showCursor: false,
                    style: textStyle.copyWith(fontSize: 46),
                    inputFormatters: [
                      //FilteringTextInputFormatter.digitsOnly,
                      NumericTextFormatter(),
                    ],
                    textAlign: TextAlign.center,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      hintText: '0.00',
                      hintStyle: textStyle.copyWith(
                          fontSize: 46, color: AppColor.chartLabelColor),
                      border: InputBorder.none,
                    ),
                  ),
                  const Spacer(),
                  CustomKeyboard(
                    onChanged: (value) {
                      debugPrint(value);
                      setState(() {
                        if (value.isNotEmpty) {
                          _walletController.controllerToDepositAmount =
                              TextEditingController(
                                  text: frm.parse(value).toString());
                        } else {
                          _walletController.controllerToDepositAmount =
                              TextEditingController(text: null);
                        }
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  SafeArea(
                    top: false,
                    minimum: const EdgeInsets.all(20),
                    child: Obx(
                      () => _walletController.isToDeposit.value
                          ? const CustomLoadingButton()
                          : CustomButton(
                              title: 'Next',
                              onPressed: _walletController
                                          .controllerToDepositAmount.text !=
                                      ''
                                  ? () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const MMAcountDepositScreen(),
                                        ),
                                      );
                                      // _walletController
                                      //     .onToDepositBankOrWallet(context);
                                    }
                                  : null,
                              isDisable: false,
                              isOutline: false,
                            ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
