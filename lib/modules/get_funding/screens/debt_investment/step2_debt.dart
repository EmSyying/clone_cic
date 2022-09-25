import 'dart:io';
import 'package:cicgreenloan/Utils/helper/format_number.dart';
import 'package:cicgreenloan/Utils/option_controller/option_controller.dart';
import 'package:cicgreenloan/modules/get_funding/models/equatable_debt_model.dart';
import 'package:cicgreenloan/Utils/helper/option_model/option_model.dart';
import 'package:cicgreenloan/modules/get_funding/controller/debt_investment_controller.dart';
import 'package:cicgreenloan/modules/get_funding/models/loan_option.dart';
import 'package:cicgreenloan/utils/chart/custom_circle_chart_1_3.dart';
import 'package:cicgreenloan/utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/utils/form_builder/custom_drop_down.dart';
import 'package:cicgreenloan/utils/form_builder/custom_form_card.dart';
import 'package:cicgreenloan/utils/form_builder/custom_textformfield.dart';
import 'package:cicgreenloan/utils/form_builder/dropdow_item.dart';
import 'package:cicgreenloan/utils/pop_up_alert/show_alert_dialog.dart';
import 'package:cicgreenloan/utils/select_address/address_model/address.dart';
import 'package:cicgreenloan/utils/select_address/address_model/full_address_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../Utils/function/format_date_time.dart';
import '../../../../Utils/helper/container_partern.dart';
import '../../../../Utils/helper/custom_appbar_colorswhite.dart';
import '../../../../Utils/helper/firebase_analytics.dart';
import '../../../../Utils/helper/numerice_format.dart';
import '../../../../utils/function/format_to_k.dart';
import '../../../../widgets/get_funding/custom_add_other_label.dart';
import '../../../../widgets/get_funding/custom_call_center.dart';

class Step2Debt extends StatefulWidget {
  final int? id;
  final int? step;
  const Step2Debt({
    Key? key,
    this.id,
    this.step,
  }) : super(key: key);

  @override
  State<Step2Debt> createState() => _Step2DebtState();
}

class _Step2DebtState extends State<Step2Debt> {
  final debtCon = Get.put(DebtInvestmentController());
  final optionCon = Get.put(DocumentCategory());
  TextEditingController txtFinanceController = TextEditingController();
  String validateText = '';
  bool isEnable = false;

  void isValidate() {
    if (debtCon.financingPurpose.value.display == null) {
      debtCon.isValidateFnancingPurpose.value = false;
    } else {
      debtCon.isValidateFnancingPurpose.value = true;
    }
    if (debtCon.productType.value.productName == null) {
      debtCon.isValidateProductType.value = false;
    } else {
      debtCon.isValidateProductType.value = true;
    }
    if (debtCon.financingAmount.value >
        debtCon.optionData.value.financingAmount!.maximum!) {
      debtCon.isValidateFinancingAmount.value = false;
      validateText =
          "Financing amount must between \$${debtCon.optionData.value.financingAmount!.minimum!} - \$${debtCon.optionData.value.financingAmount!.maximum!}";
    }
    if (debtCon.financingAmount.value > 0 &&
        debtCon.financingAmount.value <
            debtCon.optionData.value.financingAmount!.minimum!) {
      debtCon.isValidateFinancingAmount.value = false;
      validateText =
          "Financing amount must between \$${debtCon.optionData.value.financingAmount!.minimum!} - \$${debtCon.optionData.value.financingAmount!.maximum!}";
    }

    if (debtCon.financingAmount.value == 0.0) {
      debtCon.isValidateFinancingAmount.value = false;
      validateText = "Please enter Financing Amount (USD)";
    }
    if (debtCon.term.value == 0) {
      debtCon.isValidateTerm.value = false;
    } else {
      debtCon.isValidateTerm.value = true;
    }
    if (debtCon.intendedDate.value == "") {
      debtCon.isValidateIntendedDate.value = false;
    } else {
      debtCon.isValidateIntendedDate.value = true;
    }

    if (debtCon.financingAmount.value >=
            debtCon.optionData.value.financingAmount!.minimum! &&
        debtCon.financingAmount.value <=
            debtCon.optionData.value.financingAmount!.maximum!) {
      if (debtCon.financingPurpose.value.display != null &&
          debtCon.financingAmount.value != 0.0 &&
          debtCon.term.value != 0 &&
          debtCon.intendedDate.value != "" &&
          debtCon.isValidateTermAmount.value == false) {
        FocusScope.of(context).unfocus();
        context.push(
            "/get_funding/debt-step3?id=${widget.id}&&step=${widget.step}");
      }
    }
  }

  DebtStep2Model defaultData = DebtStep2Model();
  DebtStep2Model tempData = DebtStep2Model();

  @override
  void initState() {
    debtCon.fetchLoanOption();
    debtCon.fetchOptionData(id: 1);
    debtCon.productType.value.id = 1;
    if (widget.id != null) {
      isEnable = true;
      if (widget.id != null) {
        debtCon.fetchAppDetails(widget.id!).then((value) {
          debtCon.fetchOptionData(id: value.productType!.id!.toInt());

          // ============initial step1 =============
          if (debtCon.applicationDetail.value.customerInfo!.customerGender !=
              null) {
            debtCon.gender.value.display = debtCon
                .applicationDetail.value.customerInfo!.customerGender!.display;
            debtCon.gender.value.id = debtCon
                .applicationDetail.value.customerInfo!.customerGender!.id;
          }

          if (debtCon.applicationDetail.value.customerInfo!.customerName !=
              "") {
            debtCon.fullName.value =
                debtCon.applicationDetail.value.customerInfo!.customerName!;
          }

          if (debtCon.applicationDetail.value.customerInfo!.customerEmail !=
              "") {
            debtCon.email.value =
                debtCon.applicationDetail.value.customerInfo!.customerEmail!;
          }
          if (debtCon
                  .applicationDetail.value.customerInfo!.customerDateOfBirth !=
              "") {
            debtCon.dateOfBirth.value = debtCon
                .applicationDetail.value.customerInfo!.customerDateOfBirth!;
          }
          // Address
          if (debtCon.applicationDetail.value.customerInfo!.currentHouseNo !=
              null) {
            debtCon.fullCurrentAddress.value.houseNo =
                debtCon.applicationDetail.value.customerInfo!.currentHouseNo;
          }
          if (debtCon.applicationDetail.value.customerInfo!.currentStreetNo !=
              null) {
            debtCon.fullCurrentAddress.value.streetNo =
                debtCon.applicationDetail.value.customerInfo!.currentStreetNo;
          }

          if (debtCon.applicationDetail.value.customerInfo!.currentAddress !=
              null) {
            debtCon.fullCurrentAddress.value = FullAddress(
              houseNo: debtCon
                      .applicationDetail.value.customerInfo!.currentHouseNo ??
                  "",
              streetNo: debtCon
                      .applicationDetail.value.customerInfo!.currentStreetNo ??
                  "",
              addressList: [
                Address(
                  code: debtCon.applicationDetail.value.customerInfo!
                      .currentAddress!.city!.code,
                  name: debtCon.applicationDetail.value.customerInfo!
                      .currentAddress!.city!.name,
                ),
                Address(
                  code: debtCon.applicationDetail.value.customerInfo!
                      .currentAddress!.district!.code,
                  name: debtCon.applicationDetail.value.customerInfo!
                      .currentAddress!.district!.name,
                ),
                Address(
                  code: debtCon.applicationDetail.value.customerInfo!
                      .currentAddress!.commune!.code,
                  name: debtCon.applicationDetail.value.customerInfo!
                      .currentAddress!.commune!.name,
                ),
                Address(
                  code: debtCon.applicationDetail.value.customerInfo!
                      .currentAddress!.village!.code,
                  name: debtCon.applicationDetail.value.customerInfo!
                      .currentAddress!.village!.name,
                ),
              ],
            );
          }
          if (debtCon.applicationDetail.value.customerInfo!.residenceAddress !=
              null) {
            debtCon.fullResidentAddress.value = FullAddress(
              houseNo: debtCon
                      .applicationDetail.value.customerInfo!.residenceHouseNo ??
                  "",
              streetNo: debtCon.applicationDetail.value.customerInfo!
                      .residenceStreetNo ??
                  "",
              addressList: [
                Address(
                  code: debtCon.applicationDetail.value.customerInfo!
                      .residenceAddress!.city!.code,
                  name: debtCon.applicationDetail.value.customerInfo!
                      .residenceAddress!.city!.name,
                ),
                Address(
                  code: debtCon.applicationDetail.value.customerInfo!
                      .residenceAddress!.district!.code,
                  name: debtCon.applicationDetail.value.customerInfo!
                      .residenceAddress!.district!.name,
                ),
                Address(
                  code: debtCon.applicationDetail.value.customerInfo!
                      .residenceAddress!.commune!.code,
                  name: debtCon.applicationDetail.value.customerInfo!
                      .residenceAddress!.commune!.name,
                ),
                Address(
                  code: debtCon.applicationDetail.value.customerInfo!
                      .residenceAddress!.village!.code,
                  name: debtCon.applicationDetail.value.customerInfo!
                      .residenceAddress!.village!.name,
                ),
              ],
            );
          }

          // =============End initial step1 =============
          debtCon.productType.value =
              debtCon.applicationDetail.value.productType != null
                  ? Option(
                      productName:
                          debtCon.applicationDetail.value.productType!.name,
                      id: debtCon.applicationDetail.value.productType!.id!
                          .toInt(),
                    )
                  : Option(id: 0, productName: null);
          debtCon.financingPurpose.value =
              debtCon.applicationDetail.value.financialPurpose != null
                  ? Optionmodel(
                      display: debtCon
                          .applicationDetail.value.financialPurpose!.display,
                      id: debtCon.applicationDetail.value.financialPurpose!.id,
                    )
                  : Optionmodel(id: 0, display: null);
          debtCon.financingPurpose.value.display =
              debtCon.applicationDetail.value.financialPurpose!.display;

          ///
          var displayfinancialAmount = FormatNumber.formatNumberDefualt(
              debtCon.applicationDetail.value.financialAmount!);
          debtCon.financingAmountcontroller.text =
              debtCon.applicationDetail.value.financialAmount == 0
                  ? ""
                  : displayfinancialAmount.toString();

          ///
          debtCon.financingAmount.value =
              debtCon.applicationDetail.value.financialAmount!.toDouble();

          debtCon.termController.text =
              debtCon.applicationDetail.value.duration == 0
                  ? ""
                  : debtCon.applicationDetail.value.duration!.toString();
          debtCon.term.value =
              debtCon.applicationDetail.value.duration!.toInt();
          debtCon.intendedDate.value = debtCon
              .applicationDetail.value.intendedDateDisbursement
              .toString();

          defaultData = DebtStep2Model(
            financingAmount: debtCon.financingAmount.value,
            productType: debtCon.productType.value,
            financingPurpose: debtCon.financingPurpose.value,
            intendedDate: debtCon.intendedDate.value,
            term: debtCon.term.value,
            addNewFinancingPurpose: debtCon.financingPurpose.value.display,
          );
          tempData = DebtStep2Model(
            financingAmount: debtCon.financingAmount.value,
            productType: debtCon.productType.value,
            financingPurpose: debtCon.financingPurpose.value,
            intendedDate: debtCon.intendedDate.value,
            term: debtCon.term.value,
            addNewFinancingPurpose: debtCon.financingPurpose.value.display,
          );
        });
      }
    }
    super.initState();
  }

  setValidate() {
    debtCon.isValidateProductType.value = true;
    debtCon.isValidateFnancingPurpose.value = true;
    debtCon.isValidateFinancingAmount.value = true;
    debtCon.isValidateIntendedDate.value = true;
    debtCon.isValidateTerm.value = true;
  }

  DateTime dt1 = DateTime.parse(FormatDate.today().toString());
  TextEditingController addNewFinancingPurpose = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CupertinoScaffold(
      body: Builder(
        builder: (context) => CupertinoPageScaffold(
          child: Obx(
            () => debtCon.isLoadingSubmit.value
                ? Scaffold(
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
                                strokeWidth: 4,
                              ),
                            ),
                            const SizedBox(height: padding),
                            Text(
                              widget.id != null
                                  ? "Updating Draft..."
                                  : "Saving Draft...",
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : Scaffold(
                    resizeToAvoidBottomInset: false,
                    appBar: debtCon.isSubmitLoading.value == true
                        ? AppBar()
                        : CustomAppBarWhiteColor(
                            leading: IconButton(
                              onPressed: tempData == defaultData
                                  ? () {
                                      setValidate();
                                      FocusScope.of(context).unfocus();
                                      Navigator.pop(context);
                                    }
                                  : () {
                                      setValidate();
                                      FocusScope.of(context).unfocus();
                                      showSaveDraftDialog(
                                        context: context,
                                        isCancel: true,
                                        onSaveTitle: widget.id != null
                                            ? "Update Draft"
                                            : "Save Draft",
                                        content:
                                            'Changes made to this page haven’t been saved yet.',
                                        title:
                                            'Are you sure you want to leave this page?',
                                        onSave: () async {
                                          Navigator.pop(context);
                                          widget.id != null
                                              ? await debtCon
                                                  .onEditDebtInvestment(
                                                      id: widget.id,
                                                      context: context,
                                                      step: 2,
                                                      frompage: debtCon
                                                          .applicationDetail
                                                          .value
                                                          .step!
                                                          .toInt())
                                              : await debtCon
                                                  .onSubmitDebtInvestment(
                                                      context: context,
                                                      step: 2);
                                        },
                                        onDiscard: () {
                                          setValidate();
                                          context.go("/get_funding");
                                        },
                                      );
                                    },
                              icon: Icon(
                                kIsWeb
                                    ? Icons.arrow_back
                                    : Platform.isAndroid
                                        ? Icons.arrow_back
                                        : Icons.arrow_back_ios,
                                color: Colors.black,
                              ),
                            ),
                            context: context,
                            title: 'Debt Investment',
                            action: [
                              const CustomCallCenter(),
                              const CustomCircleChart(
                                isDebtInvestment: true,
                                numberPage: 2,
                              ),
                              const SizedBox(
                                width: 20,
                              )
                            ],
                          ),
                    body: Obx(
                      () => debtCon.isLoadingData.value
                          ? const LinearProgressIndicator()
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20),
                                  child: Text(
                                    'Financing Information',
                                    style:
                                        Theme.of(context).textTheme.headline2,
                                  ),
                                ),
                                Expanded(
                                  child: CustomFormCard(
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 20),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          CICDropdown(
                                            onCreateCompany: () {
                                              Navigator.pop(context);
                                              addNewFinancingPurpose.text = "";
                                              onShowAddOtherLabel(
                                                title: "Add Other",
                                                onBack: () {
                                                  Navigator.pop(context);
                                                },
                                                onCancel: () {
                                                  Navigator.pop(context);
                                                },
                                                onSave: () {
                                                  setState(() {
                                                    debtCon.financingPurpose
                                                            .value.display =
                                                        addNewFinancingPurpose
                                                            .text;

                                                    if (addNewFinancingPurpose
                                                            .text !=
                                                        "") {
                                                      debtCon.financingPurpose
                                                          .value.id = null;
                                                    }
                                                  });
                                                  Navigator.pop(context);
                                                },
                                                context: context,
                                                textFieldHere:
                                                    CustomTextFieldNew(
                                                  controller:
                                                      addNewFinancingPurpose,
                                                  hintText: 'Financing Purpose',
                                                  labelText:
                                                      'Financing Purpose',
                                                ),
                                              );
                                            },
                                            isCompany: true,
                                            otherLabel: "Add Other",
                                            isValidate: debtCon
                                                .isValidateFnancingPurpose
                                                .value,
                                            validate: true,
                                            colors: Colors.white,
                                            item: optionCon
                                                .optionData.value.purpose!
                                                .asMap()
                                                .entries
                                                .map((e) {
                                              return DropDownItem(
                                                itemList: {
                                                  "Name": e.value.display!,
                                                  "Code": e.value.id.toString()
                                                },
                                              );
                                            }).toList(),
                                            onChange: (value) {
                                              setState(() {
                                                tempData.financingPurpose =
                                                    Optionmodel(
                                                  id: int.parse(value["Code"]),
                                                  display: value["Name"],
                                                );

                                                debtCon.financingPurpose.value =
                                                    Optionmodel(
                                                  display: value["Name"],
                                                  id: int.parse(value["Code"]),
                                                );
                                                debtCon
                                                    .isValidateFnancingPurpose
                                                    .value = true;
                                              });
                                            },
                                            label: 'Financing Purpose',
                                            defaultValue: debtCon
                                                        .financingPurpose
                                                        .value
                                                        .display !=
                                                    null
                                                ? {
                                                    "Name": debtCon
                                                        .financingPurpose
                                                        .value
                                                        .display,
                                                    "Code": debtCon
                                                        .financingPurpose
                                                        .value
                                                        .id
                                                  }
                                                : null,
                                          ),
                                          const SizedBox(height: 10),
                                          CustomTextFieldNew(
                                            inputFormatterList: [
                                              FilteringTextInputFormatter
                                                  .digitsOnly,
                                              NumericTextFormatter(),
                                              FilteringTextInputFormatter.deny(
                                                  RegExp(r'^0+')),
                                            ],
                                            controller: debtCon
                                                .financingAmountcontroller,
                                            validateText: validateText,
                                            textInputAction:
                                                TextInputAction.next,
                                            isRequired: true,
                                            isValidate: debtCon
                                                .isValidateFinancingAmount
                                                .value,
                                            labelText:
                                                'Financing Amount (USD) ',
                                            hintText: 'Financing Amount (USD) ',
                                            onChange: (valueChnaged) {
                                              var value = valueChnaged
                                                  .replaceAll(',', '');
                                              if (value.isNotEmpty) {
                                                tempData.financingAmount =
                                                    int.parse(value);
                                                int val = int.parse(value);
                                                if (val <
                                                    debtCon
                                                        .optionData
                                                        .value
                                                        .financingAmount!
                                                        .minimum!) {
                                                  debtCon
                                                      .isValidateFinancingAmount
                                                      .value = false;
                                                  setState(() {
                                                    validateText =
                                                        "Financing amount is starting from \$${FormatToK.digitNumber(debtCon.optionData.value.financingAmount!.minimum!)}";
                                                  });
                                                } else {
                                                  setState(() {
                                                    debtCon.financingAmount
                                                            .value =
                                                        double.parse(value);
                                                  });
                                                  debtCon
                                                      .isValidateFinancingAmount
                                                      .value = true;
                                                }
                                                if (val >
                                                    debtCon
                                                        .optionData
                                                        .value
                                                        .financingAmount!
                                                        .maximum!) {
                                                  debtCon
                                                      .isValidateFinancingAmount
                                                      .value = false;
                                                  debtCon.financingAmount
                                                      .value = 0.0;
                                                  setState(() {
                                                    validateText =
                                                        "Financing amount must between \$${FormatToK.digitNumber(debtCon.optionData.value.financingAmount!.minimum!)} - \$${FormatToK.digitNumber(debtCon.optionData.value.financingAmount!.maximum!)}";
                                                  });
                                                } else {
                                                  setState(() {
                                                    debtCon.financingAmount
                                                            .value =
                                                        double.parse(value);
                                                  });
                                                }
                                              } else {
                                                debtCon.financingAmount.value =
                                                    0.0;
                                                debtCon
                                                    .isValidateFinancingAmount
                                                    .value = false;
                                                setState(() {
                                                  validateText =
                                                      "Please enter Financing Amount (USD)";
                                                });
                                              }
                                              setState(() {
                                                tempData.financingAmount =
                                                    debtCon
                                                        .financingAmount.value;
                                              });
                                            },
                                            keyboardType: const TextInputType
                                                    .numberWithOptions(
                                                decimal: true),
                                            initialValue: debtCon
                                                        .financingAmount
                                                        .value ==
                                                    0.0
                                                ? ''
                                                : debtCon.financingAmount.value
                                                    .toString(),
                                          ),
                                          CustomTextFieldNew(
                                            inputFormatterList: [
                                              FilteringTextInputFormatter
                                                  .digitsOnly,
                                              FilteringTextInputFormatter.deny(
                                                  RegExp(r'^0+')),
                                            ],
                                            isRequired: true,
                                            controller: debtCon.termController,
                                            isValidate:
                                                debtCon.isValidateTerm.value,
                                            labelText: 'Term (Months) ',
                                            hintText: 'Term (Months) ',
                                            onChange: (value) {
                                              if (value.isNotEmpty) {
                                                setState(() {
                                                  tempData.term =
                                                      int.parse(value);
                                                });
                                                setState(() {
                                                  debtCon.isValidateTerm.value =
                                                      true;
                                                  debtCon.term.value =
                                                      int.parse(value);
                                                  if (debtCon.term.value <
                                                          debtCon
                                                              .optionData
                                                              .value
                                                              .duration!
                                                              .minimum! ||
                                                      debtCon.term.value >
                                                          debtCon
                                                              .optionData
                                                              .value
                                                              .duration!
                                                              .maximum!) {
                                                    debtCon.isValidateTermAmount
                                                        .value = true;
                                                  } else {
                                                    debtCon.isValidateTermAmount
                                                        .value = false;
                                                  }
                                                });
                                              } else {
                                                debtCon.isValidateTerm(false);
                                                debtCon.term.value = 0;
                                                setState(() {
                                                  tempData.term = 0;
                                                });
                                              }
                                            },
                                            keyboardType: const TextInputType
                                                    .numberWithOptions(
                                                decimal: true),
                                            initialValue: debtCon.term.value
                                                        .toString() !=
                                                    "0"
                                                ? debtCon.term.value.toString()
                                                : "",
                                          ),
                                          if (debtCon
                                                  .isValidateTermAmount.value &&
                                              debtCon.isValidateTerm.value ==
                                                  true)
                                            Container(
                                              padding: const EdgeInsets.only(
                                                left: 20,
                                              ),
                                              child: CustomValidateError(
                                                validateTitle:
                                                    'Term amount must be between ${debtCon.optionData.value.duration!.minimum!} and ${debtCon.optionData.value.duration!.maximum!}',
                                              ),
                                            ),
                                          CICDropdown(
                                            // isEnable: !isEnable,
                                            currentDate: widget.id != null &&
                                                    dt1.isAfter(
                                                      debtCon.intendedDate
                                                                  .value ==
                                                              ""
                                                          ? DateTime(
                                                              dt1.year,
                                                              dt1.month,
                                                              dt1.day)
                                                          : DateFormat(
                                                                  "dd-MM-yyyy")
                                                              .parse(debtCon
                                                                  .intendedDate
                                                                  .value),
                                                    )
                                                ? DateFormat("dd-MM-yyyy")
                                                    .parse(debtCon
                                                        .intendedDate.value)
                                                : FormatDate.today(),
                                            isValidate: debtCon
                                                .isValidateIntendedDate.value,
                                            label:
                                                'Intended Date of Disbursement​',
                                            onChange: (value) {
                                              debtCon.whenOnchangeDate.value =
                                                  value["Name"];
                                              debtCon.intendedDate.value =
                                                  value["Name"];
                                              debtCon.isValidateIntendedDate
                                                  .value = true;
                                              setState(() {
                                                tempData.intendedDate =
                                                    debtCon.intendedDate.value;
                                              });
                                            },
                                            defaultValue:
                                                debtCon.intendedDate.value == ''
                                                    ? null
                                                    : {
                                                        'Name': debtCon
                                                                    .whenOnchangeDate
                                                                    .value ==
                                                                ""
                                                            ? FormatDate
                                                                .formatDateTimeGetfunding(
                                                                    debtCon
                                                                        .intendedDate
                                                                        .value)
                                                            : debtCon
                                                                .intendedDate
                                                                .value,
                                                        'Code': '02'
                                                      },
                                            isDateTimePicker: true,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 20, right: 20, bottom: 30, top: 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: CustomButton(
                                          isDisable: tempData == defaultData &&
                                                  addNewFinancingPurpose.text ==
                                                      ""
                                              ? true
                                              : debtCon.productType.value
                                                              .productName ==
                                                          null &&
                                                      debtCon.financingAmount
                                                              .value ==
                                                          0.0 &&
                                                      debtCon.term.value == 0 &&
                                                      debtCon.intendedDate
                                                              .value ==
                                                          ""
                                                  ? true
                                                  : false,
                                          isOutline: true,
                                          onPressed: () async {
                                            setValidate();
                                            FocusScope.of(context).unfocus();
                                            if (widget.id != null) {
                                              FirebaseAnalyticsHelper
                                                  .sendAnalyticsEvent(
                                                      "Debt Update Draft Step2");
                                            } else {
                                              FirebaseAnalyticsHelper
                                                  .sendAnalyticsEvent(
                                                      "Debt Save Draft Step2");
                                            }
                                            widget.id != null
                                                ? await debtCon
                                                    .onEditDebtInvestment(
                                                        showDebtSnackbar: false,
                                                        id: widget.id,
                                                        context: context,
                                                        frompage: debtCon
                                                            .applicationDetail
                                                            .value
                                                            .step!
                                                            .toInt(),
                                                        step: 2)
                                                : await debtCon
                                                    .onSubmitDebtInvestment(
                                                        showDebtSnackbar: false,
                                                        context: context,
                                                        step: 2);
                                          },
                                          title: widget.id != null
                                              ? "Update Draft"
                                              : "Save Draft",
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        child: CustomButton(
                                          isDisable: false,
                                          isOutline: false,
                                          onPressed: () {
                                            isValidate();
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
}

class CustomValidateError extends StatelessWidget {
  final String? validateTitle;
  const CustomValidateError({Key? key, this.validateTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          const Icon(
            Icons.error,
            color: Colors.red,
            size: 20,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            validateTitle!,
            style: const TextStyle(
                color: Colors.red, fontSize: 12, fontFamily: 'DMSans'),
          ),
        ],
      ),
    );
  }
}
