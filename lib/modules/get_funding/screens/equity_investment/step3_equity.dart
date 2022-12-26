import 'dart:io';
import 'package:cicgreenloan/Utils/chart/custom_circle_chart_1_3.dart';
import 'package:cicgreenloan/Utils/helper/injection_helper/injection_helper.dart';
import 'package:cicgreenloan/Utils/helper/numerice_format.dart';
import 'package:cicgreenloan/Utils/pop_up_alert/show_alert_dialog.dart';
import 'package:cicgreenloan/Utils/helper/option_model/option_model.dart';
import 'package:cicgreenloan/widgets/get_funding/custom_select_2_getfunding.dart';
import 'package:cicgreenloan/widgets/get_funding/custom_select_getfunding.dart';
import 'package:cicgreenloan/widgets/get_funding/custom_text_getfunding.dart';
import 'package:collection/collection.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_form_card.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_textformfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../Utils/helper/color.dart';
import '../../../../Utils/helper/container_partern.dart';
import '../../../../Utils/helper/custom_appbar_colorswhite.dart';
import '../../../../Utils/helper/firebase_analytics.dart';
import '../../../../Utils/helper/format_number.dart';
import '../../../../widgets/get_funding/custom_call_center.dart';

class Step3Equity extends StatefulWidget {
  final int? id;

  final int? step;

  const Step3Equity({Key? key, this.id, this.step}) : super(key: key);
  @override
  State<Step3Equity> createState() => _Step3EquityState();
}

class _Step3EquityState extends State<Step3Equity> {
  @override
  void initState() {
    if (widget.id != null) inistialdata();
    super.initState();
  }

  inistialdata() async {
    await InjectionHelper.equityInvestmentController
        .fetchAppDetails(widget.id!);

    InjectionHelper.equityInvestmentController.status.value = InjectionHelper
        .equityInvestmentController.applicationData.value.status!;
    InjectionHelper.equityInvestmentController.equityId.value =
        InjectionHelper.equityInvestmentController.applicationData.value.id!;
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
    InjectionHelper.equityInvestmentController.numberOfShareHolders.value =
        InjectionHelper.equityInvestmentController.applicationData.value
            .numberofshareholder!
            .toInt();

    ///
    var displaynumberofshareholder = FormatNumber.formatNumberDefualt(
        InjectionHelper.equityInvestmentController.applicationData.value
            .numberofshareholder!);
    InjectionHelper.equityInvestmentController.numberofSharecontroller.text =
        InjectionHelper.equityInvestmentController.applicationData.value
                    .numberofshareholder! ==
                0
            ? ""
            : displaynumberofshareholder.toString();

    ///
    var displaynumberofboardmember = FormatNumber.formatNumberDefualt(
        InjectionHelper.equityInvestmentController.applicationData.value
            .numberofboardmember!);
    InjectionHelper.equityInvestmentController.numberofBoardcontroller.text =
        InjectionHelper.equityInvestmentController.applicationData.value
                    .numberofboardmember ==
                0
            ? ""
            : displaynumberofboardmember.toString();

    ///
    InjectionHelper.equityInvestmentController.numberOfBoardMembers.value =
        InjectionHelper.equityInvestmentController.applicationData.value
            .numberofboardmember!
            .toInt();
    InjectionHelper.equityInvestmentController.useOfFund.value = InjectionHelper
        .equityInvestmentController.applicationData.value.useofFund!;

    InjectionHelper.equityInvestmentController.companyName.value =
        InjectionHelper.equityInvestmentController.applicationData.value
            .company!.companyName!;
    InjectionHelper.equityInvestmentController.address.value = InjectionHelper
        .equityInvestmentController.applicationData.value.company!.address!;
    InjectionHelper.equityInvestmentController.yearOfEstablishment.value =
        InjectionHelper.equityInvestmentController.applicationData.value
            .company!.yearFounded!
            .toString();

    InjectionHelper.equityInvestmentController.typeOfOrganization.value =
        InjectionHelper.equityInvestmentController.applicationData.value
                    .company!.typeOfOrganization !=
                null
            ? InjectionHelper.equityInvestmentController.applicationData.value
                .company!.typeOfOrganization!
            : Optionmodel(id: 0, display: "");

    InjectionHelper.equityInvestmentController.taxIdentificationNumber.value =
        InjectionHelper.equityInvestmentController.applicationData.value
            .company!.taxIdentificationNumber!;
    InjectionHelper.equityInvestmentController.industry.value = InjectionHelper
                .equityInvestmentController
                .applicationData
                .value
                .company!
                .industry !=
            null
        ? InjectionHelper
            .equityInvestmentController.applicationData.value.company!.industry!
        : Optionmodel(id: 0, display: "");

    InjectionHelper.equityInvestmentController.numberOfStaff.value =
        InjectionHelper.equityInvestmentController.applicationData.value
            .company!.numberOfStaff!
            .toString();
    InjectionHelper.equityInvestmentController.ownerName.value = InjectionHelper
        .equityInvestmentController.applicationData.value.company!.ownerName!;
    InjectionHelper.equityInvestmentController.productSevice.value =
        InjectionHelper.equityInvestmentController.applicationData.value
            .company!.companyProductAndService!;
    InjectionHelper.equityInvestmentController.patentDocument.value =
        InjectionHelper
            .equityInvestmentController.applicationData.value.companyPatentDoc!;
    InjectionHelper.equityInvestmentController.certificatioDoc.value =
        InjectionHelper.equityInvestmentController.applicationData.value
            .companyMoCCertificate!;
    InjectionHelper.equityInvestmentController.licenseDoc.value =
        InjectionHelper.equityInvestmentController.applicationData.value
            .companyLicenceDoc!;
    InjectionHelper.equityInvestmentController.memorandumDoc.value =
        InjectionHelper
            .equityInvestmentController.applicationData.value.companyMAA!;

    InjectionHelper.equityInvestmentController.purposeOfFund.value =
        InjectionHelper
            .equityInvestmentController.applicationData.value.raisefundusefor!
            .toInt();

    InjectionHelper.equityInvestmentController.haveTheConsenus.value =
        InjectionHelper.equityInvestmentController.applicationData.value
            .iscompanyraisefund!
            .toInt();
    InjectionHelper
            .equityInvestmentController.areYouTheMajorityShareholder.value =
        InjectionHelper.equityInvestmentController.applicationData.value
            .ismajorityshareholder!
            .toInt();
    InjectionHelper.equityInvestmentController.havefinancial.value =
        InjectionHelper
            .equityInvestmentController.applicationData.value.financialroject!
            .toInt();
    InjectionHelper.equityInvestmentController.businessPlan.value =
        InjectionHelper
            .equityInvestmentController.applicationData.value.businessPlan!
            .toInt();
    InjectionHelper.equityInvestmentController.articleOfIncorporation.value =
        InjectionHelper.equityInvestmentController.applicationData.value
            .articleOfIncorporation!
            .toInt();
    InjectionHelper.equityInvestmentController.incomeStatement.value =
        InjectionHelper
            .equityInvestmentController.applicationData.value.incomeStatement!
            .toInt();
    InjectionHelper.equityInvestmentController.balanceSheet.value =
        InjectionHelper
            .equityInvestmentController.applicationData.value.balanceSheet!
            .toInt();
    InjectionHelper.equityInvestmentController.cashFlowStatement.value =
        InjectionHelper
            .equityInvestmentController.applicationData.value.cashFlowStatement!
            .toInt();
    InjectionHelper.equityInvestmentController.marketStudy.value =
        InjectionHelper
            .equityInvestmentController.applicationData.value.marketStudyDocs!
            .toInt();
    InjectionHelper.equityInvestmentController.otherDocuments.value =
        InjectionHelper
            .equityInvestmentController.applicationData.value.otherDocument!
            .toInt();
  }

  void _onpress() {
    if (InjectionHelper.equityInvestmentController.numberOfShareHolders.value ==
        0) {
      InjectionHelper
          .equityInvestmentController.isValNumberOfShareHolders.value = false;
    } else {
      InjectionHelper
          .equityInvestmentController.isValNumberOfShareHolders.value = true;
    }
    if (InjectionHelper.equityInvestmentController.numberOfBoardMembers.value ==
        0) {
      InjectionHelper
          .equityInvestmentController.isValNumberOfBoardMembers.value = false;
    } else {
      InjectionHelper
          .equityInvestmentController.isValNumberOfBoardMembers.value = true;
    }

    if (InjectionHelper.equityInvestmentController.numberOfBoardMembers.value !=
            0 &&
        InjectionHelper.equityInvestmentController.numberOfShareHolders.value !=
            0) {
      context.go("/get_funding/preview-equity?id=${widget.id}");
    }
  }

  Function eq = const ListEquality().equals;
  bool checkDisableSavedraft() {
    return InjectionHelper.equityInvestmentController.numberOfShareHolders.toString() == InjectionHelper.equityInvestmentController.applicationData.value.numberofshareholder.toString() &&
        InjectionHelper.equityInvestmentController.haveTheConsenus.toString() ==
            InjectionHelper.equityInvestmentController.applicationData.value
                .iscompanyraisefund
                .toString() &&
        InjectionHelper.equityInvestmentController.purposeOfFund.value.toString() ==
            InjectionHelper.equityInvestmentController.applicationData.value.raisefundusefor
                .toString() &&
        InjectionHelper.equityInvestmentController.areYouTheMajorityShareholder.toString() ==
            InjectionHelper.equityInvestmentController.applicationData.value
                .ismajorityshareholder
                .toString() &&
        InjectionHelper.equityInvestmentController.havefinancial.value.toString() ==
            InjectionHelper.equityInvestmentController.applicationData.value.financialroject!
                .toString() &&
        InjectionHelper.equityInvestmentController.numberOfBoardMembers.toString() ==
            InjectionHelper.equityInvestmentController.applicationData.value
                .numberofboardmember
                .toString() &&
        InjectionHelper.equityInvestmentController.businessPlan.value ==
            InjectionHelper.equityInvestmentController.applicationData.value
                .businessPlan &&
        InjectionHelper.equityInvestmentController.articleOfIncorporation.value ==
            InjectionHelper.equityInvestmentController.applicationData.value
                .articleOfIncorporation &&
        InjectionHelper.equityInvestmentController.incomeStatement.value ==
            InjectionHelper.equityInvestmentController.applicationData.value.incomeStatement &&
        InjectionHelper.equityInvestmentController.balanceSheet.value == InjectionHelper.equityInvestmentController.applicationData.value.balanceSheet &&
        InjectionHelper.equityInvestmentController.cashFlowStatement.value == InjectionHelper.equityInvestmentController.applicationData.value.cashFlowStatement &&
        InjectionHelper.equityInvestmentController.marketStudy.value == InjectionHelper.equityInvestmentController.applicationData.value.marketStudyDocs &&
        InjectionHelper.equityInvestmentController.otherDocuments.value == InjectionHelper.equityInvestmentController.applicationData.value.otherDocument;
  }

  FocusNode numberofBoardFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return CupertinoScaffold(
      body: Builder(
        builder: (context) => CupertinoPageScaffold(
          child: Listener(
            onPointerDown: (PointerDownEvent event) =>
                FocusManager.instance.primaryFocus?.unfocus(),
            child: Obx(
              () => InjectionHelper
                      .equityInvestmentController.isLoadingSubmit.value
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
                                    ? 'Updating...'
                                    : 'Submitting...',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
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
                                onPressed:
                                    widget.id != null && checkDisableSavedraft()
                                        ? () {
                                            FocusScope.of(context).unfocus();
                                            Navigator.pop(context);
                                          }
                                        : InjectionHelper
                                                        .equityInvestmentController
                                                        .numberOfShareHolders
                                                        .value ==
                                                    0 &&
                                                InjectionHelper
                                                        .equityInvestmentController
                                                        .numberOfBoardMembers
                                                        .value ==
                                                    0 &&
                                                InjectionHelper
                                                        .equityInvestmentController
                                                        .businessPlan
                                                        .value ==
                                                    0 &&
                                                InjectionHelper
                                                        .equityInvestmentController
                                                        .articleOfIncorporation
                                                        .value ==
                                                    0 &&
                                                InjectionHelper
                                                        .equityInvestmentController
                                                        .incomeStatement
                                                        .value ==
                                                    0 &&
                                                InjectionHelper
                                                        .equityInvestmentController
                                                        .balanceSheet
                                                        .value ==
                                                    0 &&
                                                InjectionHelper
                                                        .equityInvestmentController
                                                        .cashFlowStatement
                                                        .value ==
                                                    0 &&
                                                InjectionHelper
                                                        .equityInvestmentController
                                                        .marketStudy
                                                        .value ==
                                                    0 &&
                                                InjectionHelper
                                                        .equityInvestmentController
                                                        .otherDocuments
                                                        .value ==
                                                    0
                                            ? () {
                                                FocusScope.of(context)
                                                    .unfocus();
                                                Navigator.pop(context);
                                              }
                                            : () {
                                                FocusScope.of(context)
                                                    .unfocus();
                                                showSaveDraftDialog(
                                                    context: context,
                                                    onSaveTitle:
                                                        widget.id != null
                                                            ? "Update Draft"
                                                            : "Save Draft",
                                                    content:
                                                        'Changes made to this page haven’t been saved yet.',
                                                    title:
                                                        'Are you sure you want to leave this page?',
                                                    onSave: () async {
                                                      // Navigator.pop(context);

                                                      if (widget.id == null) {
                                                        context.pop();
                                                        await InjectionHelper
                                                            .equityInvestmentController
                                                            .onSubmitEquityInvestment(
                                                                context:
                                                                    context,
                                                                type: "3");
                                                        debugPrint(
                                                            "Submitted  ....");
                                                      } else {
                                                        debugPrint(
                                                            "Edit Update");

                                                        InjectionHelper
                                                            .equityInvestmentController
                                                            .onEditEquityInvestment(
                                                                context:
                                                                    context,
                                                                id: widget.id!,
                                                                pagenumber:
                                                                    "3");
                                                        context.pop();
                                                      }
                                                    },
                                                    isCancel: true,
                                                    onDiscard: () {
                                                      context.pop();
                                                      InjectionHelper
                                                          .equityInvestmentController
                                                          .resetData();
                                                      context
                                                          .go('/get_funding');
                                                    });
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
                              action: [
                                const CustomCallCenter(),
                                const CustomCircleChart(
                                  numberPage: 3,
                                ),
                                const SizedBox(
                                  width: 20,
                                )
                              ],
                            ),
                      body: Obx(
                        () => InjectionHelper
                                .equityInvestmentController.isLoadingData.value
                            ? const LinearProgressIndicator()
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 20),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Text(
                                            'Required Documents',
                                            style: TextStyle(
                                                fontFamily: 'DMSans',
                                                fontSize: 18,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        CustomFormCard(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20,
                                                        vertical: 10),
                                                child: Text(
                                                  'Business Overview',
                                                  style: TextStyle(
                                                      fontFamily: 'DMSans',
                                                      fontSize: 15,
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ),
                                              CustomTextFieldNew(
                                                controller: InjectionHelper
                                                    .equityInvestmentController
                                                    .numberofSharecontroller,
                                                onEditingComplete: () {
                                                  FocusScope.of(context)
                                                      .requestFocus(
                                                          numberofBoardFocus);
                                                },
                                                keyboardType:
                                                    TextInputType.number,
                                                inputFormatterList: [
                                                  FilteringTextInputFormatter
                                                      .digitsOnly,
                                                  FilteringTextInputFormatter
                                                      .deny(RegExp(r'^0+')),
                                                  NumericTextFormatter()
                                                ],
                                                isRequired: true,
                                                isValidate: InjectionHelper
                                                    .equityInvestmentController
                                                    .isValNumberOfShareHolders
                                                    .value,
                                                labelText:
                                                    'Number of Shareholders',
                                                hintText:
                                                    'Number of Shareholders',
                                                onChange: (valueChanged) {
                                                  var value = valueChanged
                                                      .replaceAll(',', '');
                                                  if (value.isEmpty) {
                                                    InjectionHelper
                                                        .equityInvestmentController
                                                        .numberOfShareHolders
                                                        .value = 0;
                                                    InjectionHelper
                                                        .equityInvestmentController
                                                        .isValNumberOfShareHolders
                                                        .value = false;
                                                  } else {
                                                    InjectionHelper
                                                        .equityInvestmentController
                                                        .numberOfShareHolders
                                                        .value = int.parse(value);
                                                    if (InjectionHelper
                                                            .equityInvestmentController
                                                            .numberOfShareHolders
                                                            .value >
                                                        0) {
                                                      InjectionHelper
                                                          .equityInvestmentController
                                                          .isValNumberOfShareHolders
                                                          .value = true;
                                                    } else {
                                                      InjectionHelper
                                                          .equityInvestmentController
                                                          .isValNumberOfShareHolders
                                                          .value = false;
                                                    }
                                                  }
                                                },
                                                initialValue: InjectionHelper
                                                            .equityInvestmentController
                                                            .numberOfShareHolders
                                                            .value ==
                                                        0
                                                    ? ''
                                                    : FormatNumber.formDecimalNumber(
                                                        InjectionHelper
                                                            .equityInvestmentController
                                                            .numberOfShareHolders
                                                            .value),
                                              ),
                                              CustomTextFieldNew(
                                                controller: InjectionHelper
                                                    .equityInvestmentController
                                                    .numberofBoardcontroller,
                                                focusScope: numberofBoardFocus,
                                                isRequired: true,
                                                keyboardType:
                                                    TextInputType.number,
                                                inputFormatterList: [
                                                  FilteringTextInputFormatter
                                                      .digitsOnly,
                                                  FilteringTextInputFormatter
                                                      .deny(RegExp(r'^0+')),
                                                  NumericTextFormatter()
                                                ],
                                                isValidate: InjectionHelper
                                                    .equityInvestmentController
                                                    .isValNumberOfBoardMembers
                                                    .value,
                                                labelText:
                                                    'Number of Board Member',
                                                hintText:
                                                    'Number of Board Member',
                                                onChange: (valueChanged) {
                                                  var value = valueChanged
                                                      .replaceAll(',', '');
                                                  if (value.isEmpty) {
                                                    InjectionHelper
                                                        .equityInvestmentController
                                                        .numberOfBoardMembers
                                                        .value = 0;
                                                    InjectionHelper
                                                        .equityInvestmentController
                                                        .isValNumberOfBoardMembers
                                                        .value = false;
                                                  } else {
                                                    InjectionHelper
                                                        .equityInvestmentController
                                                        .numberOfBoardMembers
                                                        .value = int.parse(value);
                                                    if (InjectionHelper
                                                            .equityInvestmentController
                                                            .numberOfBoardMembers
                                                            .value >
                                                        0) {
                                                      InjectionHelper
                                                          .equityInvestmentController
                                                          .isValNumberOfBoardMembers
                                                          .value = true;
                                                    } else {
                                                      InjectionHelper
                                                          .equityInvestmentController
                                                          .isValNumberOfBoardMembers
                                                          .value = false;
                                                    }
                                                  }
                                                },
                                                initialValue: InjectionHelper
                                                            .equityInvestmentController
                                                            .numberOfBoardMembers
                                                            .value ==
                                                        0
                                                    ? ''
                                                    : InjectionHelper
                                                        .equityInvestmentController
                                                        .numberOfBoardMembers
                                                        .value
                                                        .toString(),
                                              ),
                                              // const Padding(
                                              //   padding: EdgeInsets.only(
                                              //       bottom: 20,
                                              //       left: 20,
                                              //       right: 20),
                                              //   child: Text(
                                              //     '*',
                                              //     style: TextStyle(
                                              //         fontFamily: 'DMSans',
                                              //         fontSize: 14,
                                              //         color: Colors.black,
                                              //         fontWeight:
                                              //             FontWeight.w400),
                                              //   ),
                                              // ),

                                              const SizedBox(
                                                height: 20,
                                              ),
                                              const CustomTextGetfunding(
                                                isrequire: true,
                                                label1:
                                                    'Do you have the consensus of all shareholders to raise new fund?',
                                                label2: '',
                                              ),

                                              const SizedBox(
                                                height: 14,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20, bottom: 14),
                                                child: Row(
                                                  children: [
                                                    CustomSelectgetFunding(
                                                      onSelect: InjectionHelper
                                                              .equityInvestmentController
                                                              .haveTheConsenus
                                                              .value ==
                                                          0,
                                                      title: 'No',
                                                      ontap: () {
                                                        InjectionHelper
                                                            .equityInvestmentController
                                                            .haveTheConsenus
                                                            .value = 0;
                                                      },
                                                    ),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    CustomSelectgetFunding(
                                                      title: 'Yes',
                                                      onSelect: InjectionHelper
                                                              .equityInvestmentController
                                                              .haveTheConsenus
                                                              .value ==
                                                          1,
                                                      ontap: () {
                                                        InjectionHelper
                                                            .equityInvestmentController
                                                            .haveTheConsenus
                                                            .value = 1;
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.only(
                                                  bottom: 20,
                                                  right: 20,
                                                ),
                                                child: CustomTextGetfunding(
                                                  isrequire: true,
                                                  label1:
                                                      'Will the new fund raised be injected into business or used to buy share from existing shareholders?',
                                                  label2: '',
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20,
                                                    bottom: 20,
                                                    right: 20),
                                                child: Row(
                                                    children: InjectionHelper
                                                        .optionController
                                                        .optionData
                                                        .value
                                                        .riaseuseoffund!
                                                        .map((e) =>
                                                            CustomSelect2GetFunding(
                                                              title: e.display,
                                                              isSelect: InjectionHelper
                                                                      .equityInvestmentController
                                                                      .purposeOfFund
                                                                      .value ==
                                                                  e.id,
                                                              ontap: () {
                                                                InjectionHelper
                                                                    .equityInvestmentController
                                                                    .purposeOfFund
                                                                    .value = e.id!;
                                                              },
                                                            ))
                                                        .toList()),
                                              ),
                                              const CustomTextGetfunding(
                                                isrequire: true,
                                                label1:
                                                    'As key sponsor of the business, you are the majority shareholders?',
                                                label2: '',
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20,
                                                    bottom: 20,
                                                    right: 20,
                                                    top: 20),
                                                child: Row(
                                                  children: [
                                                    CustomSelectgetFunding(
                                                      onSelect: InjectionHelper
                                                              .equityInvestmentController
                                                              .areYouTheMajorityShareholder
                                                              .value ==
                                                          0,
                                                      title: 'No',
                                                      ontap: () {
                                                        // InjectionHelper.equityInvestmentController
                                                        //     .areYouTheMajorityShareholder
                                                        //     .value = 0;
                                                        InjectionHelper
                                                            .equityInvestmentController
                                                            .areYouTheMajorityShareholder
                                                            .value = 0;
                                                      },
                                                    ),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    CustomSelectgetFunding(
                                                      title: 'Yes',
                                                      onSelect: InjectionHelper
                                                              .equityInvestmentController
                                                              .areYouTheMajorityShareholder
                                                              .value ==
                                                          1,
                                                      ontap: () {
                                                        InjectionHelper
                                                            .equityInvestmentController
                                                            .areYouTheMajorityShareholder
                                                            .value = 1;
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),

                                              const CustomTextGetfunding(
                                                isrequire: true,
                                                label1:
                                                    'Do you have Business Plan or Presentation?',
                                                label2: '',
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20,
                                                    bottom: 20,
                                                    right: 20,
                                                    top: 20),
                                                child: Row(
                                                  children: [
                                                    CustomSelectgetFunding(
                                                      onSelect: InjectionHelper
                                                              .equityInvestmentController
                                                              .businessPlan
                                                              .value ==
                                                          0,
                                                      title: 'No',
                                                      ontap: () {
                                                        InjectionHelper
                                                            .equityInvestmentController
                                                            .businessPlan
                                                            .value = 0;
                                                      },
                                                    ),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    CustomSelectgetFunding(
                                                      title: 'Yes',
                                                      onSelect: InjectionHelper
                                                              .equityInvestmentController
                                                              .businessPlan
                                                              .value ==
                                                          1,
                                                      ontap: () {
                                                        InjectionHelper
                                                            .equityInvestmentController
                                                            .businessPlan
                                                            .value = 1;
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),

                                              const CustomTextGetfunding(
                                                isrequire: true,
                                                label1:
                                                    'Do you have Article of Incorporation?',
                                                label2: '',
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20,
                                                    bottom: 20,
                                                    right: 20,
                                                    top: 20),
                                                child: Row(
                                                  children: [
                                                    CustomSelectgetFunding(
                                                      onSelect: InjectionHelper
                                                              .equityInvestmentController
                                                              .articleOfIncorporation
                                                              .value ==
                                                          0,
                                                      title: 'No',
                                                      ontap: () {
                                                        InjectionHelper
                                                            .equityInvestmentController
                                                            .articleOfIncorporation
                                                            .value = 0;
                                                      },
                                                    ),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    CustomSelectgetFunding(
                                                      title: 'Yes',
                                                      onSelect: InjectionHelper
                                                              .equityInvestmentController
                                                              .articleOfIncorporation
                                                              .value ==
                                                          1,
                                                      ontap: () {
                                                        InjectionHelper
                                                            .equityInvestmentController
                                                            .articleOfIncorporation
                                                            .value = 1;
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),

                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Container(
                                                color:
                                                    AppColor.dividerBackground,
                                                height: 5,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20,
                                                        vertical: 20),
                                                child: Text(
                                                  'Financial Performance and Projection',
                                                  style: TextStyle(
                                                      fontFamily: 'DMSans',
                                                      fontSize: 15,
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ),

                                              const CustomTextGetfunding(
                                                isrequire: false,
                                                label1:
                                                    'Do you have Income Statement (Monthly and yearly statement during last 3 years)?',
                                                label2: '',
                                              ),

                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20,
                                                    bottom: 20,
                                                    right: 20,
                                                    top: 20),
                                                child: Row(
                                                  children: [
                                                    CustomSelectgetFunding(
                                                      onSelect: InjectionHelper
                                                              .equityInvestmentController
                                                              .incomeStatement
                                                              .value ==
                                                          0,
                                                      title: 'No',
                                                      ontap: () {
                                                        InjectionHelper
                                                            .equityInvestmentController
                                                            .incomeStatement
                                                            .value = 0;
                                                      },
                                                    ),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    CustomSelectgetFunding(
                                                      title: 'Yes',
                                                      onSelect: InjectionHelper
                                                              .equityInvestmentController
                                                              .incomeStatement
                                                              .value ==
                                                          1,
                                                      ontap: () {
                                                        InjectionHelper
                                                            .equityInvestmentController
                                                            .incomeStatement
                                                            .value = 1;
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),

                                              const CustomTextGetfunding(
                                                isrequire: false,
                                                label1:
                                                    'Do you have Balance Sheet (Monthly and yearly statement during last 3 years)?',
                                                label2: '',
                                              ),

                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20,
                                                    bottom: 20,
                                                    right: 20,
                                                    top: 20),
                                                child: Row(
                                                  children: [
                                                    CustomSelectgetFunding(
                                                      onSelect: InjectionHelper
                                                              .equityInvestmentController
                                                              .balanceSheet
                                                              .value ==
                                                          0,
                                                      title: 'No',
                                                      ontap: () {
                                                        InjectionHelper
                                                            .equityInvestmentController
                                                            .balanceSheet
                                                            .value = 0;
                                                      },
                                                    ),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    CustomSelectgetFunding(
                                                      title: 'Yes',
                                                      onSelect: InjectionHelper
                                                              .equityInvestmentController
                                                              .balanceSheet
                                                              .value ==
                                                          1,
                                                      ontap: () {
                                                        InjectionHelper
                                                            .equityInvestmentController
                                                            .balanceSheet
                                                            .value = 1;
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),

                                              const CustomTextGetfunding(
                                                isrequire: false,
                                                label1:
                                                    'Do you have Cash Flow Statement (Monthly and yearly statement during last 3 years)?',
                                                label2: '',
                                              ),

                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20,
                                                    bottom: 20,
                                                    right: 20,
                                                    top: 20),
                                                child: Row(
                                                  children: [
                                                    CustomSelectgetFunding(
                                                      onSelect: InjectionHelper
                                                              .equityInvestmentController
                                                              .cashFlowStatement
                                                              .value ==
                                                          0,
                                                      title: 'No',
                                                      ontap: () {
                                                        InjectionHelper
                                                            .equityInvestmentController
                                                            .cashFlowStatement
                                                            .value = 0;
                                                      },
                                                    ),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    CustomSelectgetFunding(
                                                      title: 'Yes',
                                                      onSelect: InjectionHelper
                                                              .equityInvestmentController
                                                              .cashFlowStatement
                                                              .value ==
                                                          1,
                                                      ontap: () {
                                                        InjectionHelper
                                                            .equityInvestmentController
                                                            .cashFlowStatement
                                                            .value = 1;
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),

                                              const CustomTextGetfunding(
                                                isrequire: true,
                                                label1:
                                                    'Do you have the financial projection (3 to 5 year)?',
                                                label2: '',
                                              ),

                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20,
                                                    bottom: 20,
                                                    right: 20,
                                                    top: 20),
                                                child: Row(
                                                  children: [
                                                    CustomSelectgetFunding(
                                                      onSelect: InjectionHelper
                                                              .equityInvestmentController
                                                              .havefinancial
                                                              .value ==
                                                          0,
                                                      title: 'No',
                                                      ontap: () {
                                                        InjectionHelper
                                                            .equityInvestmentController
                                                            .havefinancial
                                                            .value = 0;
                                                      },
                                                    ),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    CustomSelectgetFunding(
                                                      title: 'Yes',
                                                      onSelect: InjectionHelper
                                                              .equityInvestmentController
                                                              .havefinancial
                                                              .value ==
                                                          1,
                                                      ontap: () {
                                                        InjectionHelper
                                                            .equityInvestmentController
                                                            .havefinancial
                                                            .value = 1;
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              //==

                                              Container(
                                                color:
                                                    AppColor.dividerBackground,
                                                height: 5,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20,
                                                        vertical: 20),
                                                child: Text(
                                                  'Other',
                                                  style: TextStyle(
                                                      fontFamily: 'DMSans',
                                                      fontSize: 15,
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ),

                                              const CustomTextGetfunding(
                                                isrequire: true,
                                                label1:
                                                    'Do you have market study documents?',
                                                label2: '',
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20,
                                                    bottom: 20,
                                                    right: 20,
                                                    top: 20),
                                                child: Row(
                                                  children: [
                                                    CustomSelectgetFunding(
                                                      onSelect: InjectionHelper
                                                              .equityInvestmentController
                                                              .marketStudy
                                                              .value ==
                                                          0,
                                                      title: 'No',
                                                      ontap: () {
                                                        InjectionHelper
                                                            .equityInvestmentController
                                                            .marketStudy
                                                            .value = 0;
                                                      },
                                                    ),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    CustomSelectgetFunding(
                                                      title: 'Yes',
                                                      onSelect: InjectionHelper
                                                              .equityInvestmentController
                                                              .marketStudy
                                                              .value ==
                                                          1,
                                                      ontap: () {
                                                        InjectionHelper
                                                            .equityInvestmentController
                                                            .marketStudy
                                                            .value = 1;
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),

                                              const CustomTextGetfunding(
                                                isrequire: true,
                                                label1:
                                                    'Do you have other documents necessary for business and market understanding?',
                                                label2: '',
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20,
                                                    bottom: 20,
                                                    right: 20,
                                                    top: 20),
                                                child: Row(
                                                  children: [
                                                    CustomSelectgetFunding(
                                                      onSelect: InjectionHelper
                                                              .equityInvestmentController
                                                              .otherDocuments
                                                              .value ==
                                                          0,
                                                      title: 'No',
                                                      ontap: () {
                                                        InjectionHelper
                                                            .equityInvestmentController
                                                            .otherDocuments
                                                            .value = 0;
                                                      },
                                                    ),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    CustomSelectgetFunding(
                                                      title: 'Yes',
                                                      onSelect: InjectionHelper
                                                              .equityInvestmentController
                                                              .otherDocuments
                                                              .value ==
                                                          1,
                                                      ontap: () {
                                                        InjectionHelper
                                                            .equityInvestmentController
                                                            .otherDocuments
                                                            .value = 1;
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),

                                              const SizedBox(
                                                height: 20,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        bottom: 10,
                                        top: 10),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: CustomButton(
                                            isDisable: InjectionHelper
                                                            .equityInvestmentController
                                                            .numberOfShareHolders
                                                            .value ==
                                                        0 &&
                                                    InjectionHelper
                                                            .equityInvestmentController
                                                            .numberOfBoardMembers
                                                            .value ==
                                                        0 &&
                                                    InjectionHelper
                                                            .equityInvestmentController
                                                            .numberOfBoardMembers
                                                            .value ==
                                                        0 &&
                                                    InjectionHelper
                                                            .equityInvestmentController
                                                            .businessPlan
                                                            .value ==
                                                        0 &&
                                                    InjectionHelper
                                                            .equityInvestmentController
                                                            .articleOfIncorporation
                                                            .value ==
                                                        0 &&
                                                    InjectionHelper
                                                            .equityInvestmentController
                                                            .incomeStatement
                                                            .value ==
                                                        0 &&
                                                    InjectionHelper
                                                            .equityInvestmentController
                                                            .balanceSheet
                                                            .value ==
                                                        0 &&
                                                    InjectionHelper
                                                            .equityInvestmentController
                                                            .cashFlowStatement
                                                            .value ==
                                                        0 &&
                                                    InjectionHelper
                                                            .equityInvestmentController
                                                            .marketStudy
                                                            .value ==
                                                        0 &&
                                                    InjectionHelper
                                                            .equityInvestmentController
                                                            .otherDocuments
                                                            .value ==
                                                        0
                                                ? true
                                                : checkDisableSavedraft()
                                                    ? true
                                                    : false,
                                            isOutline: true,
                                            onPressed: widget.id != null
                                                ? () async {
                                                    FirebaseAnalyticsHelper
                                                        .sendAnalyticsEvent(
                                                            "Equity Update Draft Step3");
                                                    await InjectionHelper
                                                        .equityInvestmentController
                                                        .onEditEquityInvestment(
                                                            showSnackbar: false,
                                                            context: context,
                                                            id: widget.id!,
                                                            pagenumber: "3",
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
                                                            "Equity Save Draft Step3");
                                                    await InjectionHelper
                                                        .equityInvestmentController
                                                        .onSubmitEquityInvestment(
                                                            showSnackbar: false,
                                                            context: context,
                                                            type: "3");
                                                  },
                                            title: widget.id != null
                                                ? 'Update Draft'
                                                : 'Save Draft',
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Expanded(
                                          child: CustomButton(
                                            isDisable: false,
                                            isOutline: false,
                                            onPressed: _onpress,
                                            title: 'Next',
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                      )),
            ),
          ),
        ),
      ),
    );
  }
}
