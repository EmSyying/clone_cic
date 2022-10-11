import 'dart:io';

import 'package:cicgreenloan/widgets/investments/slide_button.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../Utils/helper/custom_appbar.dart';
import '../../../widgets/defualt_size_web.dart';
import '../../../widgets/investments/fif_contract/custom_copy_bank.dart';
import '../../../widgets/mmaccount/wallet_total_amount_card.dart';
import '../../../widgets/wallets/custom_cash_out_and_transfer_amount_mma.dart';
import '../../../widgets/wallets/custom_positioned_boxshape_circle.dart';
import '../../../widgets/wallets/custom_stack_dotted_decoration.dart';
import '../../investment_module/controller/investment_controller.dart';
import '../controller/wallet_controller.dart';

class MMAcountDepositScreen extends StatefulWidget {
  final int? id;
  const MMAcountDepositScreen({Key? key, this.id}) : super(key: key);

  @override
  State<MMAcountDepositScreen> createState() => _MMAcountDepositScreenState();
}

class _MMAcountDepositScreenState extends State<MMAcountDepositScreen> {
  final fifController = Get.put(PriceController());
  final _walletController = Get.put(WalletController());
  @override
  void initState() {
    fifController.fetchFiFBank();
    if (widget.id != null) {
      fifController.fetchConfirmDetail(widget.id);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DefaultSizeWeb(
        child: Scaffold(
          appBar: CustomAppBar(
            context: context,
            title: 'CiC MM account',
            leading: IconButton(
              icon: Platform.isIOS
                  ? const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    )
                  : const Icon(
                      Icons.arrow_back,
                    ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: fifController.isLoadingDetailAcc.value
              ? const LinearProgressIndicator()
              : Obx(
                  () => Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Stack(
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.05),
                                        spreadRadius: 0.1,
                                        offset: const Offset(0, 2),
                                        blurRadius: 8),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20.0),
                                      child: WalletTotalCard(
                                        amount: _walletController
                                            .walletAmount.value.balanceFormat,
                                      ),
                                    ),

                                    //=======Border StackDottedDecoratio=====
                                    const SizedBox(height: 20),
                                    const CustomStackDottedDecoration(
                                      assetName:
                                          'assets/images/svgfile/deposit_arrow_down.svg',
                                    ),

                                    Container(
                                      margin: const EdgeInsets.only(
                                        bottom: 10.0,
                                        top: 20.0,
                                      ),
                                      child: Column(
                                        children: [
                                          Text(
                                            'Amount To Deposit',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline2!
                                                .copyWith(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12.0,
                                                ),
                                          ),
                                          const SizedBox(
                                            height: 10.0,
                                          ),
                                          //Amount to Deposit=====
                                          CustomCashOutAndTransferAmount(
                                            amountCashOutTransfer:
                                                '${_walletController.controllerToDepositAmount.value.text.toCiCNumber()} ',
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    Container(
                                      decoration: DottedDecoration(
                                          strokeWidth: 2,
                                          shape: Shape.line,
                                          color: const Color(0xffDBDBDB)),
                                    ),
                                    const SizedBox(height: 20),

                                    ///========
                                    Column(
                                      children: fifController.withdrawBankList
                                          .asMap()
                                          .entries
                                          .map((e) {
                                        return CustomCopyBank(
                                            imgUrl: e.value.image,
                                            bankName: e.value.bankName,
                                            accountNumber:
                                                e.value.accountNumber,
                                            accountName: e.value.accountName);
                                      }).toList(),
                                    ),
                                  ],
                                ),
                              ),
                              //PositionedBoxShapCircle =shap border=====
                              const CustomPositionedBoxShapCircle(
                                top: 280,
                                left: 6,
                              ),
                              const CustomPositionedBoxShapCircle(
                                top: 280,
                                right: 6,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SafeArea(
                          top: false,
                          minimum: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          child: SlideButton(
                            callback: () {
                              _walletController
                                  .onToDepositBankOrWallet(context);
                            },
                          )
                          // _walletController.isToDeposit.value == true
                          //     ? const CustomLoadingButton()
                          //     : CustomButton(
                          //         title: 'Submit',
                          //         isDisable: false,
                          //         isOutline: false,
                          //         onPressed: () {
                          //           _walletController
                          //               .onToDepositBankOrWallet(context);
                          //           // Navigator.pop(context);
                          //         },
                          //       ),
                          ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

extension CiCAmount on String {
  static final numberFormat = NumberFormat("#,##0.00", "en_US");
  String toCiCNumber() {
    var numb = double.tryParse(this);
    if (numb != null) {
      return numberFormat.format(numb);
    } else {
      debugPrint('here');
      return this;
    }
  }
}
