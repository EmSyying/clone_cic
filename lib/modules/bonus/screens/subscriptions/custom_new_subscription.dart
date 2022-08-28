import 'package:cicgreenloan/Utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_material_modal_sheet.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_textformfield.dart';
import 'package:cicgreenloan/modules/bonus/controllers/bonus_controller.dart';
import 'package:cicgreenloan/Utils/app_settings/controllers/appsetting_controller.dart';

import 'package:cicgreenloan/modules/member_directory/controllers/customer_controller.dart';
import 'package:cicgreenloan/modules/investment_module/controller/investment_controller.dart';
import 'package:cicgreenloan/widgets/bonus/investFIF/custom_invest_balance_card.dart';
import 'package:cicgreenloan/widgets/bonus/investFIF/optionInvest/interest_summary.dart';
import 'package:cicgreenloan/widgets/bonus/service_agreement.dart';
import 'package:cicgreenloan/widgets/custom_showbottomsheet.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../Utils/helper/color.dart';
import '../../../../Utils/helper/format_number.dart';
import '../../../../utils/helper/firebase_analytics.dart';

class CustomNewSubscription extends StatefulWidget {
  const CustomNewSubscription({Key? key}) : super(key: key);

  @override
  State<CustomNewSubscription> createState() => _CustomNewSubscriptionState();
}

class _CustomNewSubscriptionState extends State<CustomNewSubscription> {
  final subscribeCon = Get.put(BonusController());

  final priceController = Get.put(PriceController());

  final userCon = Get.put(CustomerController());

  bool isValidate() {
    if (subscribeCon.subscriptionAmount.value <
            subscribeCon.bonusSetting.value.minUtSubscription! &&
        subscribeCon.bonusSetting.value.isCicTeam == false) {
      subscribeCon.isValidateSubscriptionAmount.value = false;
    } else {
      subscribeCon.isValidateSubscriptionAmount.value = true;
    }
    if (subscribeCon.subscriptionAmount.value != 0.0) {
      subscribeCon.onSubscription();
    }
    return false;
  }

  @override
  void initState() {
    priceController.onFetchPrice();
    subscribeCon.fetchUTScription();
    subscribeCon.fetchPaymentSummary();
    subscribeCon.fetchbonusSetting();
    Future.delayed(const Duration(seconds: 1), () async {
      subscribeCon.utPrice.value = priceController.price.value.price!;
      subscribeCon.utPriceController.text = priceController.price.value.price!;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoScaffold(
      body: Builder(builder: (context) {
        return CupertinoPageScaffold(
          child: Scaffold(
            body: Obx(
              () => subscribeCon.isUTScription.value &&
                      priceController.isLoading.value
                  ? const CircularProgressIndicator()
                  : Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Container(
                              color: Colors.grey[100],
                              child: Column(
                                children: [
                                  CustomInvestBalanceCard(
                                    titleBalance: 'Available Balance',
                                    currency:
                                        subscribeCon.balanceModel.value.balance,
                                    leftTitle: 'Investor ID',
                                    leftSubTitle: userCon.customer.value.code,
                                    rightTitle: 'Investor Name',
                                    rightSubTitle:
                                        userCon.customer.value.fullName,
                                  ),
                                  // SizedBox(height: 20),
                                  Container(
                                    width: double.infinity,
                                    // height: MediaQuery.of(context).size.height * 0.18,
                                    margin: const EdgeInsets.only(top: 20),
                                    padding: const EdgeInsets.only(
                                        top: 20, bottom: 20),
                                    color: Colors.white,
                                    child: Column(
                                      children: [
                                        CustomTextFieldNew(
                                          enable: false,
                                          isReadOnly: true,
                                          controller:
                                              subscribeCon.utPriceController,
                                          initialValue:
                                              subscribeCon.utPrice.value,
                                          labelText: 'Price/UT *',
                                          hintText: 'Price/UT',
                                        ),
                                        CustomTextFieldNew(
                                          validateText: subscribeCon
                                                      .subscriptionAmount
                                                      .value ==
                                                  0
                                              ? null
                                              : subscribeCon
                                                  .valadatesubscriptionText
                                                  .value,
                                          keyboardType: TextInputType.number,
                                          isValidate: subscribeCon
                                              .isValidateSubscriptionAmount
                                              .value,
                                          labelText: 'UT to Subscribe *',
                                          hintText: 'UT to Subscribe',
                                          initialValue: subscribeCon
                                                      .subscriptionAmount
                                                      .value !=
                                                  0
                                              ? "${subscribeCon.subscriptionAmount.value}"
                                              : "",
                                          onChange: (value) {
                                            if (value.isEmpty) {
                                              subscribeCon
                                                  .subscriptionAmount.value = 0;
                                              subscribeCon
                                                  .diplayNewUTAmount.value = 0;
                                              subscribeCon
                                                  .isValidateSubscriptionAmount
                                                  .value = false;
                                            } else if (subscribeCon.bonusSetting
                                                    .value.isCicTeam ==
                                                true) {
                                              try {
                                                subscribeCon
                                                    .isValidateSubscriptionAmount
                                                    .value = true;
                                                subscribeCon.subscriptionAmount
                                                    .value = int.parse(value);
                                                subscribeCon.diplayNewUTAmount
                                                    .value = subscribeCon
                                                        .utSubscription
                                                        .value
                                                        .totalUt! +
                                                    int.parse(value);
                                                subscribeCon
                                                    .displaysubscriptionCoast
                                                    .value = priceController
                                                        .price
                                                        .value
                                                        .priceUnformat! *
                                                    double.parse(value);
                                                subscribeCon.update();
                                              } catch (e) {
                                                debugPrint("$e");
                                              }
                                            } else {
                                              try {
                                                subscribeCon
                                                    .isValidateSubscriptionAmount
                                                    .value = true;
                                                subscribeCon.subscriptionAmount
                                                    .value = int.parse(value);
                                                subscribeCon.diplayNewUTAmount
                                                    .value = subscribeCon
                                                        .utSubscription
                                                        .value
                                                        .totalUt! +
                                                    int.parse(value);
                                                subscribeCon
                                                    .displaysubscriptionCoast
                                                    .value = priceController
                                                        .price
                                                        .value
                                                        .priceUnformat! *
                                                    double.parse(value);
                                                subscribeCon.update();
                                              } catch (e) {
                                                debugPrint("$e");
                                              }
                                              if (subscribeCon
                                                          .subscriptionAmount
                                                          .value <
                                                      subscribeCon
                                                          .bonusSetting
                                                          .value
                                                          .minUtSubscription! &&
                                                  subscribeCon.bonusSetting
                                                          .value.isCicTeam ==
                                                      false) {
                                                subscribeCon
                                                    .isValidateSubscriptionAmount
                                                    .value = false;
                                                subscribeCon
                                                        .valadatesubscriptionText
                                                        .value =
                                                    'Min. UT Subscription Amount: ${subscribeCon.bonusSetting.value.minUtSubscription!}';
                                                subscribeCon.update();
                                              } else {
                                                try {
                                                  subscribeCon
                                                      .isValidateSubscriptionAmount
                                                      .value = true;
                                                  subscribeCon
                                                      .subscriptionAmount
                                                      .value = int.parse(value);
                                                  subscribeCon.diplayNewUTAmount
                                                      .value = subscribeCon
                                                          .utSubscription
                                                          .value
                                                          .totalUt! +
                                                      int.parse(value);
                                                  subscribeCon
                                                      .displaysubscriptionCoast
                                                      .value = priceController
                                                          .price
                                                          .value
                                                          .priceUnformat! *
                                                      double.parse(value);
                                                  subscribeCon.update();
                                                } catch (e) {
                                                  debugPrint("$e");
                                                }
                                              }
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    color: Colors.white,
                                    margin: const EdgeInsets.only(top: 15),
                                    padding: const EdgeInsets.only(
                                        top: 20, bottom: 20),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, right: 20),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text('UT Summary'),
                                              GetBuilder<SettingController>(
                                                init: SettingController(),
                                                builder: (controller) {
                                                  return InkWell(
                                                    onTap: () {
                                                      onShowBottomSheet(
                                                          icondata: Icons.close,
                                                          isLoading: controller
                                                              .isloading,
                                                          title: controller
                                                                      .uiSettingData
                                                                      .utSummary !=
                                                                  null
                                                              ? controller
                                                                  .uiSettingData
                                                                  .utSummary!
                                                                  .label
                                                              : "",
                                                          context: context,
                                                          child: Column(
                                                            children: [
                                                              Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        20,
                                                                    vertical:
                                                                        10),
                                                                child: controller
                                                                            .uiSettingData
                                                                            .utSummary !=
                                                                        null
                                                                    ? HtmlWidget(
                                                                        "${controller.uiSettingData.utSummary!.description}",
                                                                        textStyle: Theme.of(context)
                                                                            .textTheme
                                                                            .headline2!
                                                                            .copyWith(
                                                                                fontWeight: FontWeight.normal,
                                                                                fontSize: 14),
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
                                        CustomInterestSummary(
                                            titleDate: "Initial UT Amount",
                                            date: "",
                                            time:
                                                '${FormatNumber.formatNumberDefualt(subscribeCon.utSubscription.value.totalUt!.toInt())} UT'),
                                        CustomInterestSummary(
                                          titleDate: "New UT Amount",
                                          date: "",
                                          time: subscribeCon.diplayNewUTAmount
                                                      .value ==
                                                  0
                                              ? '0 UT'
                                              : '${FormatNumber.formatNumberDefualt(subscribeCon.diplayNewUTAmount.value)} UT',
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    color: Colors.white,
                                    padding: const EdgeInsets.only(
                                        top: 20, bottom: 20),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, right: 20),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text('Payment Summary'),
                                              GetBuilder<SettingController>(
                                                init: SettingController(),
                                                builder: (controller) {
                                                  return InkWell(
                                                    onTap: () {
                                                      onShowBottomSheet(
                                                          icondata: Icons.close,
                                                          isLoading: controller
                                                              .isloading,
                                                          title: controller
                                                                      .uiSettingData
                                                                      .paymentSummary !=
                                                                  null
                                                              ? controller
                                                                  .uiSettingData
                                                                  .paymentSummary!
                                                                  .label
                                                              : "",
                                                          context: context,
                                                          child: Column(
                                                            children: [
                                                              Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        20,
                                                                    vertical:
                                                                        10),
                                                                child: controller
                                                                            .uiSettingData
                                                                            .paymentSummary !=
                                                                        null
                                                                    ? HtmlWidget(
                                                                        "${controller.uiSettingData.paymentSummary!.description}",
                                                                        textStyle: Theme.of(context)
                                                                            .textTheme
                                                                            .headline2!
                                                                            .copyWith(
                                                                                fontWeight: FontWeight.normal,
                                                                                fontSize: 14),
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
                                        CustomInterestSummary(
                                          titleDate: "Total Subscription Cost",
                                          date: "",
                                          time: subscribeCon.diplayNewUTAmount
                                                      .value ==
                                                  0
                                              ? "0.0 USD"
                                              : '${FormatToK.digitNumber(subscribeCon.displaysubscriptionCoast.value)} USD',
                                        ),
                                        // CustomInterestSummary(
                                        //   titleDate: "Available Balance Deducted",
                                        //   date: "",
                                        //   time:
                                        //       '${FormatToK.digitNumber(subscribeCon.paymentSummary.value.availableBalanceDeducted)} USD',
                                        // ),
                                        // CustomInterestSummary(
                                        //   titleDate: "Amount Paid to CiC",
                                        //   date: "",
                                        //   time:
                                        //       '${FormatToK.digitNumber(subscribeCon.paymentSummary.value.amountPaidToCic)} USD',
                                        // ),
                                        CustomInterestSummary(
                                          titleDate: "Last Date of Payment",
                                          date: "",
                                          time: subscribeCon.paymentSummary
                                                  .value.lastDateOfPayment ??
                                              "",
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      subscribeCon.isAgree.value =
                                          !subscribeCon.isAgree.value;
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          left: 20, top: 20, bottom: 20),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              subscribeCon.isAgree.value ==
                                                      false
                                                  ? SvgPicture.asset(
                                                      'assets/images/svgfile/cicle_check.svg',
                                                      color: Colors.grey,
                                                    )
                                                  : SvgPicture.asset(
                                                      'assets/images/svgfile/circle_check-selected.svg'),
                                              const SizedBox(width: 20),
                                              Text(
                                                'I have read  and agree to',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline2!
                                                    .copyWith(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: Colors.grey),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  onShowCustomCupertinoModalSheet(
                                                      context: context,
                                                      child: ServiceAgreement(
                                                        serviceAgreement:
                                                            subscribeCon
                                                                .bonusSetting
                                                                .value
                                                                .serviceAgreement,
                                                      ),
                                                      title:
                                                          'Service Agreement',
                                                      icon: const Icon(Icons
                                                          .arrow_back_ios));
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5.0),
                                                  child: Text(
                                                    'CiC Serivce Agreement',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline2!
                                                        .copyWith(
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            color: AppColor
                                                                .mainColor),
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
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20, bottom: 30),
                          child: CustomButton(
                            onPressed: subscribeCon.isAgree.value == true
                                ? () {
                                    FirebaseAnalyticsHelper.sendAnalyticsEvent(
                                        'submit bonus subscribe');
                                    subscribeCon.isAgree.value = false;
                                    FocusScope.of(context).unfocus();
                                    isValidate();
                                  }
                                : null,
                            isDisable: subscribeCon.isUTScription.value,
                            isOutline: false,
                            title: 'Submit',
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        );
      }),
    );
  }
}
