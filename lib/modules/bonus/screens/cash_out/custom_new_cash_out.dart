import 'package:cicgreenloan/modules/bonus/screens/cash_out/custom_change_account_bank.dart';

import 'package:cicgreenloan/widgets/custom_showbottomsheet.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
            _walletController.walletAmount.value.balance!) {
      newCashOutCon.onCashout(context);
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    newCashOutCon.fetchbonusSetting();
    newCashOutCon.fetchBankMember();
    newCashOutCon.fetchBankInfo();

    return CupertinoScaffold(
      body: Builder(builder: (context) {
        return CupertinoPageScaffold(
          child: Scaffold(
            body: Obx(
              () => Container(
                color: Colors.grey[100],
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            WalletTotalCard(
                              amount: _walletController
                                  .walletAmount.value.balanceFormat,
                            ),
                            // SizedBox(height: 10),
                            // CustomInvestBalanceCard(
                            //   isContainStack: true,
                            //   titleBalance: 'Available Balance',
                            //   currency:
                            //       newCashOutCon.balanceModel.value.balance,
                            //   leftTitle: 'Investor ID',
                            //   leftSubTitle: userCon.customer.value.code,
                            //   rightTitle: 'Investor Name',
                            //   rightSubTitle: userCon.customer.value.fullName,
                            // ),
                            const SizedBox(height: 20.0),

                            Container(
                              padding: const EdgeInsets.only(bottom: 20),
                              color: Colors.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20, top: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Confirm your banking information',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2,
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
                                                                  horizontal:
                                                                      20,
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
                                                                          fontWeight: FontWeight
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
                                    imageUrl: newCashOutCon
                                        .bankMemberData.value.image,
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
                                          "accountNumber":
                                              e.value.accountNumber,
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
                                      newCashOutCon.accountNumberController
                                          .text = v["accountNumber"];
                                      newCashOutCon.accountNumber.value =
                                          newCashOutCon
                                              .accountNumberController.text;
                                      newCashOutCon.accountName.value =
                                          newCashOutCon
                                              .accountNameController.text;
                                      newCashOutCon.update();
                                      newCashOutCon.bankName.refresh();
                                    },
                                    label: 'Bank Account',
                                    defaultValue:
                                        newCashOutCon.bankName.value != ""
                                            ? {
                                                "Code":
                                                    newCashOutCon.bankId.value,
                                                "Name":
                                                    newCashOutCon.bankName.value
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
                                  const SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: Text("Cash Out Amount",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2),
                                  ),
                                  const SizedBox(height: 10),
                                  CustomTextFieldNew(
                                    validateText: _walletController.walletAmount
                                                    .value.balance ==
                                                0 ||
                                            newCashOutCon.cashoutAmount.value >
                                                _walletController
                                                    .walletAmount.value.balance!
                                        ? newCashOutCon.validateText.value
                                        : null,
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
                                      } else if (onConvertToDouble(value) >
                                          _walletController
                                              .walletAmount.value.balance!) {
                                        newCashOutCon.cashoutAmount.value =
                                            double.parse(value);
                                        newCashOutCon.isValidateCashoutAmount
                                            .value = false;
                                        newCashOutCon.validateText.value =
                                            'Not enough balance';
                                      } else {
                                        newCashOutCon.cashoutAmount.value =
                                            onConvertToDouble(value);

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

                            // Container(
                            //   margin: const EdgeInsets.only(top: 15),
                            //   padding: const EdgeInsets.only(bottom: 20),
                            //   color: Colors.white,
                            //   child: Column(
                            //     children: [
                            //       Padding(
                            //         padding: const EdgeInsets.only(
                            //             left: 20, right: 20, top: 20),
                            //         child: Row(
                            //           mainAxisAlignment:
                            //               MainAxisAlignment.spaceBetween,
                            //           children: [
                            //             Text(
                            //               'Payment Information',
                            //               style: Theme.of(context)
                            //                   .textTheme
                            //                   .bodyText2,
                            //             ),
                            //             GetBuilder<SettingController>(
                            //                 init: SettingController(),
                            //                 builder: (controller) {
                            //                   return InkWell(
                            //                     onTap: () {
                            //                       onShowBottomSheet(
                            //                           icondata: Icons.close,
                            //                           isLoading:
                            //                               controller.isloading,
                            //                           title: controller
                            //                                       .uiSettingData
                            //                                       .paymentInformation !=
                            //                                   null
                            //                               ? controller
                            //                                   .uiSettingData
                            //                                   .paymentInformation!
                            //                                   .label
                            //                               : "Payment Information",
                            //                           context: context,
                            //                           child: Column(
                            //                             children: [
                            //                               Padding(
                            //                                 padding:
                            //                                     const EdgeInsets
                            //                                             .symmetric(
                            //                                         horizontal:
                            //                                             20,
                            //                                         vertical:
                            //                                             10),
                            //                                 child: controller
                            //                                             .uiSettingData
                            //                                             .paymentInformation !=
                            //                                         null
                            //                                     ? HtmlWidget(
                            //                                         "${controller.uiSettingData.paymentInformation!.description}",
                            //                                         textStyle: Theme.of(
                            //                                                 context)
                            //                                             .textTheme
                            //                                             .headline2!
                            //                                             .copyWith(
                            //                                                 fontWeight:
                            //                                                     FontWeight.normal,
                            //                                                 fontSize: 14),
                            //                                       )
                            //                                     : Container(),
                            //                               )
                            //                             ],
                            //                           ));
                            //                     },
                            //                     child: SvgPicture.asset(
                            //                         'assets/images/svgfile/questicon.svg'),
                            //                   );
                            //                 })
                            //           ],
                            //         ),
                            //       ),
                            //       CustomInterestSummary(
                            //         titleDate: 'Transfer within :',
                            //         date: "",
                            //         time: newCashOutCon
                            //             .bonusSetting.value.cashOutSendingDate,
                            //       ),
                            //       const SizedBox(height: 20),
                            //       const Padding(
                            //         padding:
                            //             EdgeInsets.only(left: 20, right: 20),
                            //         child: Divider(
                            //           thickness: 0.5,
                            //           color: Colors.grey,
                            //         ),
                            //       ),
                            //       Padding(
                            //         padding: const EdgeInsets.only(
                            //             left: 20, right: 20, top: 10),
                            //         child: Row(
                            //           mainAxisAlignment:
                            //               MainAxisAlignment.spaceBetween,
                            //           children: [
                            //             Text(
                            //               'Cash Out Amount',
                            //               style: Theme.of(context)
                            //                   .textTheme
                            //                   .bodyText2,
                            //             ),
                            //             Text(
                            //               "${newCashOutCon.cashoutAmount.value.toString()} USD",
                            //               style: Theme.of(context)
                            //                   .textTheme
                            //                   .bodyText2!
                            //                   .copyWith(
                            //                     color: AppColor
                            //                         .statusColor['late'],
                            //                   ),
                            //             ),
                            //           ],
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        newCashOutCon.isAgree.value =
                            !newCashOutCon.isAgree.value;
                      },
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 20, top: 20, bottom: 20),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                newCashOutCon.isAgree.value == false
                                    ? SvgPicture.asset(
                                        'assets/images/svgfile/cicle_check.svg',
                                        color: Colors.grey,
                                      )
                                    : SvgPicture.asset(
                                        'assets/images/svgfile/circle_check-selected.svg'),
                                const SizedBox(width: 20),
                                Text(
                                  'I have read  and agree to CiC serivce agreement',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2!
                                      .copyWith(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0XFF464646)),
                                ),
                                // GestureDetector(
                                //   onTap: () {
                                //     onShowCustomCupertinoModalSheet(
                                //         context: context,
                                //         child: ServiceAgreement(
                                //           serviceAgreement: newCashOutCon
                                //               .bonusSetting
                                //               .value
                                //               .serviceAgreement,
                                //         ),
                                //         title: 'Service Agreement',
                                //         icon: const Icon(Icons.arrow_back_ios));
                                //   },
                                //   child: Padding(
                                //     padding: const EdgeInsets.only(left: 5.0),
                                //     child: Text(
                                //       'CiC Serivce Agreement',
                                //       style: Theme.of(context)
                                //           .textTheme
                                //           .headline2!
                                //           .copyWith(
                                //               fontSize: 13,
                                //               fontWeight: FontWeight.normal,
                                //               color: AppColor.mainColor),
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                        color: Colors.white,
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 20, bottom: 30),
                        child: CustomButton(
                          onPressed: newCashOutCon.isAgree.value
                              ? newCashOutCon.bankName.value != "" &&
                                      newCashOutCon.accountNumber.value != ""
                                  ? () {
                                      debugPrint("cash out 1");
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
                                  : null
                              : null,
                          isDisable: false,
                          isOutline: false,
                          title: 'Proceed to Pay',
                        )),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
