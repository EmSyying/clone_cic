import 'package:cicgreenloan/utils/helper/color.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../Utils/form_builder/custom_textformfield.dart';
import '../../../utils/helper/numerice_format.dart';
import '../../../utils/offline_widget.dart';
import '../../../widgets/investments/slide_button.dart';
import '../../../widgets/mmaccount/wallet_total_amount_card.dart';
import '../../privilege_program/screen/privilege_point/privilege_point_screen.dart';
import '../../setting_modules/screens/sub_setting_screen/contract_terms.dart';
import '../controller/wallet_controller.dart';

class WalletExchange extends StatelessWidget {
  WalletExchange({super.key});
  final _walletController = Get.put(WalletController());

  @override
  Widget build(BuildContext context) {
    _walletController.onFetchMyPoin();
    final textstyle = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        titleTextStyle: Theme.of(context).textTheme.headline6,
        centerTitle: true,
        title: const Text("Exchange"),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PrivilegePointScreen()));

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
                              _walletController
                                      .mvpBalance.value.mvpAmountFormat ??
                                  "0.00",
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
      body: ConnectivityWidgetWrapper(
        stacked: false,
        alignment: Alignment.bottomCenter,
        offlineWidget: Column(
          children: const [
            Expanded(
              child: OfflineWidget(),
            ),
          ],
        ),
        child: Obx(
          (() => Stack(
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
                          padding: const EdgeInsets.all(20.0),
                          child: WalletTotalCard(
                            amount:
                                _walletController.fetchWalletLoading.value ==
                                        true
                                    ? '--'
                                    : _walletController.walletAmount.value
                                        .wallet?.balanceFormat,
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
                                            'Amount to Exchange',
                                            style: textstyle.subtitle2
                                                ?.copyWith(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w700),
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
                                      isValidate: _walletController
                                          .isExchangeValidate.value,
                                      validateText: _walletController
                                          .exChangeValidateMessage.value,
                                      initialValue: _walletController
                                          .inputAmountField.value,
                                      isRequired: true,
                                      keyboardType:
                                          const TextInputType.numberWithOptions(
                                              decimal: true),
                                      inputFormatterList: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        NumericTextFormatter(),
                                        FilteringTextInputFormatter.deny(
                                            RegExp(r'^0+')),
                                      ],
                                      onChange: (value) {
                                        _walletController
                                            .inputAmountField(value);
                                        _walletController.pointAmountController
                                            .value.text = value;
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
                                        style: textstyle.subtitle2?.copyWith(
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
                                                  color:
                                                      const Color(0xffbdbdbd),
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
                                              .subtitle1!
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
                        minimum: const EdgeInsets.only(
                            bottom: 20, left: 20, right: 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Obx(
                              () => SlideButton(
                                callback: _walletController
                                        .inputAmountField.value.isEmpty
                                    ? null
                                    : () async {
                                        await _walletController
                                            .onExchange(context);
                                      },
                              ),
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
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      debugPrint("Press to exchange");
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const ContractTerm(
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
                                        style: textstyle.headline3!.copyWith(
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
              )),
        ),
      ),
    );
  }
}
