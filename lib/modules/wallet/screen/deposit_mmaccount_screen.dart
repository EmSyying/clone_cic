import 'dart:io';

import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../Utils/form_builder/custom_button.dart';
import '../../../Utils/helper/custom_appbar.dart';
import '../../../Utils/helper/custom_loading_button.dart';
import '../../../widgets/defualt_size_web.dart';
import '../../../widgets/investments/custom_invest_amount_card.dart';
import '../../../widgets/investments/fif_contract/custom_copy_bank.dart';
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
                                    CustomInvestAmonutCard(
                                      title: 'CiC MM Account',
                                      investAmount: _walletController
                                          .walletAmount.value.balanceFormat,
                                      isColors: true,
                                    ),
                                    //=======
                                    const SizedBox(height: 20),
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          decoration: DottedDecoration(
                                              strokeWidth: 2,
                                              shape: Shape.line,
                                              color: Colors.grey[100]!),
                                        ),
                                        Container(
                                          color: Colors.white,
                                          child: SvgPicture.asset(
                                            'assets/images/svgfile/deposit_arrow_down.svg',
                                            width: 40,
                                            height: 40,
                                          ),
                                        ),
                                      ],
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
                                          Text(
                                            _walletController
                                                .controllerToDepositAmount.text,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline4!
                                                .copyWith(
                                                  fontWeight: FontWeight.w500,
                                                ),
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
                              Positioned(
                                top: 260,
                                left: 6,
                                child: Container(
                                  width: 26,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[50],
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 260,
                                right: 6,
                                child: Container(
                                  width: 26,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[50],
                                    shape: BoxShape.circle,
                                  ),
                                ),
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
                        child: _walletController.isToDeposit.value == true
                            ? const CustomLoadingButton()
                            : CustomButton(
                                title: 'Submit',
                                isDisable: false,
                                isOutline: false,
                                onPressed: () {
                                  _walletController
                                      .onToDepositBankOrWallet(context);
                                  // Navigator.pop(context);
                                },
                              ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
