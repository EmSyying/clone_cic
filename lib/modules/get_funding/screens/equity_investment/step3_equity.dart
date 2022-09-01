import 'dart:io';
import 'package:cicgreenloan/Utils/chart/custom_circle_chart_1_3.dart';
import 'package:cicgreenloan/Utils/helper/numerice_format.dart';
import 'package:cicgreenloan/Utils/option_controller/option_controller.dart';
import 'package:cicgreenloan/Utils/pop_up_alert/show_alert_dialog.dart';
import 'package:cicgreenloan/Utils/helper/option_model/option_model.dart';
import 'package:cicgreenloan/modules/get_funding/controller/equity_investment_controller.dart';
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
  final equityController = Get.put(EquityInvestmentController());

  final optionController = Get.put(DocumentCategory());
  @override
  void initState() {
    if (widget.id != null) inistialdata();
    super.initState();
  }

  inistialdata() async {
    await equityController.fetchAppDetails(widget.id!);

    equityController.status.value =
        equityController.applicationData.value.status!;
    equityController.equityId.value =
        equityController.applicationData.value.id!;
    equityController.financingAmoung.value =
        equityController.applicationData.value.financialAmount != null
            ? equityController.applicationData.value.financialAmount!.toInt()
            : 0;
    equityController.intendedDate.value =
        equityController.applicationData.value.intendedDateDisbursement!;
    equityController.numberOfShareHolders.value =
        equityController.applicationData.value.numberofshareholder!.toInt();

    ///
    var displaynumberofshareholder = FormatNumber.formatNumberDefualt(
        equityController.applicationData.value.numberofshareholder!);
    equityController.numberofSharecontroller.text =
        equityController.applicationData.value.numberofshareholder! == 0
            ? ""
            : displaynumberofshareholder.toString();

    ///
    var displaynumberofboardmember = FormatNumber.formatNumberDefualt(
        equityController.applicationData.value.numberofboardmember!);
    equityController.numberofBoardcontroller.text =
        equityController.applicationData.value.numberofboardmember == 0
            ? ""
            : displaynumberofboardmember.toString();

    ///
    equityController.numberOfBoardMembers.value =
        equityController.applicationData.value.numberofboardmember!.toInt();
    equityController.useOfFund.value =
        equityController.applicationData.value.useofFund!;

    equityController.companyName.value =
        equityController.applicationData.value.company!.companyName!;
    equityController.address.value =
        equityController.applicationData.value.company!.address!;
    equityController.yearOfEstablishment.value =
        equityController.applicationData.value.company!.yearFounded!.toString();

    equityController.typeOfOrganization.value = equityController
                .applicationData.value.company!.typeOfOrganization !=
            null
        ? equityController.applicationData.value.company!.typeOfOrganization!
        : Optionmodel(id: 0, display: "");

    equityController.taxIdentificationNumber.value = equityController
        .applicationData.value.company!.taxIdentificationNumber!;
    equityController.industry.value =
        equityController.applicationData.value.company!.industry != null
            ? equityController.applicationData.value.company!.industry!
            : Optionmodel(id: 0, display: "");

    equityController.numberOfStaff.value = equityController
        .applicationData.value.company!.numberOfStaff!
        .toString();
    equityController.ownerName.value =
        equityController.applicationData.value.company!.ownerName!;
    equityController.productSevice.value = equityController
        .applicationData.value.company!.companyProductAndService!;
    equityController.patentDocument.value =
        equityController.applicationData.value.companyPatentDoc!;
    equityController.certificatioDoc.value =
        equityController.applicationData.value.companyMoCCertificate!;
    equityController.licenseDoc.value =
        equityController.applicationData.value.companyLicenceDoc!;
    equityController.memorandumDoc.value =
        equityController.applicationData.value.companyMAA!;

    equityController.purposeOfFund.value =
        equityController.applicationData.value.raisefundusefor!.toInt();

    equityController.haveTheConsenus.value =
        equityController.applicationData.value.iscompanyraisefund!.toInt();
    equityController.areYouTheMajorityShareholder.value =
        equityController.applicationData.value.ismajorityshareholder!.toInt();
    equityController.havefinancial.value =
        equityController.applicationData.value.financialroject!.toInt();
    equityController.businessPlan.value =
        equityController.applicationData.value.businessPlan!.toInt();
    equityController.articleOfIncorporation.value =
        equityController.applicationData.value.articleOfIncorporation!.toInt();
    equityController.incomeStatement.value =
        equityController.applicationData.value.incomeStatement!.toInt();
    equityController.balanceSheet.value =
        equityController.applicationData.value.balanceSheet!.toInt();
    equityController.cashFlowStatement.value =
        equityController.applicationData.value.cashFlowStatement!.toInt();
    equityController.marketStudy.value =
        equityController.applicationData.value.marketStudyDocs!.toInt();
    equityController.otherDocuments.value =
        equityController.applicationData.value.otherDocument!.toInt();
  }

  void _onpress() {
    if (equityController.numberOfShareHolders.value == 0) {
      equityController.isValNumberOfShareHolders.value = false;
    } else {
      equityController.isValNumberOfShareHolders.value = true;
    }
    if (equityController.numberOfBoardMembers.value == 0) {
      equityController.isValNumberOfBoardMembers.value = false;
    } else {
      equityController.isValNumberOfBoardMembers.value = true;
    }

    if (equityController.numberOfBoardMembers.value != 0 &&
        equityController.numberOfShareHolders.value != 0) {
      context
          .go("/get-funding/equity-investment/preview-equity?id=${widget.id}");
    }
  }

  Function eq = const ListEquality().equals;
  bool checkDisableSavedraft() {
    return equityController.numberOfShareHolders.toString() ==
            equityController.applicationData.value.numberofshareholder
                .toString() &&
        equityController.haveTheConsenus.toString() ==
            equityController.applicationData.value.iscompanyraisefund
                .toString() &&
        equityController.purposeOfFund.value.toString() ==
            equityController.applicationData.value.raisefundusefor.toString() &&
        equityController.areYouTheMajorityShareholder.toString() ==
            equityController.applicationData.value.ismajorityshareholder
                .toString() &&
        equityController.havefinancial.value.toString() ==
            equityController.applicationData.value.financialroject!
                .toString() &&
        equityController.numberOfBoardMembers.toString() ==
            equityController.applicationData.value.numberofboardmember
                .toString() &&
        equityController.businessPlan.value ==
            equityController.applicationData.value.businessPlan &&
        equityController.articleOfIncorporation.value ==
            equityController.applicationData.value.articleOfIncorporation &&
        equityController.incomeStatement.value ==
            equityController.applicationData.value.incomeStatement &&
        equityController.balanceSheet.value ==
            equityController.applicationData.value.balanceSheet &&
        equityController.cashFlowStatement.value ==
            equityController.applicationData.value.cashFlowStatement &&
        equityController.marketStudy.value ==
            equityController.applicationData.value.marketStudyDocs &&
        equityController.otherDocuments.value ==
            equityController.applicationData.value.otherDocument;
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
              () => equityController.isLoadingSubmit.value
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
                      appBar: equityController.isSubmitLoading.value == true
                          ? AppBar()
                          : CustomAppBarWhiteColor(
                              context: context,
                              title: 'Equity Investment',
                              leading: IconButton(
                                onPressed: widget.id != null &&
                                        checkDisableSavedraft()
                                    ? () {
                                        FocusScope.of(context).unfocus();
                                        Navigator.pop(context);
                                      }
                                    : equityController.numberOfShareHolders.value == 0 &&
                                            equityController
                                                    .numberOfBoardMembers
                                                    .value ==
                                                0 &&
                                            equityController.businessPlan.value ==
                                                0 &&
                                            equityController
                                                    .articleOfIncorporation
                                                    .value ==
                                                0 &&
                                            equityController.incomeStatement.value ==
                                                0 &&
                                            equityController.balanceSheet.value ==
                                                0 &&
                                            equityController
                                                    .cashFlowStatement.value ==
                                                0 &&
                                            equityController
                                                    .marketStudy.value ==
                                                0 &&
                                            equityController
                                                    .otherDocuments.value ==
                                                0
                                        ? () {
                                            FocusScope.of(context).unfocus();
                                            Navigator.pop(context);
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
                                                  // Navigator.pop(context);

                                                  if (widget.id == null) {
                                                    Navigator.pop(context);
                                                    await equityController
                                                        .onSubmitEquityInvestment(
                                                            context: context,
                                                            type: "3");
                                                    debugPrint(
                                                        "Submitted  ....");
                                                  } else {
                                                    debugPrint("Edit Update");

                                                    equityController
                                                        .onEditEquityInvestment(
                                                            context: context,
                                                            id: widget.id!,
                                                            pagenumber: "3");
                                                    Navigator.pop(context);
                                                  }
                                                },
                                                isCancel: true,
                                                onDiscard: () {
                                                  equityController.resetData();
                                                  context.go(
                                                      '/get-funding/equity-investment');
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
                        () => equityController.isLoadingData.value
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
                                              const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20,
                                                    vertical: 10),
                                                child: Text(
                                                  'Business Overview',
                                                  style: TextStyle(
                                                      fontFamily: 'DMSans',
                                                      fontSize: 15,
                                                      color: Color(0xff0F50A4),
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ),
                                              CustomTextFieldNew(
                                                controller: equityController
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
                                                isValidate: equityController
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
                                                    equityController
                                                        .numberOfShareHolders
                                                        .value = 0;
                                                    equityController
                                                        .isValNumberOfShareHolders
                                                        .value = false;
                                                  } else {
                                                    equityController
                                                            .numberOfShareHolders
                                                            .value =
                                                        int.parse(value);
                                                    if (equityController
                                                            .numberOfShareHolders
                                                            .value >
                                                        0) {
                                                      equityController
                                                          .isValNumberOfShareHolders
                                                          .value = true;
                                                    } else {
                                                      equityController
                                                          .isValNumberOfShareHolders
                                                          .value = false;
                                                    }
                                                  }
                                                },
                                                initialValue: equityController
                                                            .numberOfShareHolders
                                                            .value ==
                                                        0
                                                    ? ''
                                                    : FormatNumber
                                                        .formDecimalNumber(
                                                            equityController
                                                                .numberOfShareHolders
                                                                .value),
                                              ),
                                              CustomTextFieldNew(
                                                controller: equityController
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
                                                isValidate: equityController
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
                                                    equityController
                                                        .numberOfBoardMembers
                                                        .value = 0;
                                                    equityController
                                                        .isValNumberOfBoardMembers
                                                        .value = false;
                                                  } else {
                                                    equityController
                                                            .numberOfBoardMembers
                                                            .value =
                                                        int.parse(value);
                                                    if (equityController
                                                            .numberOfBoardMembers
                                                            .value >
                                                        0) {
                                                      equityController
                                                          .isValNumberOfBoardMembers
                                                          .value = true;
                                                    } else {
                                                      equityController
                                                          .isValNumberOfBoardMembers
                                                          .value = false;
                                                    }
                                                  }
                                                },
                                                initialValue: equityController
                                                            .numberOfBoardMembers
                                                            .value ==
                                                        0
                                                    ? ''
                                                    : equityController
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
                                                      onSelect: equityController
                                                              .haveTheConsenus
                                                              .value ==
                                                          0,
                                                      title: 'No',
                                                      ontap: () {
                                                        equityController
                                                            .haveTheConsenus
                                                            .value = 0;
                                                      },
                                                    ),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    CustomSelectgetFunding(
                                                      title: 'Yes',
                                                      onSelect: equityController
                                                              .haveTheConsenus
                                                              .value ==
                                                          1,
                                                      ontap: () {
                                                        equityController
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
                                                    children: optionController
                                                        .optionData
                                                        .value
                                                        .riaseuseoffund!
                                                        .map((e) =>
                                                            CustomSelect2GetFunding(
                                                              title: e.display,
                                                              isSelect: equityController
                                                                      .purposeOfFund
                                                                      .value ==
                                                                  e.id,
                                                              ontap: () {
                                                                equityController
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
                                                      onSelect: equityController
                                                              .areYouTheMajorityShareholder
                                                              .value ==
                                                          0,
                                                      title: 'No',
                                                      ontap: () {
                                                        // equityController
                                                        //     .areYouTheMajorityShareholder
                                                        //     .value = 0;
                                                        equityController
                                                            .areYouTheMajorityShareholder
                                                            .value = 0;
                                                      },
                                                    ),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    CustomSelectgetFunding(
                                                      title: 'Yes',
                                                      onSelect: equityController
                                                              .areYouTheMajorityShareholder
                                                              .value ==
                                                          1,
                                                      ontap: () {
                                                        equityController
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
                                                      onSelect: equityController
                                                              .businessPlan
                                                              .value ==
                                                          0,
                                                      title: 'No',
                                                      ontap: () {
                                                        equityController
                                                            .businessPlan
                                                            .value = 0;
                                                      },
                                                    ),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    CustomSelectgetFunding(
                                                      title: 'Yes',
                                                      onSelect: equityController
                                                              .businessPlan
                                                              .value ==
                                                          1,
                                                      ontap: () {
                                                        equityController
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
                                                      onSelect: equityController
                                                              .articleOfIncorporation
                                                              .value ==
                                                          0,
                                                      title: 'No',
                                                      ontap: () {
                                                        equityController
                                                            .articleOfIncorporation
                                                            .value = 0;
                                                      },
                                                    ),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    CustomSelectgetFunding(
                                                      title: 'Yes',
                                                      onSelect: equityController
                                                              .articleOfIncorporation
                                                              .value ==
                                                          1,
                                                      ontap: () {
                                                        equityController
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
                                              const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20,
                                                    vertical: 20),
                                                child: Text(
                                                  'Financial Performance and Projection',
                                                  style: TextStyle(
                                                      fontFamily: 'DMSans',
                                                      fontSize: 15,
                                                      color: Color(0xff0F50A4),
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
                                                      onSelect: equityController
                                                              .incomeStatement
                                                              .value ==
                                                          0,
                                                      title: 'No',
                                                      ontap: () {
                                                        equityController
                                                            .incomeStatement
                                                            .value = 0;
                                                      },
                                                    ),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    CustomSelectgetFunding(
                                                      title: 'Yes',
                                                      onSelect: equityController
                                                              .incomeStatement
                                                              .value ==
                                                          1,
                                                      ontap: () {
                                                        equityController
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
                                                      onSelect: equityController
                                                              .balanceSheet
                                                              .value ==
                                                          0,
                                                      title: 'No',
                                                      ontap: () {
                                                        equityController
                                                            .balanceSheet
                                                            .value = 0;
                                                      },
                                                    ),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    CustomSelectgetFunding(
                                                      title: 'Yes',
                                                      onSelect: equityController
                                                              .balanceSheet
                                                              .value ==
                                                          1,
                                                      ontap: () {
                                                        equityController
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
                                                      onSelect: equityController
                                                              .cashFlowStatement
                                                              .value ==
                                                          0,
                                                      title: 'No',
                                                      ontap: () {
                                                        equityController
                                                            .cashFlowStatement
                                                            .value = 0;
                                                      },
                                                    ),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    CustomSelectgetFunding(
                                                      title: 'Yes',
                                                      onSelect: equityController
                                                              .cashFlowStatement
                                                              .value ==
                                                          1,
                                                      ontap: () {
                                                        equityController
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
                                                      onSelect: equityController
                                                              .havefinancial
                                                              .value ==
                                                          0,
                                                      title: 'No',
                                                      ontap: () {
                                                        equityController
                                                            .havefinancial
                                                            .value = 0;
                                                      },
                                                    ),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    CustomSelectgetFunding(
                                                      title: 'Yes',
                                                      onSelect: equityController
                                                              .havefinancial
                                                              .value ==
                                                          1,
                                                      ontap: () {
                                                        equityController
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
                                              const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20,
                                                    vertical: 20),
                                                child: Text(
                                                  'Other',
                                                  style: TextStyle(
                                                      fontFamily: 'DMSans',
                                                      fontSize: 15,
                                                      color: Color(0xff0F50A4),
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
                                                      onSelect: equityController
                                                              .marketStudy
                                                              .value ==
                                                          0,
                                                      title: 'No',
                                                      ontap: () {
                                                        equityController
                                                            .marketStudy
                                                            .value = 0;
                                                      },
                                                    ),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    CustomSelectgetFunding(
                                                      title: 'Yes',
                                                      onSelect: equityController
                                                              .marketStudy
                                                              .value ==
                                                          1,
                                                      ontap: () {
                                                        equityController
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
                                                      onSelect: equityController
                                                              .otherDocuments
                                                              .value ==
                                                          0,
                                                      title: 'No',
                                                      ontap: () {
                                                        equityController
                                                            .otherDocuments
                                                            .value = 0;
                                                      },
                                                    ),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    CustomSelectgetFunding(
                                                      title: 'Yes',
                                                      onSelect: equityController
                                                              .otherDocuments
                                                              .value ==
                                                          1,
                                                      ontap: () {
                                                        equityController
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
                                        bottom: 35,
                                        top: 10),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: CustomButton(
                                            isDisable: equityController
                                                            .numberOfShareHolders
                                                            .value ==
                                                        0 &&
                                                    equityController
                                                            .numberOfBoardMembers
                                                            .value ==
                                                        0 &&
                                                    equityController
                                                            .numberOfBoardMembers
                                                            .value ==
                                                        0 &&
                                                    equityController.businessPlan
                                                            .value ==
                                                        0 &&
                                                    equityController
                                                            .articleOfIncorporation
                                                            .value ==
                                                        0 &&
                                                    equityController
                                                            .incomeStatement
                                                            .value ==
                                                        0 &&
                                                    equityController
                                                            .balanceSheet
                                                            .value ==
                                                        0 &&
                                                    equityController
                                                            .cashFlowStatement
                                                            .value ==
                                                        0 &&
                                                    equityController.marketStudy
                                                            .value ==
                                                        0 &&
                                                    equityController
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
                                                    await equityController
                                                        .onEditEquityInvestment(
                                                            showSnackbar: false,
                                                            context: context,
                                                            id: widget.id!,
                                                            pagenumber: "3",
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
                                                            "Equity Save Draft Step3");
                                                    await equityController
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
