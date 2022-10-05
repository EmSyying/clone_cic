import 'package:cicgreenloan/modules/wallet/screen/custom_keyboard.dart';
import 'package:cicgreenloan/modules/wallet/screen/deposit_mmaccount_screen.dart';
import 'package:cicgreenloan/utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/utils/helper/color.dart';
import 'package:cicgreenloan/utils/helper/custom_route_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Utils/helper/custom_appbar.dart';
import '../../../Utils/helper/custom_loading_button.dart';

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
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: WalletTotalCard(
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
                  GetBuilder<WalletController>(
                    init: WalletController(),
                    builder: (controller) => TextFormField(
                      readOnly: true,
                      controller:
                          _walletController.controllerToDepositAmount.value,
                      showCursor: false,
                      style: textStyle.copyWith(fontSize: 46),
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
                  ),
                  const Spacer(),
                  CustomKeyboard(onChanged: _walletController.onchageKeyboard),
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
                                          .controllerToDepositAmount
                                          .value
                                          .text !=
                                      ''
                                  ? () {
                                      var number = double.tryParse(
                                          _walletController
                                              .controllerToDepositAmount
                                              .value
                                              .text);

                                      if (number != null && number > 0) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const MMAcountDepositScreen(),
                                          ),
                                        );
                                      } else {
                                        customRouterSnackbar(
                                            description:
                                                'Please Enter Amount to continue');
                                      }

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
