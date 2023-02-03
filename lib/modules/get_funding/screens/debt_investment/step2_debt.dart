import 'dart:io';
import 'package:cicgreenloan/Utils/helper/format_number.dart';
import 'package:cicgreenloan/modules/get_funding/models/equatable_debt_model.dart';
import 'package:cicgreenloan/Utils/helper/option_model/option_model.dart';
import 'package:cicgreenloan/modules/get_funding/models/loan_option.dart';
import 'package:cicgreenloan/utils/chart/custom_circle_chart_1_3.dart';
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

import '../../../../Utils/form_builder/custom_button.dart';
import '../../../../Utils/function/format_date_time.dart';
import '../../../../Utils/helper/container_partern.dart';
import '../../../../Utils/helper/custom_appbar_colorswhite.dart';
import '../../../../Utils/helper/firebase_analytics.dart';
import '../../../../Utils/helper/injection_helper/injection_helper.dart';
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
  TextEditingController txtFinanceController = TextEditingController();
  String validateText = '';
  bool isEnable = false;

  void isValidate() {
    if (InjectionHelper
            .debtInvestmentController.financingPurpose.value.display ==
        null) {
      InjectionHelper.debtInvestmentController.isValidateFnancingPurpose.value =
          false;
    } else {
      InjectionHelper.debtInvestmentController.isValidateFnancingPurpose.value =
          true;
    }
    if (InjectionHelper
            .debtInvestmentController.productType.value.productName ==
        null) {
      InjectionHelper.debtInvestmentController.isValidateProductType.value =
          false;
    } else {
      InjectionHelper.debtInvestmentController.isValidateProductType.value =
          true;
    }
    if (InjectionHelper.debtInvestmentController.financingAmount.value >
        InjectionHelper.debtInvestmentController.optionData.value
            .financingAmount!.maximum!) {
      InjectionHelper.debtInvestmentController.isValidateFinancingAmount.value =
          false;
      validateText =
          "Financing amount must between \$${InjectionHelper.debtInvestmentController.optionData.value.financingAmount!.minimum!} - \$${InjectionHelper.debtInvestmentController.optionData.value.financingAmount!.maximum!}";
    }
    if (InjectionHelper.debtInvestmentController.financingAmount.value > 0 &&
        InjectionHelper.debtInvestmentController.financingAmount.value <
            InjectionHelper.debtInvestmentController.optionData.value
                .financingAmount!.minimum!) {
      InjectionHelper.debtInvestmentController.isValidateFinancingAmount.value =
          false;
      validateText =
          "Financing amount must between \$${InjectionHelper.debtInvestmentController.optionData.value.financingAmount!.minimum!} - \$${InjectionHelper.debtInvestmentController.optionData.value.financingAmount!.maximum!}";
    }

    if (InjectionHelper.debtInvestmentController.financingAmount.value == 0.0) {
      InjectionHelper.debtInvestmentController.isValidateFinancingAmount.value =
          false;
      validateText = "Please enter Financing Amount (USD)";
    }
    if (InjectionHelper.debtInvestmentController.term.value == 0) {
      InjectionHelper.debtInvestmentController.isValidateTerm.value = false;
    } else {
      InjectionHelper.debtInvestmentController.isValidateTerm.value = true;
    }
    if (InjectionHelper.debtInvestmentController.intendedDate.value == "") {
      InjectionHelper.debtInvestmentController.isValidateIntendedDate.value =
          false;
    } else {
      InjectionHelper.debtInvestmentController.isValidateIntendedDate.value =
          true;
    }

    if (InjectionHelper.debtInvestmentController.financingAmount.value >=
            InjectionHelper.debtInvestmentController.optionData.value
                .financingAmount!.minimum! &&
        InjectionHelper.debtInvestmentController.financingAmount.value <=
            InjectionHelper.debtInvestmentController.optionData.value
                .financingAmount!.maximum!) {
      if (InjectionHelper
                  .debtInvestmentController.financingPurpose.value.display !=
              null &&
          InjectionHelper.debtInvestmentController.financingAmount.value !=
              0.0 &&
          InjectionHelper.debtInvestmentController.term.value != 0 &&
          InjectionHelper.debtInvestmentController.intendedDate.value != "" &&
          InjectionHelper.debtInvestmentController.isValidateTermAmount.value ==
              false) {
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
    InjectionHelper.debtInvestmentController.fetchLoanOption();
    InjectionHelper.debtInvestmentController.fetchOptionData(id: 1);
    InjectionHelper.debtInvestmentController.productType.value.id = 1;
    if (widget.id != null) {
      isEnable = true;
      if (widget.id != null) {
        InjectionHelper.debtInvestmentController
            .fetchAppDetails(widget.id!)
            .then((value) {
          InjectionHelper.debtInvestmentController
              .fetchOptionData(id: value.productType!.id!.toInt());

          // ============initial step1 =============
          if (InjectionHelper.debtInvestmentController.applicationDetail.value
                  .customerInfo!.customerGender !=
              null) {
            InjectionHelper.debtInvestmentController.gender.value.display =
                InjectionHelper.debtInvestmentController.applicationDetail.value
                    .customerInfo!.customerGender!.display;
            InjectionHelper.debtInvestmentController.gender.value.id =
                InjectionHelper.debtInvestmentController.applicationDetail.value
                    .customerInfo!.customerGender!.id;
          }

          if (InjectionHelper.debtInvestmentController.applicationDetail.value
                  .customerInfo!.customerName !=
              "") {
            InjectionHelper.debtInvestmentController.fullName.value =
                InjectionHelper.debtInvestmentController.applicationDetail.value
                    .customerInfo!.customerName!;
          }

          if (InjectionHelper.debtInvestmentController.applicationDetail.value
                  .customerInfo!.customerEmail !=
              "") {
            InjectionHelper.debtInvestmentController.email.value =
                InjectionHelper.debtInvestmentController.applicationDetail.value
                    .customerInfo!.customerEmail!;
          }
          if (InjectionHelper.debtInvestmentController.applicationDetail.value
                  .customerInfo!.customerDateOfBirth !=
              "") {
            InjectionHelper.debtInvestmentController.dateOfBirth.value =
                InjectionHelper.debtInvestmentController.applicationDetail.value
                    .customerInfo!.customerDateOfBirth!;
          }
          // Address
          if (InjectionHelper.debtInvestmentController.applicationDetail.value
                  .customerInfo!.currentHouseNo !=
              null) {
            InjectionHelper
                    .debtInvestmentController.fullCurrentAddress.value.houseNo =
                InjectionHelper.debtInvestmentController.applicationDetail.value
                    .customerInfo!.currentHouseNo;
          }
          if (InjectionHelper.debtInvestmentController.applicationDetail.value
                  .customerInfo!.currentStreetNo !=
              null) {
            InjectionHelper.debtInvestmentController.fullCurrentAddress.value
                    .streetNo =
                InjectionHelper.debtInvestmentController.applicationDetail.value
                    .customerInfo!.currentStreetNo;
          }

          if (InjectionHelper.debtInvestmentController.applicationDetail.value
                  .customerInfo!.currentAddress !=
              null) {
            InjectionHelper.debtInvestmentController.fullCurrentAddress.value =
                FullAddress(
              houseNo: InjectionHelper.debtInvestmentController
                      .applicationDetail.value.customerInfo!.currentHouseNo ??
                  "",
              streetNo: InjectionHelper.debtInvestmentController
                      .applicationDetail.value.customerInfo!.currentStreetNo ??
                  "",
              addressList: [
                Address(
                  code: InjectionHelper
                      .debtInvestmentController
                      .applicationDetail
                      .value
                      .customerInfo!
                      .currentAddress!
                      .city!
                      .code,
                  name: InjectionHelper
                      .debtInvestmentController
                      .applicationDetail
                      .value
                      .customerInfo!
                      .currentAddress!
                      .city!
                      .name,
                ),
                Address(
                  code: InjectionHelper
                      .debtInvestmentController
                      .applicationDetail
                      .value
                      .customerInfo!
                      .currentAddress!
                      .district!
                      .code,
                  name: InjectionHelper
                      .debtInvestmentController
                      .applicationDetail
                      .value
                      .customerInfo!
                      .currentAddress!
                      .district!
                      .name,
                ),
                Address(
                  code: InjectionHelper
                      .debtInvestmentController
                      .applicationDetail
                      .value
                      .customerInfo!
                      .currentAddress!
                      .commune!
                      .code,
                  name: InjectionHelper
                      .debtInvestmentController
                      .applicationDetail
                      .value
                      .customerInfo!
                      .currentAddress!
                      .commune!
                      .name,
                ),
                Address(
                  code: InjectionHelper
                      .debtInvestmentController
                      .applicationDetail
                      .value
                      .customerInfo!
                      .currentAddress!
                      .village!
                      .code,
                  name: InjectionHelper
                      .debtInvestmentController
                      .applicationDetail
                      .value
                      .customerInfo!
                      .currentAddress!
                      .village!
                      .name,
                ),
              ],
            );
          }
          if (InjectionHelper.debtInvestmentController.applicationDetail.value
                  .customerInfo!.residenceAddress !=
              null) {
            InjectionHelper.debtInvestmentController.fullResidentAddress.value =
                FullAddress(
              houseNo: InjectionHelper.debtInvestmentController
                      .applicationDetail.value.customerInfo!.residenceHouseNo ??
                  "",
              streetNo: InjectionHelper
                      .debtInvestmentController
                      .applicationDetail
                      .value
                      .customerInfo!
                      .residenceStreetNo ??
                  "",
              addressList: [
                Address(
                  code: InjectionHelper
                      .debtInvestmentController
                      .applicationDetail
                      .value
                      .customerInfo!
                      .residenceAddress!
                      .city!
                      .code,
                  name: InjectionHelper
                      .debtInvestmentController
                      .applicationDetail
                      .value
                      .customerInfo!
                      .residenceAddress!
                      .city!
                      .name,
                ),
                Address(
                  code: InjectionHelper
                      .debtInvestmentController
                      .applicationDetail
                      .value
                      .customerInfo!
                      .residenceAddress!
                      .district!
                      .code,
                  name: InjectionHelper
                      .debtInvestmentController
                      .applicationDetail
                      .value
                      .customerInfo!
                      .residenceAddress!
                      .district!
                      .name,
                ),
                Address(
                  code: InjectionHelper
                      .debtInvestmentController
                      .applicationDetail
                      .value
                      .customerInfo!
                      .residenceAddress!
                      .commune!
                      .code,
                  name: InjectionHelper
                      .debtInvestmentController
                      .applicationDetail
                      .value
                      .customerInfo!
                      .residenceAddress!
                      .commune!
                      .name,
                ),
                Address(
                  code: InjectionHelper
                      .debtInvestmentController
                      .applicationDetail
                      .value
                      .customerInfo!
                      .residenceAddress!
                      .village!
                      .code,
                  name: InjectionHelper
                      .debtInvestmentController
                      .applicationDetail
                      .value
                      .customerInfo!
                      .residenceAddress!
                      .village!
                      .name,
                ),
              ],
            );
          }

          // =============End initial step1 =============
          InjectionHelper.debtInvestmentController.productType.value =
              InjectionHelper.debtInvestmentController.applicationDetail.value
                          .productType !=
                      null
                  ? Option(
                      productName: InjectionHelper.debtInvestmentController
                          .applicationDetail.value.productType!.name,
                      id: InjectionHelper.debtInvestmentController
                          .applicationDetail.value.productType!.id!
                          .toInt(),
                    )
                  : Option(id: 0, productName: null);
          InjectionHelper.debtInvestmentController.financingPurpose.value =
              InjectionHelper.debtInvestmentController.applicationDetail.value
                          .financialPurpose !=
                      null
                  ? Optionmodel(
                      display: InjectionHelper.debtInvestmentController
                          .applicationDetail.value.financialPurpose!.display,
                      id: InjectionHelper.debtInvestmentController
                          .applicationDetail.value.financialPurpose!.id,
                    )
                  : Optionmodel(id: 0, display: null);
          InjectionHelper
                  .debtInvestmentController.financingPurpose.value.display =
              InjectionHelper.debtInvestmentController.applicationDetail.value
                  .financialPurpose!.display;

          ///
          var displayfinancialAmount = FormatNumber.formatNumberDefualt(
              InjectionHelper.debtInvestmentController.applicationDetail.value
                  .financialAmount!);
          InjectionHelper.debtInvestmentController.financingAmountcontroller
              .text = InjectionHelper.debtInvestmentController.applicationDetail
                      .value.financialAmount ==
                  0
              ? ""
              : displayfinancialAmount.toString();

          ///
          InjectionHelper.debtInvestmentController.financingAmount.value =
              InjectionHelper.debtInvestmentController.applicationDetail.value
                  .financialAmount!
                  .toDouble();

          InjectionHelper.debtInvestmentController.termController.text =
              InjectionHelper.debtInvestmentController.applicationDetail.value
                          .duration ==
                      0
                  ? ""
                  : InjectionHelper.debtInvestmentController.applicationDetail
                      .value.duration!
                      .toString();
          InjectionHelper.debtInvestmentController.term.value = InjectionHelper
              .debtInvestmentController.applicationDetail.value.duration!
              .toInt();
          InjectionHelper.debtInvestmentController.intendedDate.value =
              InjectionHelper.debtInvestmentController.applicationDetail.value
                  .intendedDateDisbursement
                  .toString();

          defaultData = DebtStep2Model(
            financingAmount:
                InjectionHelper.debtInvestmentController.financingAmount.value,
            productType:
                InjectionHelper.debtInvestmentController.productType.value,
            financingPurpose:
                InjectionHelper.debtInvestmentController.financingPurpose.value,
            intendedDate:
                InjectionHelper.debtInvestmentController.intendedDate.value,
            term: InjectionHelper.debtInvestmentController.term.value,
            addNewFinancingPurpose: InjectionHelper
                .debtInvestmentController.financingPurpose.value.display,
          );
          tempData = DebtStep2Model(
            financingAmount:
                InjectionHelper.debtInvestmentController.financingAmount.value,
            productType:
                InjectionHelper.debtInvestmentController.productType.value,
            financingPurpose:
                InjectionHelper.debtInvestmentController.financingPurpose.value,
            intendedDate:
                InjectionHelper.debtInvestmentController.intendedDate.value,
            term: InjectionHelper.debtInvestmentController.term.value,
            addNewFinancingPurpose: InjectionHelper
                .debtInvestmentController.financingPurpose.value.display,
          );
        });
      }
    }
    super.initState();
  }

  setValidate() {
    InjectionHelper.debtInvestmentController.isValidateProductType.value = true;
    InjectionHelper.debtInvestmentController.isValidateFnancingPurpose.value =
        true;
    InjectionHelper.debtInvestmentController.isValidateFinancingAmount.value =
        true;
    InjectionHelper.debtInvestmentController.isValidateIntendedDate.value =
        true;
    InjectionHelper.debtInvestmentController.isValidateTerm.value = true;
  }

  DateTime dt1 = DateTime.parse(FormatDate.today().toString());
  TextEditingController addNewFinancingPurpose = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CupertinoScaffold(
      body: Builder(
        builder: (context) => CupertinoPageScaffold(
          child: Obx(
            () => InjectionHelper.debtInvestmentController.isLoadingSubmit.value
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
                    appBar: InjectionHelper.debtInvestmentController
                                .isSubmitLoading.value ==
                            true
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
                                          context.pop();
                                          widget.id != null
                                              ? await InjectionHelper
                                                  .debtInvestmentController
                                                  .onEditDebtInvestment(
                                                      id: widget.id,
                                                      context: context,
                                                      step: 2,
                                                      frompage: InjectionHelper
                                                          .debtInvestmentController
                                                          .applicationDetail
                                                          .value
                                                          .step!
                                                          .toInt())
                                              : await InjectionHelper
                                                  .debtInvestmentController
                                                  .onSubmitDebtInvestment(
                                                      context: context,
                                                      step: 2);
                                        },
                                        onDiscard: () {
                                          context.pop();
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
                      () => InjectionHelper
                              .debtInvestmentController.isLoadingData.value
                          ? const LinearProgressIndicator()
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20),
                                  child: Text(
                                    'Financing Information',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium,
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
                                                    InjectionHelper
                                                            .debtInvestmentController
                                                            .financingPurpose
                                                            .value
                                                            .display =
                                                        addNewFinancingPurpose
                                                            .text;

                                                    if (addNewFinancingPurpose
                                                            .text !=
                                                        "") {
                                                      InjectionHelper
                                                          .debtInvestmentController
                                                          .financingPurpose
                                                          .value
                                                          .id = null;
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
                                            isValidate: InjectionHelper
                                                .debtInvestmentController
                                                .isValidateFnancingPurpose
                                                .value,
                                            validate: true,
                                            colors: Colors.white,
                                            item: InjectionHelper
                                                .optionController
                                                .optionData
                                                .value
                                                .purpose!
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

                                                InjectionHelper
                                                    .debtInvestmentController
                                                    .financingPurpose
                                                    .value = Optionmodel(
                                                  display: value["Name"],
                                                  id: int.parse(value["Code"]),
                                                );
                                                InjectionHelper
                                                    .debtInvestmentController
                                                    .isValidateFnancingPurpose
                                                    .value = true;
                                              });
                                            },
                                            label: 'Financing Purpose',
                                            defaultValue: InjectionHelper
                                                        .debtInvestmentController
                                                        .financingPurpose
                                                        .value
                                                        .display !=
                                                    null
                                                ? {
                                                    "Name": InjectionHelper
                                                        .debtInvestmentController
                                                        .financingPurpose
                                                        .value
                                                        .display,
                                                    "Code": InjectionHelper
                                                        .debtInvestmentController
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
                                            controller: InjectionHelper
                                                .debtInvestmentController
                                                .financingAmountcontroller,
                                            validateText: validateText,
                                            textInputAction:
                                                TextInputAction.next,
                                            isRequired: true,
                                            isValidate: InjectionHelper
                                                .debtInvestmentController
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
                                                    InjectionHelper
                                                        .debtInvestmentController
                                                        .optionData
                                                        .value
                                                        .financingAmount!
                                                        .minimum!) {
                                                  InjectionHelper
                                                      .debtInvestmentController
                                                      .isValidateFinancingAmount
                                                      .value = false;
                                                  setState(() {
                                                    validateText =
                                                        "Financing amount is starting from \$${FormatToK.digitNumber(InjectionHelper.debtInvestmentController.optionData.value.financingAmount!.minimum!)}";
                                                  });
                                                } else {
                                                  setState(() {
                                                    InjectionHelper
                                                            .debtInvestmentController
                                                            .financingAmount
                                                            .value =
                                                        double.parse(value);
                                                  });
                                                  InjectionHelper
                                                      .debtInvestmentController
                                                      .isValidateFinancingAmount
                                                      .value = true;
                                                }
                                                if (val >
                                                    InjectionHelper
                                                        .debtInvestmentController
                                                        .optionData
                                                        .value
                                                        .financingAmount!
                                                        .maximum!) {
                                                  InjectionHelper
                                                      .debtInvestmentController
                                                      .isValidateFinancingAmount
                                                      .value = false;
                                                  InjectionHelper
                                                      .debtInvestmentController
                                                      .financingAmount
                                                      .value = 0.0;
                                                  setState(() {
                                                    validateText =
                                                        "Financing amount must between \$${FormatToK.digitNumber(InjectionHelper.debtInvestmentController.optionData.value.financingAmount!.minimum!)} - \$${FormatToK.digitNumber(InjectionHelper.debtInvestmentController.optionData.value.financingAmount!.maximum!)}";
                                                  });
                                                } else {
                                                  setState(() {
                                                    InjectionHelper
                                                            .debtInvestmentController
                                                            .financingAmount
                                                            .value =
                                                        double.parse(value);
                                                  });
                                                }
                                              } else {
                                                InjectionHelper
                                                    .debtInvestmentController
                                                    .financingAmount
                                                    .value = 0.0;
                                                InjectionHelper
                                                    .debtInvestmentController
                                                    .isValidateFinancingAmount
                                                    .value = false;
                                                setState(() {
                                                  validateText =
                                                      "Please enter Financing Amount (USD)";
                                                });
                                              }
                                              setState(() {
                                                tempData.financingAmount =
                                                    InjectionHelper
                                                        .debtInvestmentController
                                                        .financingAmount
                                                        .value;
                                              });
                                            },
                                            keyboardType: const TextInputType
                                                    .numberWithOptions(
                                                decimal: true),
                                            initialValue: InjectionHelper
                                                        .debtInvestmentController
                                                        .financingAmount
                                                        .value ==
                                                    0.0
                                                ? ''
                                                : InjectionHelper
                                                    .debtInvestmentController
                                                    .financingAmount
                                                    .value
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
                                            controller: InjectionHelper
                                                .debtInvestmentController
                                                .termController,
                                            isValidate: InjectionHelper
                                                .debtInvestmentController
                                                .isValidateTerm
                                                .value,
                                            labelText: 'Term (Months) ',
                                            hintText: 'Term (Months) ',
                                            onChange: (value) {
                                              if (value.isNotEmpty) {
                                                setState(() {
                                                  tempData.term =
                                                      int.parse(value);
                                                });
                                                setState(() {
                                                  InjectionHelper
                                                      .debtInvestmentController
                                                      .isValidateTerm
                                                      .value = true;
                                                  InjectionHelper
                                                      .debtInvestmentController
                                                      .term
                                                      .value = int.parse(value);
                                                  if (InjectionHelper
                                                              .debtInvestmentController
                                                              .term
                                                              .value <
                                                          InjectionHelper
                                                              .debtInvestmentController
                                                              .optionData
                                                              .value
                                                              .duration!
                                                              .minimum! ||
                                                      InjectionHelper
                                                              .debtInvestmentController
                                                              .term
                                                              .value >
                                                          InjectionHelper
                                                              .debtInvestmentController
                                                              .optionData
                                                              .value
                                                              .duration!
                                                              .maximum!) {
                                                    InjectionHelper
                                                        .debtInvestmentController
                                                        .isValidateTermAmount
                                                        .value = true;
                                                  } else {
                                                    InjectionHelper
                                                        .debtInvestmentController
                                                        .isValidateTermAmount
                                                        .value = false;
                                                  }
                                                });
                                              } else {
                                                InjectionHelper
                                                    .debtInvestmentController
                                                    .isValidateTerm(false);
                                                InjectionHelper
                                                    .debtInvestmentController
                                                    .term
                                                    .value = 0;
                                                setState(() {
                                                  tempData.term = 0;
                                                });
                                              }
                                            },
                                            keyboardType: const TextInputType
                                                    .numberWithOptions(
                                                decimal: true),
                                            initialValue: InjectionHelper
                                                        .debtInvestmentController
                                                        .term
                                                        .value
                                                        .toString() !=
                                                    "0"
                                                ? InjectionHelper
                                                    .debtInvestmentController
                                                    .term
                                                    .value
                                                    .toString()
                                                : "",
                                          ),
                                          if (InjectionHelper
                                                  .debtInvestmentController
                                                  .isValidateTermAmount
                                                  .value &&
                                              InjectionHelper
                                                      .debtInvestmentController
                                                      .isValidateTerm
                                                      .value ==
                                                  true)
                                            Container(
                                              padding: const EdgeInsets.only(
                                                left: 20,
                                              ),
                                              child: CustomValidateError(
                                                validateTitle:
                                                    'Term amount must be between ${InjectionHelper.debtInvestmentController.optionData.value.duration!.minimum!} and ${InjectionHelper.debtInvestmentController.optionData.value.duration!.maximum!}',
                                              ),
                                            ),
                                          CICDropdown(
                                            // isEnable: !isEnable,
                                            currentDate: widget.id != null &&
                                                    dt1.isAfter(
                                                      InjectionHelper
                                                                  .debtInvestmentController
                                                                  .intendedDate
                                                                  .value ==
                                                              ""
                                                          ? DateTime(
                                                              dt1.year,
                                                              dt1.month,
                                                              dt1.day)
                                                          : DateFormat(
                                                                  "dd-MM-yyyy")
                                                              .parse(InjectionHelper
                                                                  .debtInvestmentController
                                                                  .intendedDate
                                                                  .value),
                                                    )
                                                ? DateFormat("dd-MM-yyyy")
                                                    .parse(InjectionHelper
                                                        .debtInvestmentController
                                                        .intendedDate
                                                        .value)
                                                : FormatDate.today(),
                                            isValidate: InjectionHelper
                                                .debtInvestmentController
                                                .isValidateIntendedDate
                                                .value,
                                            label:
                                                'Intended Date of Disbursement​',
                                            onChange: (value) {
                                              InjectionHelper
                                                  .debtInvestmentController
                                                  .whenOnchangeDate
                                                  .value = value["Name"];
                                              InjectionHelper
                                                  .debtInvestmentController
                                                  .intendedDate
                                                  .value = value["Name"];
                                              InjectionHelper
                                                  .debtInvestmentController
                                                  .isValidateIntendedDate
                                                  .value = true;
                                              setState(() {
                                                tempData.intendedDate =
                                                    InjectionHelper
                                                        .debtInvestmentController
                                                        .intendedDate
                                                        .value;
                                              });
                                            },
                                            defaultValue: InjectionHelper
                                                        .debtInvestmentController
                                                        .intendedDate
                                                        .value ==
                                                    ''
                                                ? null
                                                : {
                                                    'Name': InjectionHelper
                                                                .debtInvestmentController
                                                                .whenOnchangeDate
                                                                .value ==
                                                            ""
                                                        ? FormatDate
                                                            .formatDateTimeGetfunding(
                                                                InjectionHelper
                                                                    .debtInvestmentController
                                                                    .intendedDate
                                                                    .value)
                                                        : InjectionHelper
                                                            .debtInvestmentController
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
                                      left: 20, right: 20, bottom: 10, top: 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: CustomButton(
                                          isDisable: tempData == defaultData &&
                                                  addNewFinancingPurpose.text ==
                                                      ""
                                              ? true
                                              : InjectionHelper
                                                              .debtInvestmentController
                                                              .productType
                                                              .value
                                                              .productName ==
                                                          null &&
                                                      InjectionHelper
                                                              .debtInvestmentController
                                                              .financingAmount
                                                              .value ==
                                                          0.0 &&
                                                      InjectionHelper
                                                              .debtInvestmentController
                                                              .term
                                                              .value ==
                                                          0 &&
                                                      InjectionHelper
                                                              .debtInvestmentController
                                                              .intendedDate
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
                                                ? await InjectionHelper
                                                    .debtInvestmentController
                                                    .onEditDebtInvestment(
                                                        showDebtSnackbar: false,
                                                        id: widget.id,
                                                        context: context,
                                                        frompage: InjectionHelper
                                                            .debtInvestmentController
                                                            .applicationDetail
                                                            .value
                                                            .step!
                                                            .toInt(),
                                                        step: 2)
                                                : await InjectionHelper
                                                    .debtInvestmentController
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
