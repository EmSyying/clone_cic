import 'dart:io';
import 'package:cicgreenloan/Utils/helper/injection_helper/injection_helper.dart';
import 'package:cicgreenloan/Utils/helper/option_model/option_model.dart';
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
  void _onValidate() {
    context.push("/get_funding/preview-debt?id=${widget.id}");
  }

  @override
  void initState() {
    if (widget.id != null) {
      InjectionHelper.debtInvestmentController
          .fetchAppDetails(widget.id!)
          .then((value) {
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
          InjectionHelper.debtInvestmentController.email.value = InjectionHelper
              .debtInvestmentController
              .applicationDetail
              .value
              .customerInfo!
              .customerEmail!;
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
          InjectionHelper
                  .debtInvestmentController.fullCurrentAddress.value.streetNo =
              InjectionHelper.debtInvestmentController.applicationDetail.value
                  .customerInfo!.currentStreetNo;
        }

        if (InjectionHelper.debtInvestmentController.applicationDetail.value
                .customerInfo!.currentAddress !=
            null) {
          InjectionHelper.debtInvestmentController.fullCurrentAddress.value =
              FullAddress(
            houseNo: InjectionHelper.debtInvestmentController.applicationDetail
                    .value.customerInfo!.currentHouseNo ??
                "",
            streetNo: InjectionHelper.debtInvestmentController.applicationDetail
                    .value.customerInfo!.currentStreetNo ??
                "",
            addressList: [
              Address(
                code: InjectionHelper.debtInvestmentController.applicationDetail
                    .value.customerInfo!.currentAddress!.city!.code,
                name: InjectionHelper.debtInvestmentController.applicationDetail
                    .value.customerInfo!.currentAddress!.city!.name,
              ),
              Address(
                code: InjectionHelper.debtInvestmentController.applicationDetail
                    .value.customerInfo!.currentAddress!.district!.code,
                name: InjectionHelper.debtInvestmentController.applicationDetail
                    .value.customerInfo!.currentAddress!.district!.name,
              ),
              Address(
                code: InjectionHelper.debtInvestmentController.applicationDetail
                    .value.customerInfo!.currentAddress!.commune!.code,
                name: InjectionHelper.debtInvestmentController.applicationDetail
                    .value.customerInfo!.currentAddress!.commune!.name,
              ),
              Address(
                code: InjectionHelper.debtInvestmentController.applicationDetail
                    .value.customerInfo!.currentAddress!.village!.code,
                name: InjectionHelper.debtInvestmentController.applicationDetail
                    .value.customerInfo!.currentAddress!.village!.name,
              ),
            ],
          );
        }
        if (InjectionHelper.debtInvestmentController.applicationDetail.value
                .customerInfo!.residenceAddress !=
            null) {
          InjectionHelper.debtInvestmentController.fullResidentAddress.value =
              FullAddress(
            houseNo: InjectionHelper.debtInvestmentController.applicationDetail
                    .value.customerInfo!.residenceHouseNo ??
                "",
            streetNo: InjectionHelper.debtInvestmentController.applicationDetail
                    .value.customerInfo!.residenceStreetNo ??
                "",
            addressList: [
              Address(
                code: InjectionHelper.debtInvestmentController.applicationDetail
                    .value.customerInfo!.residenceAddress!.city!.code,
                name: InjectionHelper.debtInvestmentController.applicationDetail
                    .value.customerInfo!.residenceAddress!.city!.name,
              ),
              Address(
                code: InjectionHelper.debtInvestmentController.applicationDetail
                    .value.customerInfo!.residenceAddress!.district!.code,
                name: InjectionHelper.debtInvestmentController.applicationDetail
                    .value.customerInfo!.residenceAddress!.district!.name,
              ),
              Address(
                code: InjectionHelper.debtInvestmentController.applicationDetail
                    .value.customerInfo!.residenceAddress!.commune!.code,
                name: InjectionHelper.debtInvestmentController.applicationDetail
                    .value.customerInfo!.residenceAddress!.commune!.name,
              ),
              Address(
                code: InjectionHelper.debtInvestmentController.applicationDetail
                    .value.customerInfo!.residenceAddress!.village!.code,
                name: InjectionHelper.debtInvestmentController.applicationDetail
                    .value.customerInfo!.residenceAddress!.village!.name,
              ),
            ],
          );
        }

        // =============End initial step1 =============
        InjectionHelper.debtInvestmentController.productType.value = Option(
            id: value.productType!.id!.toInt(),
            productName: value.productType!.name);

        InjectionHelper.debtInvestmentController.financingPurpose.value =
            Optionmodel(
                id: value.financialPurpose!.id,
                display: value.financialPurpose!.display);
        InjectionHelper.debtInvestmentController.financingAmount.value =
            value.financialAmount!.toDouble();
        InjectionHelper.debtInvestmentController.term.value =
            value.duration!.toInt();
        InjectionHelper.debtInvestmentController.intendedDate.value =
            value.intendedDateDisbursement.toString();
        InjectionHelper.debtInvestmentController.financingAmountcontroller
            .text = InjectionHelper.debtInvestmentController.applicationDetail
                    .value.financialAmount!
                    .toString() ==
                "0"
            ? ""
            : InjectionHelper.debtInvestmentController.applicationDetail.value
                .financialAmount!
                .toString();
        InjectionHelper.debtInvestmentController.financingAmount.value =
            InjectionHelper.debtInvestmentController.applicationDetail.value
                        .financialAmount !=
                    null
                ? InjectionHelper.debtInvestmentController.financingAmount.value
                : 0;
        InjectionHelper.debtInvestmentController.termController.text =
            InjectionHelper.debtInvestmentController.applicationDetail.value
                        .duration
                        .toString() ==
                    ""
                ? ""
                : InjectionHelper
                    .debtInvestmentController.applicationDetail.value.duration
                    .toString();
        InjectionHelper.debtInvestmentController.term.value = InjectionHelper
                    .debtInvestmentController
                    .applicationDetail
                    .value
                    .duration !=
                null
            ? InjectionHelper.debtInvestmentController.term.value
            : 0;
        // =================End initial step 2================

        InjectionHelper.debtInvestmentController.companyName.value =
            value.company!.companyName!;

        InjectionHelper.debtInvestmentController.address.value =
            value.company!.address!;
        InjectionHelper.debtInvestmentController.addresscontroller.text =
            value.company!.address!;
        InjectionHelper.debtInvestmentController.yearOfEstablishment.value =
            value.company!.yearFounded!.toString();
        InjectionHelper.debtInvestmentController.yearofestablistmentController
            .text = value.company!.yearFounded!.toString();
        InjectionHelper.debtInvestmentController.typeOfOrganization.value =
            value.company!.typeOfOrganization != null
                ? Optionmodel(
                    id: value.company!.typeOfOrganization!.id!,
                    display: value.company!.typeOfOrganization!.display!)
                : Optionmodel(id: 0, display: "");

        InjectionHelper.debtInvestmentController.taxIdentificationNumber.value =
            value.company!.taxIdentificationNumber!;
        InjectionHelper.debtInvestmentController.taxindentificationController
            .text = value.company!.taxIdentificationNumber!;
        InjectionHelper.debtInvestmentController.industry.value =
            value.company!.industry != null
                ? Optionmodel(
                    id: value.company!.industry!.id!,
                    display: value.company!.industry!.display!)
                : Optionmodel(id: 0, display: "");
        InjectionHelper.debtInvestmentController.numberofStaffController.text =
            value.company!.numberOfStaff!.toString();
        InjectionHelper.debtInvestmentController.numberOfStaff.value =
            value.company!.numberOfStaff!.toString();
        InjectionHelper.debtInvestmentController.ownernameController.text =
            value.company!.ownerName!;
        InjectionHelper.debtInvestmentController.ownerName.value =
            value.company!.ownerName!;
        InjectionHelper.debtInvestmentController.productSevice.value =
            value.company!.companyProductAndService!;
        InjectionHelper.debtInvestmentController.productController.text =
            value.company!.companyProductAndService!;

        InjectionHelper.debtInvestmentController.patentDocument.value =
            value.companyPatentDoc!;
        InjectionHelper.debtInvestmentController.certificatioDoc.value =
            value.companyMoCCertificate!;
        InjectionHelper.debtInvestmentController.licenseDoc.value =
            value.companyLicenceDoc!;
        InjectionHelper.debtInvestmentController.memorandumDoc.value =
            value.companyMAA!;
        InjectionHelper.debtInvestmentController.businessPlan.value =
            value.businessPlan!.toInt();
        InjectionHelper.debtInvestmentController.incomeStatement.value =
            value.incomeStatement!.toInt();
        InjectionHelper.debtInvestmentController.balanceSheet.value =
            value.balanceSheet!.toInt();
        InjectionHelper.debtInvestmentController.cashFlowStatement.value =
            value.cashFlowStatement!.toInt();

        InjectionHelper.debtInvestmentController.otherDocuments.value =
            value.otherDocument!.toInt();

        InjectionHelper.debtInvestmentController.patentDoc.clear();
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
                    appBar: InjectionHelper.debtInvestmentController
                                .isSubmitLoading.value ==
                            true
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
                                          await InjectionHelper
                                              .debtInvestmentController
                                              .onEditDebtInvestment(
                                            frompage: InjectionHelper
                                                .debtInvestmentController
                                                .applicationDetail
                                                .value
                                                .step!
                                                .toInt(),
                                            id: widget.id,
                                            context: context,
                                            step: 4,
                                          );
                                        }
                                      : () async {
                                          //  Navigator.pop(context);
                                          await InjectionHelper
                                              .debtInvestmentController
                                              .onSubmitDebtInvestment(
                                                  context: context, step: 4);
                                        },
                                  onDiscard: () {
                                    InjectionHelper.debtInvestmentController
                                        .onResetData();
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
                      () => InjectionHelper
                              .debtInvestmentController.isLoadingData.value
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
                                                        onSelect: InjectionHelper
                                                                .debtInvestmentController
                                                                .incomeStatement
                                                                .value ==
                                                            0,
                                                        title: 'No',
                                                        ontap: () {
                                                          InjectionHelper
                                                              .debtInvestmentController
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
                                                                .debtInvestmentController
                                                                .incomeStatement
                                                                .value ==
                                                            1,
                                                        ontap: () {
                                                          InjectionHelper
                                                              .debtInvestmentController
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
                                                        onSelect: InjectionHelper
                                                                .debtInvestmentController
                                                                .balanceSheet
                                                                .value ==
                                                            0,
                                                        title: 'No',
                                                        ontap: () {
                                                          InjectionHelper
                                                              .debtInvestmentController
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
                                                                .debtInvestmentController
                                                                .balanceSheet
                                                                .value ==
                                                            1,
                                                        ontap: () {
                                                          InjectionHelper
                                                              .debtInvestmentController
                                                              .balanceSheet
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
                                                        onSelect: InjectionHelper
                                                                .debtInvestmentController
                                                                .cashFlowStatement
                                                                .value ==
                                                            0,
                                                        title: 'No',
                                                        ontap: () {
                                                          InjectionHelper
                                                              .debtInvestmentController
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
                                                                .debtInvestmentController
                                                                .cashFlowStatement
                                                                .value ==
                                                            1,
                                                        ontap: () {
                                                          InjectionHelper
                                                              .debtInvestmentController
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
                                                        onSelect: InjectionHelper
                                                                .debtInvestmentController
                                                                .businessPlan
                                                                .value ==
                                                            0,
                                                        title: 'No',
                                                        ontap: () {
                                                          InjectionHelper
                                                              .debtInvestmentController
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
                                                                .debtInvestmentController
                                                                .businessPlan
                                                                .value ==
                                                            1,
                                                        ontap: () {
                                                          InjectionHelper
                                                              .debtInvestmentController
                                                              .businessPlan
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
                                                        onSelect: InjectionHelper
                                                                .debtInvestmentController
                                                                .otherDocuments
                                                                .value ==
                                                            0,
                                                        title: 'No',
                                                        ontap: () {
                                                          InjectionHelper
                                                              .debtInvestmentController
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
                                                                .debtInvestmentController
                                                                .otherDocuments
                                                                .value ==
                                                            1,
                                                        ontap: () {
                                                          InjectionHelper
                                                              .debtInvestmentController
                                                              .otherDocuments
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
                                                  ? await InjectionHelper
                                                      .debtInvestmentController
                                                      .onEditDebtInvestment(
                                                        showDebtSnackbar: false,
                                                        frompage: InjectionHelper
                                                            .debtInvestmentController
                                                            .applicationDetail
                                                            .value
                                                            .step!
                                                            .toInt(),
                                                        id: widget.id,
                                                        context: context,
                                                        step: 4,
                                                      )
                                                      .then((value) =>
                                                          InjectionHelper
                                                              .debtInvestmentController
                                                              .onResetData())
                                                  : await InjectionHelper
                                                      .debtInvestmentController
                                                      .onSubmitDebtInvestment(
                                                          showDebtSnackbar:
                                                              false,
                                                          context: context,
                                                          step: 4)
                                                      .then((value) =>
                                                          InjectionHelper
                                                              .debtInvestmentController
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
