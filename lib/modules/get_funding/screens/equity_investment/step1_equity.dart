import 'package:cicgreenloan/Utils/form_builder/custom_drop_down.dart';
import 'package:cicgreenloan/Utils/function/format_date_time.dart';
import 'package:cicgreenloan/Utils/helper/format_number.dart';
import 'package:cicgreenloan/Utils/pop_up_alert/show_alert_dialog.dart';
import 'package:cicgreenloan/modules/get_funding/controller/equity_investment_controller.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_form_card.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_textformfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../Utils/helper/container_partern.dart';
import '../../../../Utils/helper/firebase_analytics.dart';
import '../../../../Utils/helper/numerice_format.dart';
import '../../../../utils/chart/custom_circle_chart_1_3.dart';
import '../../../../utils/helper/custom_appbar_colorswhite.dart';
import '../../../../widgets/get_funding/custom_call_center.dart';

class Step1Equiry extends StatefulWidget {
  final int? id;
  final int? step;
  const Step1Equiry({Key? key, this.id = 0, this.step}) : super(key: key);
  @override
  State<Step1Equiry> createState() => _Step1EquiryState();
}

class _Step1EquiryState extends State<Step1Equiry> {
  final equityController = Get.put(EquityInvestmentController());
  @override
  void initState() {
    equityController.fetchEquitySetting();
    if (widget.id != 0) {
      inistialdata();
    } else {
      // equityController.applicationData.value = ApplicationDataDetail();
    }
    super.initState();
  }

  inistialdata() async {
    await equityController.fetchAppDetails(widget.id!);

    ///
    var displayfinancialAmount = FormatNumber.formatNumberDefualt(
        equityController.applicationData.value.financialAmount!);
    equityController.financingAmountcontroller.text =
        equityController.applicationData.value.financialAmount!.toString() ==
                "0"
            ? ""
            : displayfinancialAmount.toString();

    ///
    equityController.financingAmoung.value =
        equityController.applicationData.value.financialAmount != null
            ? equityController.applicationData.value.financialAmount!.toInt()
            : 0;
    equityController.intendedDate.value =
        equityController.applicationData.value.intendedDateDisbursement!;

    equityController.useOfFundcontroller.text =
        equityController.applicationData.value.useofFund!;
    equityController.useOfFund.value =
        equityController.applicationData.value.useofFund!;
  }

  void _onpress(BuildContext context) {
    if (equityController.financingAmoung.value <
            equityController.equitySetting.value.minEquityAmount! ||
        equityController.financingAmoung.value >
            equityController.equitySetting.value.maxEquityAmount!) {
      equityController.isValidateFinancingAmount.value = false;
    } else {
      equityController.isValidateFinancingAmount.value = true;
    }
    if (equityController.useOfFund.value == '') {
      equityController.isValidateUseOfFund.value = false;
    } else {
      equityController.isValidateUseOfFund.value = true;
    }
    if (equityController.intendedDate.value == '') {
      equityController.isValidateIntendedDate.value = false;
    } else {
      equityController.isValidateIntendedDate.value = true;
    }
    if (equityController.financingAmoung.value >=
            equityController.equitySetting.value.minEquityAmount! &&
        equityController.financingAmoung.value <=
            equityController.equitySetting.value.maxEquityAmount! &&
        equityController.useOfFund.value != '' &&
        equityController.intendedDate.value != '') {
      context.go(
          "/get-funding/equity-investment/equity-step2/${widget.id}/${widget.step}");
    }
  }

  final useOfFundFocus = FocusNode();
  DateTime dt1 = DateTime.parse(FormatDate.today().toString());

  @override
  Widget build(BuildContext context) {
    return CupertinoScaffold(
      body: Builder(
        builder: (context) => CupertinoPageScaffold(
          child: Obx(
            () => WillPopScope(
              onWillPop: () async => false,
              child: equityController.isLoadingSubmit.value
                  ? showLoading()
                  : Scaffold(
                      resizeToAvoidBottomInset: false,
                      appBar: equityController.isSubmitLoading.value == true
                          ? AppBar()
                          : CustomAppBarWhiteColor(
                              context: context,
                              title: 'Equity Investment',
                              leading: IconButton(
                                  onPressed: equityController
                                                  .financingAmoung.value ==
                                              equityController.applicationData
                                                  .value.financialAmount &&
                                          equityController.useOfFund.value ==
                                              equityController.applicationData
                                                  .value.useofFund &&
                                          equityController.intendedDate.value ==
                                              equityController
                                                  .applicationData
                                                  .value
                                                  .intendedDateDisbursement
                                      ? () {
                                          debugPrint("Pop 1");
                                          FocusScope.of(context).unfocus();

                                          Navigator.pop(context);
                                        }
                                      : equityController
                                                      .financingAmoung.value ==
                                                  0.0 &&
                                              equityController
                                                      .intendedDate.value ==
                                                  '' &&
                                              equityController
                                                      .useOfFund.value ==
                                                  ''
                                          ? () {
                                              Navigator.pop(context);

                                              FocusScope.of(context).unfocus();
                                            }
                                          : () {
                                              FocusScope.of(context).unfocus();
                                              showSaveDraftDialog(
                                                step: 1,
                                                isCancel: true,
                                                isEquity: true,
                                                context: context,
                                                onSaveTitle: widget.id != 0
                                                    ? "Update Draft"
                                                    : "Save Draft",
                                                content:
                                                    'Changes made to this page haven’t been saved yet.',
                                                title:
                                                    'Are you sure you want to leave this page?',
                                              );
                                            },
                                  icon: const Icon(
                                    Icons.clear,
                                    color: Colors.black,
                                  )),
                              action: [
                                const CustomCallCenter(),
                                const CustomCircleChart(
                                  numberPage: 1,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                      body: equityController.isLoadingData.value
                          ? const LinearProgressIndicator()
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Text(
                                    'Financing Information',
                                    style:
                                        Theme.of(context).textTheme.headline2,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Expanded(
                                    child: CustomFormCard(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 20),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        CustomTextFieldNew(
                                          inputFormatterList: [
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                            NumericTextFormatter(),
                                            FilteringTextInputFormatter.deny(
                                                RegExp(r'^0+')),
                                          ],
                                          validateText: equityController
                                                      .financingAmoung.value ==
                                                  0
                                              ? null
                                              : "${equityController.equitySetting.value.message}",
                                          controller: equityController
                                              .financingAmountcontroller,
                                          onEditingComplete: () {
                                            FocusScope.of(context)
                                                .requestFocus(useOfFundFocus);
                                          },
                                          isRequired: true,
                                          isValidate: equityController
                                              .isValidateFinancingAmount.value,
                                          labelText: 'Financing Amount (USD) ',
                                          hintText: 'Financing Amount (USD)',
                                          onChange: (valueChnaged) {
                                            var value = valueChnaged.replaceAll(
                                                ',', '');

                                            if (value.isEmpty) {
                                              equityController
                                                  .financingAmoung.value = 0;
                                              equityController
                                                  .isValidateFinancingAmount
                                                  .value = false;
                                            } else {
                                              equityController.financingAmoung
                                                  .value = int.parse(value);
                                              if (equityController
                                                          .financingAmoung
                                                          .value <
                                                      equityController
                                                          .equitySetting
                                                          .value
                                                          .minEquityAmount! ||
                                                  equityController
                                                          .financingAmoung
                                                          .value >
                                                      equityController
                                                          .equitySetting
                                                          .value
                                                          .maxEquityAmount!) {
                                                equityController
                                                    .isValidateFinancingAmount
                                                    .value = false;
                                              } else {
                                                equityController
                                                    .isValidateFinancingAmount
                                                    .value = true;
                                              }
                                            }
                                          },
                                          keyboardType: TextInputType.number,
                                          initialValue: equityController
                                                      .financingAmoung.value ==
                                                  0.0
                                              ? ''
                                              : equityController
                                                  .financingAmoung.value
                                                  .toString(),
                                        ),
                                        CICDropdown(
                                          currentDate: widget.id != 0 &&
                                                  dt1.isAfter(
                                                    equityController
                                                                .intendedDate
                                                                .value ==
                                                            ""
                                                        ? DateTime(dt1.year,
                                                            dt1.month, dt1.day)
                                                        : DateFormat(
                                                                "dd-MM-yyyy",
                                                                'en_US')
                                                            .parse(
                                                                equityController
                                                                    .intendedDate
                                                                    .value),
                                                  )
                                              ? DateFormat(
                                                      "dd-MM-yyyy", 'en_US')
                                                  .parse(equityController
                                                      .intendedDate.value)
                                              : FormatDate.today(),
                                          isValidate: equityController
                                              .isValidateIntendedDate.value,
                                          label:
                                              'Intended Date of Disbursement',
                                          onChange: (value) {
                                            equityController.whenOnchangeDate
                                                .value = value["Name"];
                                            equityController.intendedDate
                                                .value = value["Name"];
                                            equityController
                                                .isValidateIntendedDate
                                                .value = true;
                                          },
                                          defaultValue: equityController
                                                      .intendedDate.value ==
                                                  ''
                                              ? null
                                              : {
                                                  'Name': widget.id != 0 &&
                                                          equityController
                                                                  .whenOnchangeDate
                                                                  .value ==
                                                              ""
                                                      ? FormatDate
                                                          .formatDateTimeGetfunding(
                                                              equityController
                                                                  .intendedDate
                                                                  .value)
                                                      : equityController
                                                          .intendedDate.value,
                                                  'Code': '02'
                                                },
                                          isDateTimePicker: true,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        CustomTextFieldNew(
                                          controller: equityController
                                              .useOfFundcontroller,
                                          isRequired: true,
                                          focusScope: useOfFundFocus,
                                          onEditingComplete: () {
                                            _onpress(context);
                                          },
                                          isValidate: equityController
                                              .isValidateUseOfFund.value,
                                          labelText: 'Use Of Fund',
                                          hintText: 'Use Of Fund',
                                          onChange: (value) {
                                            if (value.isEmpty) {
                                              equityController
                                                  .isValidateUseOfFund
                                                  .value = false;

                                              equityController.useOfFund.value =
                                                  '';
                                            } else {
                                              equityController.useOfFund.value =
                                                  value;
                                              equityController
                                                  .isValidateUseOfFund
                                                  .value = true;
                                            }
                                          },
                                          initialValue: equityController
                                                      .useOfFund.value !=
                                                  ""
                                              ? equityController.useOfFund.value
                                              : "",
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 20,
                                      right: 20,
                                      bottom: 35.0,
                                      top: 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: CustomButton(
                                          isDisable: equityController
                                                          .financingAmoung
                                                          .value ==
                                                      equityController
                                                          .applicationData
                                                          .value
                                                          .financialAmount &&
                                                  equityController
                                                          .useOfFund.value ==
                                                      equityController
                                                          .applicationData
                                                          .value
                                                          .useofFund &&
                                                  equityController
                                                          .intendedDate.value ==
                                                      equityController
                                                          .applicationData
                                                          .value
                                                          .intendedDateDisbursement
                                              ? true
                                              : equityController.financingAmoung
                                                              .value !=
                                                          0.0 ||
                                                      equityController.useOfFund
                                                              .value !=
                                                          "" ||
                                                      equityController
                                                              .yearOfEstablishment
                                                              .value !=
                                                          ""
                                                  ? false
                                                  : true,
                                          isOutline: true,
                                          onPressed: equityController
                                                          .financingAmoung
                                                          .value ==
                                                      equityController
                                                          .applicationData
                                                          .value
                                                          .financialAmount &&
                                                  equityController
                                                          .useOfFund.value ==
                                                      equityController
                                                          .applicationData
                                                          .value
                                                          .useofFund &&
                                                  equityController
                                                          .intendedDate.value ==
                                                      equityController
                                                          .applicationData
                                                          .value
                                                          .intendedDateDisbursement
                                              ? null
                                              : widget.id != 0
                                                  ? () async {
                                                      FirebaseAnalyticsHelper
                                                          .sendAnalyticsEvent(
                                                              "Equity Update Draft Step1");
                                                      await equityController
                                                          .onEditEquityInvestment(
                                                              showSnackbar:
                                                                  false,
                                                              context: context,
                                                              id: widget.id!,
                                                              pagenumber: "1",
                                                              frompage:
                                                                  equityController
                                                                      .applicationData
                                                                      .value
                                                                      .step!
                                                                      .toInt());
                                                    }
                                                  : () async {
                                                      FirebaseAnalyticsHelper
                                                          .sendAnalyticsEvent(
                                                              "Equity Save Draft Step1");
                                                      await equityController
                                                          .onSubmitEquityInvestment(
                                                              showSnackbar:
                                                                  false,
                                                              context: context,
                                                              type: "1");
                                                    },
                                          title: widget.id == 0
                                              ? 'Save Draft'
                                              : "Update Draft",
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        child: CustomButton(
                                          isDisable: handleDisableNext(),
                                          isOutline: false,
                                          onPressed: () {
                                            FocusScope.of(context).unfocus();
                                            _onpress(context);
                                          },
                                          title: 'Next',
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                    ),
            ),
          ),
        ),
      ),
    );
  }

  bool handleDisableNext() {
    if (equityController.financingAmoung.value != 0 &&
        equityController.intendedDate.value != '' &&
        equityController.useOfFund.value != '') {
      return false;
    } else {
      return true;
    }
  }

  Widget showLoading() {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black.withOpacity(0.7),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(
                    color: Colors.white,
                    backgroundColor: Colors.white38,
                    strokeWidth: 4),
              ),
              const SizedBox(height: padding),
              Text(
                widget.id != 0 ? "Updating..." : "Submitting...",
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
