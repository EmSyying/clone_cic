import 'package:cicgreenloan/modules/wallet/screen/custom_keyboard.dart';
import 'package:cicgreenloan/utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/utils/helper/extension/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../Utils/helper/color.dart';
import '../../../Utils/helper/custom_appbar.dart';

import '../../../widgets/mmaccount/wallet_total_amount_card.dart';
import '../controller/wallet_controller.dart';

class DepositToScreen extends StatefulWidget {
  const DepositToScreen({Key? key}) : super(key: key);

  @override
  State<DepositToScreen> createState() => _DepositToScreenState();
}

class _DepositToScreenState extends State<DepositToScreen> {
  final _walletController = Get.put(WalletController());

  @override
  void dispose() {
    _walletController.clearDepositAmount();
    super.dispose();
  }

  @override
  void initState() {
    _walletController.fetchWalletAmount();
    super.initState();
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
      body: Obx(
        () => Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: WalletTotalCard(
                amount:
                    _walletController.walletAmount.value.wallet!.balanceFormat,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(height: 30),
                    Text(
                      'Enter Deposit Amount',
                      style: textStyle.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: _walletController.depositAmount.value != ''
                          ? Text(
                              _walletController.depositAmount.value.asInput(),
                              style: textStyle.copyWith(fontSize: 46),
                            )
                          : _buildZeroAmount(textStyle),
                    ),

                    // const Spacer(),
                    CustomKeyboard(
                        onChanged: _walletController.onchageKeyboard),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: ColoredBox(
        color: Colors.white,
        child: SafeArea(
            top: false,
            minimum: const EdgeInsets.all(20),
            child: Obx(
              () => CustomButton(
                title: 'Next',
                onPressed: _validateButton()
                    ? () {
                        context.push(
                            '/wallet/deposit-card/deposit-to-screen/mmaccount-deposit-screen');
                      }
                    : null,
                isDisable: !_validateButton(),
                isOutline: false,
              ),
            )),
      ),
    );
  }

  Widget _buildZeroAmount(TextStyle textStyle) => Text(
        '0.00',
        style:
            textStyle.copyWith(fontSize: 46, color: AppColor.chartLabelColor),
      );

  bool _validateButton() {
    double? amount = double.tryParse(_walletController.depositAmount.value);

    if (amount != null && amount > 0) {
      //Amount must not empty and bigger than zero
      return true;
    }
    return false;
  }
}
