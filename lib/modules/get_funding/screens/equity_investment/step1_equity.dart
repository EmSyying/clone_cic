import 'package:cicgreenloan/Utils/form_builder/custom_drop_down.dart';
import 'package:cicgreenloan/Utils/function/format_date_time.dart';
import 'package:cicgreenloan/Utils/helper/format_number.dart';
import 'package:cicgreenloan/Utils/pop_up_alert/show_alert_dialog.dart';
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
import '../../../../Utils/helper/injection_helper/injection_helper.dart';
import '../../../../Utils/helper/numerice_format.dart';
import '../../../../utils/chart/custom_circle_chart_1_3.dart';
import '../../../../utils/helper/custom_appbar_colorswhite.dart';
import '../../../../widgets/get_funding/custom_call_center.dart';

class Step1Equiry extends StatefulWidget {
  final int? id;
  final int? step;
  const Step1Equiry({Key? key, this.id, this.step}) : super(key: key);
  @override
  State<Step1Equiry> createState() => _Step1EquiryState();
}

class _Step1EquiryState extends State<Step1Equiry> {
  @override
  void initState() {
    InjectionHelper.equityInvestmentController.fetchEquitySetting();
    if (widget.id != null) {
      inistialdata();
    } else {
      // InjectionHelper.equityInvestmentController.applicationData.value = ApplicationDataDetail();
    }
    super.initState();
  }

  inistialdata() async {
    await InjectionHelper.equityInvestmentController
        .fetchAppDetails(widget.id!);

    ///
    var displayfinancialAmount = FormatNumber.formatNumberDefualt(
        InjectionHelper
            .equityInvestmentController.applicationData.value.financialAmount!);
    InjectionHelper.equityInvestmentController.financingAmountcontroller.text =
        InjectionHelper.equityInvestmentController.applicationData.value
                    .financialAmount!
                    .toString() ==
                "0"
            ? ""
            : displayfinancialAmount.toString();

    ///
    InjectionHelper.equityInvestmentController.financingAmoung.value =
        InjectionHelper.equityInvestmentController.applicationData.value
                    .financialAmount !=
                null
            ? InjectionHelper.equityInvestmentController.applicationData.value
                .financialAmount!
                .toInt()
            : 0;
    InjectionHelper.equityInvestmentController.intendedDate.value =
        InjectionHelper.equityInvestmentController.applicationData.value
            .intendedDateDisbursement!;

    InjectionHelper.equityInvestmentController.useOfFundcontroller.text =
        InjectionHelper
            .equityInvestmentController.applicationData.value.useofFund!;
    InjectionHelper.equityInvestmentController.useOfFund.value = InjectionHelper
        .equityInvestmentController.applicationData.value.useofFund!;
  }

  void _onpress(BuildContext context) {
    if (InjectionHelper.equityInvestmentController.financingAmoung.value <
            InjectionHelper.equityInvestmentController.equitySetting.value
                .minEquityAmount! ||
        InjectionHelper.equityInvestmentController.financingAmoung.value >
            InjectionHelper.equityInvestmentController.equitySetting.value
                .maxEquityAmount!) {
      InjectionHelper
          .equityInvestmentController.isValidateFinancingAmount.value = false;
    } else {
      InjectionHelper
          .equityInvestmentController.isValidateFinancingAmount.value = true;
    }
    if (InjectionHelper.equityInvestmentController.useOfFund.value == '') {
      InjectionHelper.equityInvestmentController.isValidateUseOfFund.value =
          false;
    } else {
      InjectionHelper.equityInvestmentController.isValidateUseOfFund.value =
          true;
    }
    if (InjectionHelper.equityInvestmentController.intendedDate.value == '') {
      InjectionHelper.equityInvestmentController.isValidateIntendedDate.value =
          false;
    } else {
      InjectionHelper.equityInvestmentController.isValidateIntendedDate.value =
          true;
    }
    if (InjectionHelper.equityInvestmentController.financingAmoung.value >= InjectionHelper.equityInvestmentController.equitySetting.value.minEquityAmount! &&
        InjectionHelper.equityInvestmentController.financingAmoung.value <=
            InjectionHelper.equityInvestmentController.equitySetting.value
                .maxEquityAmount! &&
        InjectionHelper.equityInvestmentController.useOfFund.value != '' &&
        InjectionHelper.equityInvestmentController.intendedDate.value != '') {
      context.push(
          "/get_funding/equity-step2?id=${widget.id}&&step=${widget.step}");
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
              child: InjectionHelper
                      .equityInvestmentController.isLoadingSubmit.value
                  ? showLoading()
                  : Scaffold(
                      resizeToAvoidBottomInset: false,
                      appBar: InjectionHelper.equityInvestmentController
                                  .isSubmitLoading.value ==
                              true
                          ? AppBar()
                          : CustomAppBarWhiteColor(
                              context: context,
                              title: 'Equity Investment',
                              leading: IconButton(
                                  onPressed: InjectionHelper
                                                  .equityInvestmentController
                                                  .financingAmoung
                                                  .value ==
                                              InjectionHelper
                                                  .equityInvestmentController
                                                  .applicationData
                                                  .value
                                                  .financialAmount &&
                                          InjectionHelper.equityInvestmentController.useOfFund.value ==
                                              InjectionHelper
                                                  .equityInvestmentController
                                                  .applicationData
                                                  .value
                                                  .useofFund &&
                                          InjectionHelper
                                                  .equityInvestmentController
                                                  .intendedDate
                                                  .value ==
                                              InjectionHelper
                                                  .equityInvestmentController
                                                  .applicationData
                                                  .value
                                                  .intendedDateDisbursement
                                      ? () {
                                          debugPrint("Pop 1");
                                          FocusScope.of(context).unfocus();

                                          Navigator.pop(context);
                                        }
                                      : InjectionHelper
                                                      .equityInvestmentController
                                                      .financingAmoung
                                                      .value ==
                                                  0.0 &&
                                              InjectionHelper
                                                      .equityInvestmentController
                                                      .intendedDate
                                                      .value ==
                                                  '' &&
                                              InjectionHelper
                                                      .equityInvestmentController
                                                      .useOfFund
                                                      .value ==
                                                  ''
                                          ? () {
                                              Navigator.pop(context);

                                              FocusScope.of(context).unfocus();
                                            }
                                          : () {
                                              FocusScope.of(context).unfocus();
                                              showSaveDraftDialog(
                                                  context: context,
                                                  onSaveTitle: widget.id != null
                                                      ? "Update Draft"
                                                      : "Save Draft",
                                                  content:
                                                      'Changes made to this page haven’t been saved yet.',
                                                  title:
                                                      'Are you sure you want to leave this page?',
                                                  onSave: () async {
                                                    context.pop();
                                                    if (widget.id == null) {
                                                      await InjectionHelper
                                                          .equityInvestmentController
                                                          .onSubmitEquityInvestment(
                                                              context: context,
                                                              type: "1");
                                                    } else {
                                                      InjectionHelper
                                                          .equityInvestmentController
                                                          .onEditEquityInvestment(
                                                              context: context,
                                                              id: widget.id!,
                                                              pagenumber: "1");
                                                    }
                                                  },
                                                  isCancel: true,
                                                  onDiscard: () {
                                                    context.pop();
                                                    InjectionHelper
                                                        .equityInvestmentController
                                                        .resetData();
                                                    context.go("/get_funding");
                                                  });
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
                      body: InjectionHelper
                              .equityInvestmentController.isLoadingData.value
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
                                          validateText: InjectionHelper
                                                      .equityInvestmentController
                                                      .financingAmoung
                                                      .value ==
                                                  0
                                              ? null
                                              : "${InjectionHelper.equityInvestmentController.equitySetting.value.message}",
                                          controller: InjectionHelper
                                              .equityInvestmentController
                                              .financingAmountcontroller,
                                          onEditingComplete: () {
                                            FocusScope.of(context)
                                                .requestFocus(useOfFundFocus);
                                          },
                                          isRequired: true,
                                          isValidate: InjectionHelper
                                              .equityInvestmentController
                                              .isValidateFinancingAmount
                                              .value,
                                          labelText: 'Financing Amount (USD) ',
                                          hintText: 'Financing Amount (USD)',
                                          onChange: (valueChnaged) {
                                            var value = valueChnaged.replaceAll(
                                                ',', '');

                                            if (value.isEmpty) {
                                              InjectionHelper
                                                  .equityInvestmentController
                                                  .financingAmoung
                                                  .value = 0;
                                              InjectionHelper
                                                  .equityInvestmentController
                                                  .isValidateFinancingAmount
                                                  .value = false;
                                            } else {
                                              InjectionHelper
                                                  .equityInvestmentController
                                                  .financingAmoung
                                                  .value = int.parse(value);
                                              if (InjectionHelper
                                                          .equityInvestmentController
                                                          .financingAmoung
                                                          .value <
                                                      InjectionHelper
                                                          .equityInvestmentController
                                                          .equitySetting
                                                          .value
                                                          .minEquityAmount! ||
                                                  InjectionHelper
                                                          .equityInvestmentController
                                                          .financingAmoung
                                                          .value >
                                                      InjectionHelper
                                                          .equityInvestmentController
                                                          .equitySetting
                                                          .value
                                                          .maxEquityAmount!) {
                                                InjectionHelper
                                                    .equityInvestmentController
                                                    .isValidateFinancingAmount
                                                    .value = false;
                                              } else {
                                                InjectionHelper
                                                    .equityInvestmentController
                                                    .isValidateFinancingAmount
                                                    .value = true;
                                              }
                                            }
                                          },
                                          keyboardType: TextInputType.number,
                                          initialValue: InjectionHelper
                                                      .equityInvestmentController
                                                      .financingAmoung
                                                      .value ==
                                                  0.0
                                              ? ''
                                              : InjectionHelper
                                                  .equityInvestmentController
                                                  .financingAmoung
                                                  .value
                                                  .toString(),
                                        ),
                                        CICDropdown(
                                          currentDate: widget.id != null &&
                                                  dt1.isAfter(
                                                    InjectionHelper
                                                                .equityInvestmentController
                                                                .intendedDate
                                                                .value ==
                                                            ""
                                                        ? DateTime(dt1.year,
                                                            dt1.month, dt1.day)
                                                        : DateFormat(
                                                                "dd-MM-yyyy",
                                                                'en_US')
                                                            .parse(InjectionHelper
                                                                .equityInvestmentController
                                                                .intendedDate
                                                                .value),
                                                  )
                                              ? DateFormat(
                                                      "dd-MM-yyyy", 'en_US')
                                                  .parse(InjectionHelper
                                                      .equityInvestmentController
                                                      .intendedDate
                                                      .value)
                                              : FormatDate.today(),
                                          isValidate: InjectionHelper
                                              .equityInvestmentController
                                              .isValidateIntendedDate
                                              .value,
                                          label:
                                              'Intended Date of Disbursement',
                                          onChange: (value) {
                                            InjectionHelper
                                                .equityInvestmentController
                                                .whenOnchangeDate
                                                .value = value["Name"];
                                            InjectionHelper
                                                .equityInvestmentController
                                                .intendedDate
                                                .value = value["Name"];
                                            InjectionHelper
                                                .equityInvestmentController
                                                .isValidateIntendedDate
                                                .value = true;
                                          },
                                          defaultValue: InjectionHelper
                                                      .equityInvestmentController
                                                      .intendedDate
                                                      .value ==
                                                  ''
                                              ? null
                                              : {
                                                  'Name': widget.id != null &&
                                                          InjectionHelper
                                                                  .equityInvestmentController
                                                                  .whenOnchangeDate
                                                                  .value ==
                                                              ""
                                                      ? FormatDate
                                                          .formatDateTimeGetfunding(
                                                              InjectionHelper
                                                                  .equityInvestmentController
                                                                  .intendedDate
                                                                  .value)
                                                      : InjectionHelper
                                                          .equityInvestmentController
                                                          .intendedDate
                                                          .value,
                                                  'Code': '02'
                                                },
                                          isDateTimePicker: true,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        CustomTextFieldNew(
                                          controller: InjectionHelper
                                              .equityInvestmentController
                                              .useOfFundcontroller,
                                          isRequired: true,
                                          focusScope: useOfFundFocus,
                                          onEditingComplete: () {
                                            _onpress(context);
                                          },
                                          isValidate: InjectionHelper
                                              .equityInvestmentController
                                              .isValidateUseOfFund
                                              .value,
                                          labelText: 'Use Of Fund',
                                          hintText: 'Use Of Fund',
                                          onChange: (value) {
                                            if (value.isEmpty) {
                                              InjectionHelper
                                                  .equityInvestmentController
                                                  .isValidateUseOfFund
                                                  .value = false;

                                              InjectionHelper
                                                  .equityInvestmentController
                                                  .useOfFund
                                                  .value = '';
                                            } else {
                                              InjectionHelper
                                                  .equityInvestmentController
                                                  .useOfFund
                                                  .value = value;
                                              InjectionHelper
                                                  .equityInvestmentController
                                                  .isValidateUseOfFund
                                                  .value = true;
                                            }
                                          },
                                          initialValue: InjectionHelper
                                                      .equityInvestmentController
                                                      .useOfFund
                                                      .value !=
                                                  ""
                                              ? InjectionHelper
                                                  .equityInvestmentController
                                                  .useOfFund
                                                  .value
                                              : "",
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 20, right: 20, bottom: 10, top: 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: CustomButton(
                                          isDisable: InjectionHelper
                                                          .equityInvestmentController
                                                          .financingAmoung
                                                          .value ==
                                                      InjectionHelper
                                                          .equityInvestmentController
                                                          .applicationData
                                                          .value
                                                          .financialAmount &&
                                                  InjectionHelper
                                                          .equityInvestmentController
                                                          .useOfFund
                                                          .value ==
                                                      InjectionHelper
                                                          .equityInvestmentController
                                                          .applicationData
                                                          .value
                                                          .useofFund &&
                                                  InjectionHelper
                                                          .equityInvestmentController
                                                          .intendedDate
                                                          .value ==
                                                      InjectionHelper
                                                          .equityInvestmentController
                                                          .applicationData
                                                          .value
                                                          .intendedDateDisbursement
                                              ? true
                                              : InjectionHelper
                                                              .equityInvestmentController
                                                              .financingAmoung
                                                              .value !=
                                                          0.0 ||
                                                      InjectionHelper.equityInvestmentController.useOfFund.value != "" ||
                                                      InjectionHelper.equityInvestmentController.yearOfEstablishment.value != ""
                                                  ? false
                                                  : true,
                                          isOutline: true,
                                          onPressed: InjectionHelper
                                                          .equityInvestmentController
                                                          .financingAmoung
                                                          .value ==
                                                      InjectionHelper
                                                          .equityInvestmentController
                                                          .applicationData
                                                          .value
                                                          .financialAmount &&
                                                  InjectionHelper
                                                          .equityInvestmentController
                                                          .useOfFund
                                                          .value ==
                                                      InjectionHelper
                                                          .equityInvestmentController
                                                          .applicationData
                                                          .value
                                                          .useofFund &&
                                                  InjectionHelper
                                                          .equityInvestmentController
                                                          .intendedDate
                                                          .value ==
                                                      InjectionHelper
                                                          .equityInvestmentController
                                                          .applicationData
                                                          .value
                                                          .intendedDateDisbursement
                                              ? null
                                              : widget.id != null
                                                  ? () async {
                                                      FirebaseAnalyticsHelper
                                                          .sendAnalyticsEvent(
                                                              "Equity Update Draft Step1");
                                                      await InjectionHelper
                                                          .equityInvestmentController
                                                          .onEditEquityInvestment(
                                                              showSnackbar:
                                                                  false,
                                                              context: context,
                                                              id: widget.id!,
                                                              pagenumber: "1",
                                                              frompage: InjectionHelper
                                                                  .equityInvestmentController
                                                                  .applicationData
                                                                  .value
                                                                  .step!
                                                                  .toInt());
                                                    }
                                                  : () async {
                                                      FirebaseAnalyticsHelper
                                                          .sendAnalyticsEvent(
                                                              "Equity Save Draft Step1");
                                                      await InjectionHelper
                                                          .equityInvestmentController
                                                          .onSubmitEquityInvestment(
                                                              showSnackbar:
                                                                  false,
                                                              context: context,
                                                              type: "1");
                                                    },
                                          title: widget.id == null
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
    if (InjectionHelper.equityInvestmentController.financingAmoung.value != 0 &&
        InjectionHelper.equityInvestmentController.intendedDate.value != '' &&
        InjectionHelper.equityInvestmentController.useOfFund.value != '') {
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
                widget.id != null ? "Updating..." : "Submitting...",
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
