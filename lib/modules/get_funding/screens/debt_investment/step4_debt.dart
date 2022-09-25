import 'dart:io';
import 'package:cicgreenloan/Utils/helper/option_model/option_model.dart';
import 'package:cicgreenloan/modules/get_funding/controller/debt_investment_controller.dart';
import 'package:cicgreenloan/modules/get_funding/models/loan_option.dart';
import 'package:cicgreenloan/utils/chart/custom_circle_chart_1_3.dart';
import 'package:cicgreenloan/utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/utils/form_builder/custom_form_card.dart';
import 'package:cicgreenloan/utils/pop_up_alert/show_alert_dialog.dart';
import 'package:cicgreenloan/utils/select_address/address_model/address.dart';
import 'package:cicgreenloan/utils/select_address/address_model/full_address_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../Utils/helper/container_partern.dart';

import '../../../../Utils/helper/firebase_analytics.dart';
import '../../../../utils/helper/custom_appbar_colorswhite.dart';
import '../../../../widgets/get_funding/custom_call_center.dart';
import '../../../../widgets/get_funding/custom_select_getfunding.dart';
import '../../../../widgets/get_funding/custom_text_getfunding.dart';

class RequiredDocument extends StatefulWidget {
  final int? id;
  final int? step;
  const RequiredDocument({
    Key? key,
    this.id,
    this.step,
  }) : super(key: key);

  @override
  State<RequiredDocument> createState() => _RequiredDocumentState();
}

class _RequiredDocumentState extends State<RequiredDocument> {
  final DebtInvestmentController debtCon = Get.put(DebtInvestmentController());

  void _onValidate() {
    context.push("/get_funding/preview-debt?id=${widget.id}");
  }

  @override
  void initState() {
    if (widget.id != null) {
      debtCon.fetchAppDetails(widget.id!).then((value) {
        // ============initial step1 =============
        if (debtCon.applicationDetail.value.customerInfo!.customerGender !=
            null) {
          debtCon.gender.value.display = debtCon
              .applicationDetail.value.customerInfo!.customerGender!.display;
          debtCon.gender.value.id =
              debtCon.applicationDetail.value.customerInfo!.customerGender!.id;
        }

        if (debtCon.applicationDetail.value.customerInfo!.customerName != "") {
          debtCon.fullName.value =
              debtCon.applicationDetail.value.customerInfo!.customerName!;
        }

        if (debtCon.applicationDetail.value.customerInfo!.customerEmail != "") {
          debtCon.email.value =
              debtCon.applicationDetail.value.customerInfo!.customerEmail!;
        }
        if (debtCon.applicationDetail.value.customerInfo!.customerDateOfBirth !=
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
            houseNo:
                debtCon.applicationDetail.value.customerInfo!.currentHouseNo ??
                    "",
            streetNo:
                debtCon.applicationDetail.value.customerInfo!.currentStreetNo ??
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
            streetNo: debtCon
                    .applicationDetail.value.customerInfo!.residenceStreetNo ??
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
        debtCon.productType.value = Option(
            id: value.productType!.id!.toInt(),
            productName: value.productType!.name);

        debtCon.financingPurpose.value = Optionmodel(
            id: value.financialPurpose!.id,
            display: value.financialPurpose!.display);
        debtCon.financingAmount.value = value.financialAmount!.toDouble();
        debtCon.term.value = value.duration!.toInt();
        debtCon.intendedDate.value = value.intendedDateDisbursement.toString();
        debtCon.financingAmountcontroller.text =
            debtCon.applicationDetail.value.financialAmount!.toString() == "0"
                ? ""
                : debtCon.applicationDetail.value.financialAmount!.toString();
        debtCon.financingAmount.value =
            debtCon.applicationDetail.value.financialAmount != null
                ? debtCon.financingAmount.value
                : 0;
        debtCon.termController.text =
            debtCon.applicationDetail.value.duration.toString() == ""
                ? ""
                : debtCon.applicationDetail.value.duration.toString();
        debtCon.term.value = debtCon.applicationDetail.value.duration != null
            ? debtCon.term.value
            : 0;
        // =================End initial step 2================

        debtCon.companyName.value = value.company!.companyName!;

        debtCon.address.value = value.company!.address!;
        debtCon.addresscontroller.text = value.company!.address!;
        debtCon.yearOfEstablishment.value =
            value.company!.yearFounded!.toString();
        debtCon.yearofestablistmentController.text =
            value.company!.yearFounded!.toString();
        debtCon.typeOfOrganization.value =
            value.company!.typeOfOrganization != null
                ? Optionmodel(
                    id: value.company!.typeOfOrganization!.id!,
                    display: value.company!.typeOfOrganization!.display!)
                : Optionmodel(id: 0, display: "");

        debtCon.taxIdentificationNumber.value =
            value.company!.taxIdentificationNumber!;
        debtCon.taxindentificationController.text =
            value.company!.taxIdentificationNumber!;
        debtCon.industry.value = value.company!.industry != null
            ? Optionmodel(
                id: value.company!.industry!.id!,
                display: value.company!.industry!.display!)
            : Optionmodel(id: 0, display: "");
        debtCon.numberofStaffController.text =
            value.company!.numberOfStaff!.toString();
        debtCon.numberOfStaff.value = value.company!.numberOfStaff!.toString();
        debtCon.ownernameController.text = value.company!.ownerName!;
        debtCon.ownerName.value = value.company!.ownerName!;
        debtCon.productSevice.value = value.company!.companyProductAndService!;
        debtCon.productController.text =
            value.company!.companyProductAndService!;

        debtCon.patentDocument.value = value.companyPatentDoc!;
        debtCon.certificatioDoc.value = value.companyMoCCertificate!;
        debtCon.licenseDoc.value = value.companyLicenceDoc!;
        debtCon.memorandumDoc.value = value.companyMAA!;
        debtCon.businessPlan.value = value.businessPlan!.toInt();
        debtCon.incomeStatement.value = value.incomeStatement!.toInt();
        debtCon.balanceSheet.value = value.balanceSheet!.toInt();
        debtCon.cashFlowStatement.value = value.cashFlowStatement!.toInt();

        debtCon.otherDocuments.value = value.otherDocument!.toInt();

        debtCon.patentDoc.clear();
      });
    }

    super.initState();
  }

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
                    appBar: debtCon.isSubmitLoading.value == true
                        ? AppBar()
                        : CustomAppBarWhiteColor(
                            leading: IconButton(
                              onPressed: () {
                                showSaveDraftDialog(
                                  onSaveTitle: widget.id != null
                                      ? "Update Draft"
                                      : "Save Draft",
                                  context: context,
                                  isCancel: true,
                                  content:
                                      'Changes made to this page haven’t been saved yet.',
                                  title:
                                      'Are you sure you want to leave this page?',
                                  onSave: widget.id != null
                                      ? () async {
                                          //Navigator.pop(context);
                                          await debtCon.onEditDebtInvestment(
                                            frompage: debtCon
                                                .applicationDetail.value.step!
                                                .toInt(),
                                            id: widget.id,
                                            context: context,
                                            step: 4,
                                          );
                                        }
                                      : () async {
                                          //  Navigator.pop(context);
                                          await debtCon.onSubmitDebtInvestment(
                                              context: context, step: 4);
                                        },
                                  onDiscard: () {
                                    debtCon.onResetData();
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
                                numberPage: 4,
                              ),
                              const SizedBox(
                                width: 20,
                              )
                            ],
                          ),
                    body: Obx(
                      () => debtCon.isLoadingData.value
                          ? const LinearProgressIndicator()
                          : SizedBox(
                              width: double.infinity,
                              height: double.infinity,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 20),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20),
                                            child: Text(
                                              'Required Documents',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline2,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          CustomFormCard(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 4, bottom: 4),
                                                  child: CustomTextGetfunding(
                                                    isrequire: false,
                                                    label1:
                                                        'Do you have Income Statement (Monthly and yearly statement during last 3 years)?',
                                                    label2: '',
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 14,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20, bottom: 14),
                                                  child: Row(
                                                    children: [
                                                      CustomSelectgetFunding(
                                                        onSelect: debtCon
                                                                .incomeStatement
                                                                .value ==
                                                            0,
                                                        title: 'No',
                                                        ontap: () {
                                                          debtCon
                                                              .incomeStatement
                                                              .value = 0;
                                                        },
                                                      ),
                                                      const SizedBox(
                                                        width: 20,
                                                      ),
                                                      CustomSelectgetFunding(
                                                        title: 'Yes',
                                                        onSelect: debtCon
                                                                .incomeStatement
                                                                .value ==
                                                            1,
                                                        ontap: () {
                                                          debtCon
                                                              .incomeStatement
                                                              .value = 1;
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 4, bottom: 4),
                                                  child: CustomTextGetfunding(
                                                    isrequire: false,
                                                    label1:
                                                        'Do you have Balance Sheet (Monthly and yearly statement during last 3 years)?',
                                                    label2: '',
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 14,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20, bottom: 14),
                                                  child: Row(
                                                    children: [
                                                      CustomSelectgetFunding(
                                                        onSelect: debtCon
                                                                .balanceSheet
                                                                .value ==
                                                            0,
                                                        title: 'No',
                                                        ontap: () {
                                                          debtCon.balanceSheet
                                                              .value = 0;
                                                        },
                                                      ),
                                                      const SizedBox(
                                                        width: 20,
                                                      ),
                                                      CustomSelectgetFunding(
                                                        title: 'Yes',
                                                        onSelect: debtCon
                                                                .balanceSheet
                                                                .value ==
                                                            1,
                                                        ontap: () {
                                                          debtCon.balanceSheet
                                                              .value = 1;
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 4, bottom: 4),
                                                  child: CustomTextGetfunding(
                                                    isrequire: false,
                                                    label1:
                                                        'Do you have Cash Flow Statement (Monthly and yearly statement during last 3 years)?',
                                                    label2: '',
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 14,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20, bottom: 14),
                                                  child: Row(
                                                    children: [
                                                      CustomSelectgetFunding(
                                                        onSelect: debtCon
                                                                .cashFlowStatement
                                                                .value ==
                                                            0,
                                                        title: 'No',
                                                        ontap: () {
                                                          debtCon
                                                              .cashFlowStatement
                                                              .value = 0;
                                                        },
                                                      ),
                                                      const SizedBox(
                                                        width: 20,
                                                      ),
                                                      CustomSelectgetFunding(
                                                        title: 'Yes',
                                                        onSelect: debtCon
                                                                .cashFlowStatement
                                                                .value ==
                                                            1,
                                                        ontap: () {
                                                          debtCon
                                                              .cashFlowStatement
                                                              .value = 1;
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 4, bottom: 4),
                                                  child: CustomTextGetfunding(
                                                    isrequire: true,
                                                    label1:
                                                        'Do you have Business Plan/Presentation?',
                                                    label2: '',
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 14,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20, bottom: 14),
                                                  child: Row(
                                                    children: [
                                                      CustomSelectgetFunding(
                                                        onSelect: debtCon
                                                                .businessPlan
                                                                .value ==
                                                            0,
                                                        title: 'No',
                                                        ontap: () {
                                                          debtCon.businessPlan
                                                              .value = 0;
                                                        },
                                                      ),
                                                      const SizedBox(
                                                        width: 20,
                                                      ),
                                                      CustomSelectgetFunding(
                                                        title: 'Yes',
                                                        onSelect: debtCon
                                                                .businessPlan
                                                                .value ==
                                                            1,
                                                        ontap: () {
                                                          debtCon.businessPlan
                                                              .value = 1;
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 4, bottom: 4),
                                                  child: CustomTextGetfunding(
                                                    isrequire: true,
                                                    label1:
                                                        'Do you have Other documents necessary for business and market understanding?',
                                                    label2: '',
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 14,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20, bottom: 14),
                                                  child: Row(
                                                    children: [
                                                      CustomSelectgetFunding(
                                                        onSelect: debtCon
                                                                .otherDocuments
                                                                .value ==
                                                            0,
                                                        title: 'No',
                                                        ontap: () {
                                                          debtCon.otherDocuments
                                                              .value = 0;
                                                        },
                                                      ),
                                                      const SizedBox(
                                                        width: 20,
                                                      ),
                                                      CustomSelectgetFunding(
                                                        title: 'Yes',
                                                        onSelect: debtCon
                                                                .otherDocuments
                                                                .value ==
                                                            1,
                                                        ontap: () {
                                                          debtCon.otherDocuments
                                                              .value = 1;
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        bottom: 30,
                                        top: 10),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: CustomButton(
                                            isDisable: false,
                                            isOutline: true,
                                            onPressed: () async {
                                              if (widget.id != null) {
                                                FirebaseAnalyticsHelper
                                                    .sendAnalyticsEvent(
                                                        "Debt Update Draft Step4");
                                              } else {
                                                FirebaseAnalyticsHelper
                                                    .sendAnalyticsEvent(
                                                        "Debt Save Draft Step4");
                                              }
                                              widget.id != null
                                                  ? await debtCon
                                                      .onEditDebtInvestment(
                                                        showDebtSnackbar: false,
                                                        frompage: debtCon
                                                            .applicationDetail
                                                            .value
                                                            .step!
                                                            .toInt(),
                                                        id: widget.id,
                                                        context: context,
                                                        step: 4,
                                                      )
                                                      .then((value) =>
                                                          debtCon.onResetData())
                                                  : await debtCon
                                                      .onSubmitDebtInvestment(
                                                          showDebtSnackbar:
                                                              false,
                                                          context: context,
                                                          step: 4)
                                                      .then((value) => debtCon
                                                          .onResetData());
                                              // Navigator.pop(context);
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
                                            onPressed: _onValidate,
                                            title: 'Preview',
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                    )),
          ),
        ),
      ),
    );
  }
}
