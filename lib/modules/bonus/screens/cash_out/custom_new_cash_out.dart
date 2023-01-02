import 'package:cicgreenloan/modules/bonus/screens/cash_out/custom_change_account_bank.dart';

import 'package:cicgreenloan/widgets/custom_showbottomsheet.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../Utils/app_settings/controllers/appsetting_controller.dart';
import '../../../../Utils/form_builder/custom_button.dart';
import '../../../../Utils/form_builder/custom_textformfield.dart';
import '../../../../Utils/function/convert_to_double.dart';
import '../../../../Utils/helper/container_partern.dart';

import '../../../../utils/form_builder/custom_drop_down.dart';
import '../../../../utils/form_builder/dropdow_item.dart';
import '../../../../utils/helper/digit_decimal_formarter.dart';
import '../../../../widgets/mmaccount/wallet_total_amount_card.dart';
import '../../../member_directory/controllers/customer_controller.dart';
import '../../../wallet/controller/wallet_controller.dart';
import '../../../wallet/screen/review_mma_transfer_screen.dart';
import '../../controllers/bonus_controller.dart';

// ignore: must_be_immutable
class CustomNewCashOut extends StatelessWidget {
  CustomNewCashOut({Key? key}) : super(key: key);
  final newCashOutCon = Get.put(BonusController());
  final _walletController = Get.put(WalletController());
  final userCon = Get.put(CustomerController());
  String cashoutDate = DateTime.now().toString();
  DateFormat? dateFormat = DateFormat("HH:mm a");
  bool isValidate(BuildContext context) {
    if (newCashOutCon.cashoutAmount.value <
                newCashOutCon.bonusSetting.value.minimumCashOutAmount! &&
            newCashOutCon.bonusSetting.value.isCicTeam == false ||
        newCashOutCon.cashoutAmount.value == 0.0) {
      newCashOutCon.isValidateCashoutAmount.value = false;
    } else {
      newCashOutCon.isValidateCashoutAmount.value = true;
    }
    if (newCashOutCon.bankName.value == "") {
      newCashOutCon.isVailidateBankName.value = false;
    } else {
      newCashOutCon.isVailidateBankName.value = true;
    }

    if (newCashOutCon.cashoutAmount.value != 0.0 &&
        newCashOutCon.bankName.value != "" &&
        newCashOutCon.cashoutAmount.value <=
            _walletController.walletAmount.value.wallet!.balance!) {
      newCashOutCon.onCashout(context);
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    // _walletController.fetchWalletAmount();
    // newCashOutCon.fetchbonusSetting();
    // newCashOutCon.fetchBankMember();
    // newCashOutCon.fetchBankInfo();

    return CupertinoScaffold(
      body: Builder(builder: (context) {
        return CupertinoPageScaffold(
          child: Scaffold(
            body: Obx(
              () => Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: WalletTotalCard(
                              amount: _walletController.walletAmount.value
                                          .toString() ==
                                      ''
                                  ? '0.00 USD'
                                  : _walletController
                                      .walletAmount.value.wallet!.balanceFormat,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Container(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20.0,
                                    right: 20.0,
                                    top: 20.0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Confirm your banking information',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 14.0,
                                            ),
                                      ),
                                      GetBuilder<SettingController>(
                                        init: SettingController(),
                                        builder: (controller) {
                                          return InkWell(
                                            onTap: () {
                                              onShowBottomSheet(
                                                  icondata: Icons.close,
                                                  isLoading:
                                                      controller.isloading,
                                                  title:
                                                      'Confirm Banking Information',
                                                  context: context,
                                                  child: Column(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 20,
                                                                vertical: 10),
                                                        child: controller
                                                                    .uiSettingData
                                                                    .confirmBankingInformation !=
                                                                null
                                                            ? HtmlWidget(
                                                                "${controller.uiSettingData.confirmBankingInformation!.description}",
                                                                textStyle: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .headline2!
                                                                    .copyWith(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .normal,
                                                                        fontSize:
                                                                            14),
                                                              )
                                                            : Container(),
                                                      )
                                                    ],
                                                  ));
                                            },
                                            child: SvgPicture.asset(
                                                'assets/images/svgfile/questicon.svg'),
                                          );
                                        },
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20),
                                CICDropdown(
                                  isValidate:
                                      newCashOutCon.isVailidateBankName.value,
                                  colors: Colors.white,
                                  imageUrl:
                                      newCashOutCon.bankMemberData.value.image,
                                  isPadding: const EdgeInsets.only(left: 5),
                                  isUserAccount: true,
                                  isProfile: true,
                                  isSelectBank: true,
                                  isCompany: true,
                                  item: newCashOutCon.bankMemberDataList
                                      .asMap()
                                      .entries
                                      .map((e) {
                                    return DropDownItem(
                                      isPadding: const EdgeInsets.all(10),
                                      itemList: {
                                        "Name": e.value.bankName ?? "",
                                        "Code": e.value.id,
                                        "accountName":
                                            e.value.accountName ?? "",
                                        "accountNumber": e.value.accountNumber,
                                        "picture": e.value.image ?? ""
                                      },
                                    );
                                  }).toList(),
                                  onChange: (v) {
                                    newCashOutCon.isVailidateBankName.value =
                                        true;
                                    newCashOutCon.bankId.value = v["Code"];
                                    newCashOutCon.bankName.value = v["Name"];
                                    newCashOutCon.accountNameController.text =
                                        v["accountName"];
                                    newCashOutCon.accountNumberController.text =
                                        v["accountNumber"];
                                    newCashOutCon.accountNumber.value =
                                        newCashOutCon
                                            .accountNumberController.text;
                                    newCashOutCon.accountName.value =
                                        newCashOutCon
                                            .accountNameController.text;
                                    newCashOutCon.update();
                                    newCashOutCon.bankName.refresh();
                                  },
                                  label: 'Cash Out To',
                                  defaultValue: newCashOutCon.bankName.value !=
                                          ""
                                      ? {
                                          "Code": newCashOutCon.bankId.value,
                                          "Name": newCashOutCon.bankName.value
                                        }
                                      : null,
                                  onCreateCompany: () {
                                    newCashOutCon.onClearBank();
                                    Navigator.pop(context);
                                    showModalBottomSheet(
                                      isScrollControlled: true,
                                      enableDrag: true,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              borderRaduis)),
                                      context: context,
                                      builder: (context) =>
                                          CustomChangeAccountBank(),
                                    );
                                  },
                                ),
                                const SizedBox(height: 20.0),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20.0,
                                    right: 20.0,
                                  ),
                                  child: Text(
                                    "Cash Out Amount",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                CustomTextFieldNew(
                                  validateText: _walletController.walletAmount
                                                  .value.wallet!.balance ==
                                              0 ||
                                          newCashOutCon.cashoutAmount.value >
                                              _walletController.walletAmount
                                                  .value.wallet!.balance!
                                      ? newCashOutCon.validateText.value
                                      : null,
                                  inputFormatterList: [
                                    DigitFormatWithDecimal(),
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'^\d+\.?\d{0,2}')),
                                    // FilteringTextInputFormatter.allow(
                                    //     RegExp(r"[0-9.]")),
                                    // TextInputFormatter.withFunction(
                                    //     (oldValue, newValue) {
                                    //   double? number =
                                    //       double.tryParse(newValue.text);
                                    //   if (number != null) {
                                    //     debugPrint('New');
                                    //     return newValue.copyWith(
                                    //         text: newValue.text.asInput(),
                                    //         selection: TextSelection.collapsed(
                                    //             offset: newValue.text
                                    //                 .asInput()
                                    //                 .length));
                                    //   } else if (newValue.text.isEmpty) {
                                    //     return const TextEditingValue();
                                    //   } else {
                                    //     debugPrint('Old');
                                    //     return oldValue;
                                    //   }
                                    // }),
                                  ],
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          decimal: true),
                                  isValidate: newCashOutCon
                                      .isValidateCashoutAmount.value,
                                  labelText: 'Amount',
                                  hintText: 'Amount',
                                  isRequired: true,
                                  onChange: (value) {
                                    if (value.isEmpty) {
                                      newCashOutCon.cashoutAmount.value = 0;
                                      newCashOutCon.isValidateCashoutAmount
                                          .value = false;
                                    } else if (onConvertToDouble(
                                            value.replaceAll(',', '')) >
                                        _walletController.walletAmount.value
                                            .wallet!.balance!) {
                                      newCashOutCon.cashoutAmount.value =
                                          double.parse(
                                              value.replaceAll(',', ''));
                                      newCashOutCon.isValidateCashoutAmount
                                          .value = false;
                                      newCashOutCon.validateText.value =
                                          'Not enough balance';
                                    } else {
                                      newCashOutCon.cashoutAmount.value =
                                          onConvertToDouble(
                                              value.replaceAll(',', ''));

                                      if (onConvertToDouble(value) >
                                          newCashOutCon.bonusSetting.value
                                              .minimumCashOutAmount!) {
                                        newCashOutCon.isValidateCashoutAmount
                                            .value = true;
                                      } else {
                                        newCashOutCon.isValidateCashoutAmount
                                            .value = false;

                                        newCashOutCon.validateText.value =
                                            'Cash out amount must greater than ${newCashOutCon.bonusSetting.value.minimumCashOutAmount!} \$';
                                      }
                                    }
                                    debugPrint(
                                        'debug print value:====${newCashOutCon.cashoutAmount.value}');
                                  },
                                  initialValue: newCashOutCon
                                              .cashoutAmount.value !=
                                          0.0
                                      ? '${newCashOutCon.cashoutAmount.value}'
                                      : '',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // InkWell(
                  //   onTap: () {
                  //     newCashOutCon.isAgree.value =
                  //         !newCashOutCon.isAgree.value;
                  //   },
                  //   child: Container(
                  //     padding: const EdgeInsets.only(
                  //       left: 20.0,
                  //       right: 20.0,
                  //       bottom: 20.0,
                  //       top: 10.0,
                  //     ),
                  //     child: Column(
                  //       children: [
                  //         Row(
                  //           children: [
                  //             newCashOutCon.isAgree.value == false
                  //                 ? SvgPicture.asset(
                  //                     'assets/images/svgfile/cicle_check.svg',
                  //                     color: Colors.grey,
                  //                   )
                  //                 : SvgPicture.asset(
                  //                     'assets/images/svgfile/circle_check-selected.svg'),
                  //             const SizedBox(width: 10),
                  //             Text(
                  //               'I have read and agreed to CIC Service Agreement',
                  //               style: Theme.of(context)
                  //                   .textTheme
                  //                   .headline2!
                  //                   .copyWith(
                  //                       fontSize: 13,
                  //                       fontWeight: FontWeight.w400,
                  //                       color: const Color(0XFF464646)),
                  //             ),
                  //             // GestureDetector(
                  //             //   onTap: () {
                  //             //     onShowCustomCupertinoModalSheet(
                  //             //         context: context,
                  //             //         child: ServiceAgreement(
                  //             //           serviceAgreement: newCashOutCon
                  //             //               .bonusSetting
                  //             //               .value
                  //             //               .serviceAgreement,
                  //             //         ),
                  //             //         title: 'Service Agreement',
                  //             //         icon: const Icon(Icons.arrow_back_ios));
                  //             //   },
                  //             //   child: Padding(
                  //             //     padding: const EdgeInsets.only(left: 5.0),
                  //             //     child: Text(
                  //             //       'CiC Serivce Agreement',
                  //             //       style: Theme.of(context)
                  //             //           .textTheme
                  //             //           .headline2!
                  //             //           .copyWith(
                  //             //               fontSize: 13,
                  //             //               fontWeight: FontWeight.normal,
                  //             //               color: Theme.of(context).primaryColor),
                  //             //     ),
                  //             //   ),
                  //             // ),
                  //           ],
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  Container(
                      color: Colors.white,
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 10),
                      child: CustomButton(
                        width: double.infinity,
                        onPressed: newCashOutCon.bankName.value != "" &&
                                newCashOutCon.accountNumber.value != "" &&
                                newCashOutCon.cashoutAmount.value != 0
                            ? () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ReviewMMATransferScreen(),
                                  ),
                                );
                                // FirebaseAnalyticsHelper
                                //     .sendAnalyticsEvent(
                                //         'submit bonus cast out');
                                // newCashOutCon.isAgree.value = false;
                                // isValidate(context);
                              }
                            : null,
                        isDisable: newCashOutCon.bankName.value != "" &&
                                newCashOutCon.accountNumber.value != "" &&
                                newCashOutCon.cashoutAmount.value != 0 &&
                                newCashOutCon.cashoutAmount.value <
                                    _walletController
                                        .walletAmount.value.wallet!.balance!
                            ? false
                            : true,
                        isOutline: false,
                        title: 'Proceed to Pay',
                      )),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
