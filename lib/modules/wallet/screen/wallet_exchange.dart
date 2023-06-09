import 'package:cicgreenloan/Utils/function/format_to_k.dart';
import 'package:cicgreenloan/Utils/helper/texfield_format_currency/decimal_textinput_format.dart';
import 'package:cicgreenloan/utils/helper/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../Utils/form_builder/custom_textformfield.dart';
import '../../../Utils/helper/texfield_format_currency/format_value_onchange.dart';
import '../../../widgets/privilege/custom_card_current_point.dart';
import '../../privilege_program/screen/privilege_point/privilege_point_screen.dart';
import '../../setting_modules/screens/sub_setting_screen/contract_terms.dart';
import '../controller/wallet_controller.dart';
import '../../../widgets/investments/slide_button.dart';

class WalletExchange extends StatelessWidget {
  final bool? isHide;
  WalletExchange({super.key, this.isHide = false});
  final _walletController = Get.put(WalletController());

  @override
  Widget build(BuildContext context) {
    _walletController.onFetchMyPoin();
    final textstyle = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        titleTextStyle: Theme.of(context).textTheme.titleLarge,
        centerTitle: true,
        title: const Text("Get MVP"),
        actions: [
          if (isHide == false)
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PrivilegePointScreen(),
                  ),
                );

                // context.push('/privilege/all-store/point-screen');
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: SvgPicture.asset(
                          "assets/images/svgfile/Union.svg",
                          width: 20.0,
                          height: 24.0,
                        ),
                      ),
                    ),
                    Positioned(
                      // left: 0.0,
                      //right: 0.0,
                      // _walletController.myPoint.value >= 999 ? 5.0 : 12.0,
                      top: 5.0,
                      child: Obx(
                        () => Container(
                          decoration: BoxDecoration(
                            color: Colors.red[400],
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                          height: 14,
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 3.0, right: 3.0),
                              child: Text(
                                FormatToK.convertNumber(_walletController
                                        .mvpBalance.value.mvpAmount ??
                                    0.0),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 9),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
        ],
      ),
      body: Obx(
        () => Stack(
          children: [
            GestureDetector(
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);

                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20.0),
                    child: CardCurrentPoints(
                      title: 'Available Balance',
                      amount: _walletController.fetchWalletLoading.value == true
                          ? '--'
                          : _walletController
                                  .walletAmount.value.wallet?.balanceFormat
                                  .toString() ??
                              '0.00',
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
                      child: ListView(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Amount MVP to Get',
                                      style: textstyle.titleSmall?.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SvgPicture.asset(
                                      'assets/images/demo.svg',
                                      color: Colors.grey,
                                      // color: const Color(0xfff2f2f2),
                                    ),
                                  ],
                                ),
                              ),
                              CustomTextFieldNew(
                                controller: _walletController
                                    .pointAmountController.value,
                                isValidate:
                                    _walletController.isExchangeValidate.value,
                                validateText: _walletController
                                    .exChangeValidateMessage.value,
                                initialValue: _walletController
                                    .pointAmountController.value.text,
                                isRequired: true,
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        decimal: true),
                                inputFormatterList: [
                                  DecimalTextInputFormatter(decimalRange: 2)
                                ],
                                onChange: (value) {
                                  formatValueOnchange(
                                      maxLength: 15,
                                      value: value,
                                      controller: _walletController
                                          .pointAmountController.value);
                                  _walletController.update();
                                  _walletController.pointAmountController
                                      .refresh();
                                  // _walletController
                                  //     .inputAmountField(value);
                                  // _walletController.pointAmountController
                                  //     .value.text = value;
                                },
                                labelText: 'Amount',
                                hintText: 'Amount',
                                suffixText: 'USD',
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                child: Text(
                                  '1\$ = 1 MVP',
                                  style: textstyle.titleSmall?.copyWith(
                                      color: const Color(0xffbdbdbd),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 30),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    const Divider(
                                      thickness: 1,
                                      color: Color(0xffbdbdbd),
                                    ),
                                    Container(
                                      width: 41,
                                      height: 41,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                            color: const Color(0xffbdbdbd),
                                          ),
                                          shape: BoxShape.circle),
                                      alignment: Alignment.center,
                                      child: SvgPicture.asset(
                                        'assets/images/wallet/wallet_exchange.svg',
                                        height: 21,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              CustomTextFieldNew(
                                initialValue: _walletController
                                    .pointAmountController.value.text,
                                controller: _walletController
                                    .pointAmountController.value,
                                enable: false,
                                isReadOnly: true,
                                labelText: 'MVP Amount',
                                hintText: 'MVP Amount',
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: Text(
                                    'MVP',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(color: Colors.black38),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.white,
                child: SafeArea(
                  top: false,
                  left: false,
                  right: false,
                  minimum:
                      const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SlideButton(
                        callback: _walletController
                                .pointAmountController.value.text.isEmpty
                            ? null
                            : () async {
                                await _walletController.onExchange(context);
                              },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10.0,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'By submitting you agree to',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            GestureDetector(
                              onTap: () {
                                debugPrint("Press to exchange");
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ContractTerm(
                                      fromPage: 'exchange',
                                    ),
                                  ),
                                );
                                // context.push(
                                //     '/service-agreement?fromPage=exchange');
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Text(
                                  'CiC Service Agreement',
                                  style: textstyle.displaySmall!.copyWith(
                                      color: AppColor.mainColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
