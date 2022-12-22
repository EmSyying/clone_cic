import 'package:cicgreenloan/Utils/helper/format_number.dart';
import 'package:cicgreenloan/modules/get_funding/models/equat_equity_model.dart';
import 'package:cicgreenloan/Utils/helper/option_model/option_model.dart';
import 'package:cicgreenloan/modules/get_funding/screens/equity_investment/PopupEdit/popup_company_info_edit.dart';
import 'package:cicgreenloan/modules/get_funding/screens/equity_investment/PopupEdit/popup_finacial_project.dart';
import 'package:cicgreenloan/modules/get_funding/screens/equity_investment/PopupEdit/popup_financing_edit.dart';
import 'package:cicgreenloan/modules/get_funding/screens/equity_investment/PopupEdit/popup_other_project_edit.dart';
import 'package:cicgreenloan/modules/get_funding/screens/equity_investment/PopupEdit/popup_required_doc_edit.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_material_modal_sheet.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/widgets/get_funding/custom_review_company_info_card.dart';
import 'package:cicgreenloan/widgets/get_funding/custom_review_financing_info_card.dart';
import 'package:cicgreenloan/widgets/get_funding/custom_review_required_equity.dart';
import 'package:cicgreenloan/widgets/get_funding/custom_select_2_getfunding.dart';
import 'package:cicgreenloan/Utils/offline_widget.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../Utils/helper/container_partern.dart';
import '../../../../Utils/helper/custom_appbar_colorswhite.dart';
import '../../../../Utils/helper/firebase_analytics.dart';
import '../../../../Utils/helper/injection_helper/injection_helper.dart';
import '../../../../utils/function/format_date_time.dart';
import '../../../../widgets/get_funding/custom_call_center.dart';
import '../../../../widgets/get_funding/custom_rejected_reason.dart';

// ignore: must_be_immutable
class PreviewEquity extends StatefulWidget {
  final int? id;

  const PreviewEquity({
    Key? key,
    this.id,
  }) : super(key: key);

  @override
  State<PreviewEquity> createState() => _PreviewEquityState();
}

class _PreviewEquityState extends State<PreviewEquity> {
  int? idequity;
  bool isFirstEdit = true;
  bool isEdit = false;
  String? reason;
  //Financing Information
  String? financingAccountInit;
  String? intededDateInit;
  String? useOfFundInit;

  //Company Information
  String? companyNameInit;
  String? addressInit;
  String? yearOfEstablishmentInit;
  String? typeOfOrganizationInit;
  String? taxIdentificationInit;
  String? industryInit;
  String? numberOfStaffInit;
  String? ownerNameInit;
  String? productServiceInit;

  // Required Documents
  //Part 1
  String? numberOfShareholdersInit;
  String? numberOfBoardMemberInit;
  String? haveTheConsensusInit;
  String? purpostOfFundInit;
  String? areYouTheMajorityShareholderInit;
  String? _businessPlanInit;
  String? _articleOfIncorporationInit;
  //Part 2
  String? _incomeStatementInit;
  String? _balanceSheetInit;
  String? _cashFlowInitInit;
  String? haveFinancialProjectInit;
  //Part 3
  String? _martketStudyInit;
  String? _otherDocumentInit;

  @override
  void initState() {
    super.initState();

    if (widget.id == null) {
      // inistialdata();
      // initialDataToString();
    } else {
      inistialdata();
      initialDataToString();
    }
  }

  // Function eq = const ListEquality().equals;
  initialDataToString() async {
    await InjectionHelper.equityInvestmentController
        .fetchAppDetails(widget.id!);
    //Financing Infomation

    financingAccountInit = InjectionHelper
        .equityInvestmentController.applicationData.value.financialAmount
        .toString();
    intededDateInit = InjectionHelper.equityInvestmentController.applicationData
        .value.intendedDateDisbursement!;
    useOfFundInit = InjectionHelper
        .equityInvestmentController.applicationData.value.useofFund!;

    // Company Information
    companyNameInit = InjectionHelper
        .equityInvestmentController.applicationData.value.company!.companyName!;
    addressInit = InjectionHelper
        .equityInvestmentController.applicationData.value.company!.address!;
    yearOfEstablishmentInit = InjectionHelper
        .equityInvestmentController.applicationData.value.company!.yearFounded!
        .toString();

    typeOfOrganizationInit = InjectionHelper.equityInvestmentController
                .applicationData.value.company!.typeOfOrganization !=
            null
        ? InjectionHelper.equityInvestmentController.applicationData.value
            .company!.typeOfOrganization!.display
            .toString()
        : Optionmodel(id: 0, display: "").display.toString();
    taxIdentificationInit = InjectionHelper.equityInvestmentController
        .applicationData.value.company!.taxIdentificationNumber;
    industryInit = InjectionHelper.equityInvestmentController.applicationData
                .value.company!.industry !=
            null
        ? InjectionHelper.equityInvestmentController.applicationData.value
            .company!.industry!.display
        : Optionmodel(id: 0, display: "").toString();
    numberOfStaffInit = InjectionHelper.equityInvestmentController
        .applicationData.value.company!.numberOfStaff!
        .toString();
    ownerNameInit = InjectionHelper
        .equityInvestmentController.applicationData.value.company!.ownerName!;
    productServiceInit = InjectionHelper.equityInvestmentController
        .applicationData.value.company!.companyProductAndService!;

    numberOfShareholdersInit = InjectionHelper
        .equityInvestmentController.applicationData.value.numberofshareholder!
        .toString();
    numberOfBoardMemberInit = InjectionHelper
        .equityInvestmentController.applicationData.value.numberofboardmember!
        .toString();
    haveTheConsensusInit = InjectionHelper
        .equityInvestmentController.applicationData.value.iscompanyraisefund!
        .toString();
    purpostOfFundInit = InjectionHelper
        .equityInvestmentController.applicationData.value.raisefundusefor!
        .toString();
    areYouTheMajorityShareholderInit = InjectionHelper
        .equityInvestmentController.applicationData.value.ismajorityshareholder!
        .toString();
  }

  bool checkEqual() {
    return financingAccountInit !=
            InjectionHelper.equityInvestmentController.financingAmoung.value
                .toString() ||
        intededDateInit !=
            InjectionHelper.equityInvestmentController.intendedDate.value
                .toString() ||
        useOfFundInit !=
            InjectionHelper.equityInvestmentController.useOfFund.value
                .toString() ||
        companyNameInit !=
            InjectionHelper.equityInvestmentController.companyName.value ||
        addressInit !=
            InjectionHelper.equityInvestmentController.address.value ||
        yearOfEstablishmentInit !=
            InjectionHelper
                .equityInvestmentController.yearOfEstablishment.value ||
        typeOfOrganizationInit !=
            InjectionHelper
                .equityInvestmentController.typeOfOrganization.value.display ||
        taxIdentificationInit !=
            InjectionHelper
                .equityInvestmentController.taxIdentificationNumber.value ||
        industryInit !=
            InjectionHelper.equityInvestmentController.industry.value.display ||
        numberOfStaffInit !=
            InjectionHelper.equityInvestmentController.numberOfStaff.value ||
        ownerNameInit !=
            InjectionHelper.equityInvestmentController.ownerName.value ||
        productServiceInit !=
            InjectionHelper.equityInvestmentController.productSevice.value ||
        numberOfShareholdersInit !=
            InjectionHelper.equityInvestmentController.numberOfShareHolders.value
                .toString() ||
        numberOfBoardMemberInit !=
            InjectionHelper
                .equityInvestmentController.numberOfBoardMembers.value
                .toString() ||
        haveTheConsensusInit !=
            InjectionHelper.equityInvestmentController.haveTheConsenus.value
                .toString() ||
        purpostOfFundInit !=
            InjectionHelper.equityInvestmentController.purposeOfFund.value
                .toString() ||
        areYouTheMajorityShareholderInit !=
            InjectionHelper
                .equityInvestmentController.areYouTheMajorityShareholder.value
                .toString() ||
        _businessPlanInit !=
            InjectionHelper.equityInvestmentController.businessPlan
                .toString() ||
        _articleOfIncorporationInit !=
            InjectionHelper.equityInvestmentController.articleOfIncorporation
                .toString() ||
        _incomeStatementInit !=
            InjectionHelper.equityInvestmentController.incomeStatement
                .toString() ||
        _balanceSheetInit !=
            InjectionHelper.equityInvestmentController.balanceSheet
                .toString() ||
        _cashFlowInitInit !=
            InjectionHelper.equityInvestmentController.cashFlowStatement
                .toString() ||
        haveFinancialProjectInit !=
            InjectionHelper.equityInvestmentController.havefinancial.value
                .toString() ||
        _martketStudyInit !=
            InjectionHelper.equityInvestmentController.marketStudy.toString() ||
        _otherDocumentInit !=
            InjectionHelper.equityInvestmentController.otherDocuments
                .toString();
  }

  inistialdata() async {
    await InjectionHelper.equityInvestmentController
        .fetchAppDetails(widget.id!);

    if (InjectionHelper
                .equityInvestmentController.applicationData.value.status ==
            'New' ||
        InjectionHelper
                .equityInvestmentController.applicationData.value.status ==
            'Draft' ||
        InjectionHelper
                .equityInvestmentController.applicationData.value.status ==
            'Rejected' ||
        InjectionHelper
                .equityInvestmentController.applicationData.value.status ==
            'Review' ||
        InjectionHelper
                .equityInvestmentController.applicationData.value.status ==
            'Approved') {
      reason = InjectionHelper
          .equityInvestmentController.applicationData.value.reason;
      InjectionHelper.equityInvestmentController.status.value = InjectionHelper
          .equityInvestmentController.applicationData.value.status!;
      idequity =
          InjectionHelper.equityInvestmentController.applicationData.value.id;
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
      InjectionHelper.equityInvestmentController.numberOfBoardMembers.value =
          InjectionHelper.equityInvestmentController.applicationData.value
              .numberofboardmember!
              .toInt();
      InjectionHelper.equityInvestmentController.useOfFund.value =
          InjectionHelper
              .equityInvestmentController.applicationData.value.useofFund!;

      ///company
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
      InjectionHelper.equityInvestmentController.industry.value =
          InjectionHelper.equityInvestmentController.applicationData.value
                      .company!.industry !=
                  null
              ? InjectionHelper.equityInvestmentController.applicationData.value
                  .company!.industry!
              : Optionmodel(id: 0, display: "");

      InjectionHelper.equityInvestmentController.numberOfStaff.value =
          InjectionHelper.equityInvestmentController.applicationData.value
              .company!.numberOfStaff!
              .toString();
      InjectionHelper.equityInvestmentController.ownerName.value =
          InjectionHelper.equityInvestmentController.applicationData.value
              .company!.ownerName!;
      InjectionHelper.equityInvestmentController.productSevice.value =
          InjectionHelper.equityInvestmentController.applicationData.value
              .company!.companyProductAndService!;

      InjectionHelper.equityInvestmentController.patentDocument.value =
          InjectionHelper.equityInvestmentController.applicationData.value
              .companyPatentDoc!;
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
      InjectionHelper.equityInvestmentController.incomeStatement.value =
          InjectionHelper.equityInvestmentController.applicationData.value
              .incomeStatement!;
      InjectionHelper.equityInvestmentController.businessPlan.value =
          InjectionHelper
              .equityInvestmentController.applicationData.value.businessPlan!;
      InjectionHelper.equityInvestmentController.balanceSheet.value =
          InjectionHelper
              .equityInvestmentController.applicationData.value.balanceSheet!;
      InjectionHelper.equityInvestmentController.articleOfIncorporation.value =
          InjectionHelper.equityInvestmentController.applicationData.value
              .articleOfIncorporation!;
      InjectionHelper.equityInvestmentController.cashFlowStatement.value =
          InjectionHelper.equityInvestmentController.applicationData.value
              .cashFlowStatement!;
      InjectionHelper.equityInvestmentController.marketStudy.value =
          InjectionHelper.equityInvestmentController.applicationData.value
              .marketStudyDocs!;
      InjectionHelper.equityInvestmentController.otherDocuments.value =
          InjectionHelper
              .equityInvestmentController.applicationData.value.otherDocument!;

      debugPrint('heloo2');
    } else {
      isEdit = false;
    }
  }

  ontapFinancing(context) async {
    await onShowCustomCupertinoModalSheet(
        icon: const Icon(Icons.clear),
        isNoIcon: false,
        title: 'Financing Information',
        context: context,
        child: const PopupFinancingEdit());
  }

  ontapCompanyInfo(context) async {
    await onShowCustomCupertinoModalSheet(
      icon: const Icon(Icons.clear),
      isNoIcon: false,
      title: 'Company Information',
      context: context,
      child: PopupCompanyInfo(
        step2Defual: Step2EquityModel(
            companyName:
                InjectionHelper.equityInvestmentController.companyName.value,
            address: InjectionHelper.equityInvestmentController.address.value,
            yearOfEstablishment: InjectionHelper
                .equityInvestmentController.yearOfEstablishment.value,
            typeOfOrganization: InjectionHelper
                .equityInvestmentController.typeOfOrganization.value,
            taxIdentificationNumber: InjectionHelper
                .equityInvestmentController.taxIdentificationNumber.value,
            industry: InjectionHelper.equityInvestmentController.industry.value,
            numberOfStaff:
                InjectionHelper.equityInvestmentController.numberOfStaff.value,
            ownerName:
                InjectionHelper.equityInvestmentController.ownerName.value,
            productSevice:
                InjectionHelper.equityInvestmentController.productSevice.value,
            companyPatentDoc:
                InjectionHelper.equityInvestmentController.patentDocument.value,
            companyMocCertificate: InjectionHelper
                .equityInvestmentController.certificatioDoc.value,
            companyLicence:
                InjectionHelper.equityInvestmentController.licenseDoc.value,
            companyMemorandum:
                InjectionHelper.equityInvestmentController.memorandumDoc.value),
        reuslt: (companyName,
            adress,
            year,
            type,
            industry,
            numberofstaff,
            ownername,
            productandsevice,
            tax,
            pantentDoc,
            mocCertificate,
            licenceDoc,
            memorandumDoc) {
          InjectionHelper.equityInvestmentController.companyName.value =
              companyName;
          InjectionHelper.equityInvestmentController.address.value = adress;
          InjectionHelper.equityInvestmentController.addresscontroller.text =
              adress;
          InjectionHelper.equityInvestmentController.yearOfEstablishment.value =
              year;
          InjectionHelper
              .equityInvestmentController.yearOfestabliscontroller.text = year;
          InjectionHelper.equityInvestmentController.typeOfOrganization.value =
              type;
          InjectionHelper.equityInvestmentController.industry.value = industry;
          InjectionHelper.equityInvestmentController.numberOfStaff.value =
              numberofstaff;
          InjectionHelper.equityInvestmentController.numberofStaffcontroller
              .text = numberofstaff;
          InjectionHelper.equityInvestmentController.ownerName.value =
              ownername;
          InjectionHelper.equityInvestmentController.ownerNamecontroller.text =
              ownername;
          InjectionHelper.equityInvestmentController.productSevice.value =
              productandsevice;
          InjectionHelper.equityInvestmentController.productController.text =
              productandsevice;
          InjectionHelper
              .equityInvestmentController.taxIdentificationNumber.value = tax;
          InjectionHelper.equityInvestmentController.taxcontroller.text = tax;
          InjectionHelper.equityInvestmentController.patentDocument.value =
              pantentDoc;
          InjectionHelper.equityInvestmentController.certificatioDoc.value =
              mocCertificate;
          InjectionHelper.equityInvestmentController.licenseDoc.value =
              licenceDoc;
          InjectionHelper.equityInvestmentController.memorandumDoc.value =
              memorandumDoc;
        },
      ),
    );
    if (InjectionHelper.equityInvestmentController.patentDocument.value == 1) {
      InjectionHelper.equityInvestmentController.isPatentDoc.value = true;
    } else {
      InjectionHelper.equityInvestmentController.isPatentDoc.value = false;
    }
    if (InjectionHelper.equityInvestmentController.certificatioDoc.value == 1) {
      InjectionHelper.equityInvestmentController.isCertificate.value = true;
    } else {
      InjectionHelper.equityInvestmentController.isCertificate.value = false;
    }
    if (InjectionHelper.equityInvestmentController.licenseDoc.value == 1) {
      InjectionHelper.equityInvestmentController.isLicense.value = true;
    } else {
      InjectionHelper.equityInvestmentController.isLicense.value = false;
    }
    if (InjectionHelper.equityInvestmentController.memorandumDoc.value == 1) {
      InjectionHelper.equityInvestmentController.isMemorandum.value = true;
    } else {
      InjectionHelper.equityInvestmentController.isMemorandum.value = false;
    }
    InjectionHelper.memberController.addCompany.value = false;
    InjectionHelper.equityInvestmentController.onResetValidateCompany();
  }

  ontapRequiredDoc(context) async {
    var result = await onShowCustomCupertinoModalSheet(
        icon: const Icon(Icons.clear),
        isNoIcon: false,
        title: 'Required Documents',
        context: context,
        child: const PopupRequiredDoc());
    if (result != null) {}
  }

  ontapFinancialProject(context) async {
    var result = await onShowCustomCupertinoModalSheet(
        icon: const Icon(Icons.clear),
        isNoIcon: false,
        title: 'Financial',
        context: context,
        child: const FinancialProjectEdit());
    if (result != null) {}
  }

  ontapOthersProject(context) async {
    var result = await onShowCustomCupertinoModalSheet(
        icon: const Icon(Icons.clear),
        isNoIcon: false,
        title: 'Other',
        context: context,
        child: const CustomOtherProjectEdited());
    if (result != null) {}
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoScaffold(
      body: Builder(
        builder: (context) => CupertinoPageScaffold(
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
                          children: const [
                            SizedBox(
                              height: 50,
                              width: 50,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                backgroundColor: Colors.white38,
                                strokeWidth: 4,
                              ),
                            ),
                            SizedBox(height: padding),
                            Text(
                              'Submitting...',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : Scaffold(
                    appBar: InjectionHelper.equityInvestmentController
                                .isSubmitLoading.value ==
                            true
                        ? AppBar()
                        : widget.id == null
                            ? CustomAppBarWhiteColor(
                                context: context,
                                title: 'Submitted Application',
                                subtitle: InjectionHelper
                                            .equityInvestmentController
                                            .isLoadingData
                                            .value ==
                                        true
                                    ? ""
                                    : InjectionHelper.equityInvestmentController
                                        .status.value,
                                action: [
                                    const CustomCallCenter(),
                                    const SizedBox(
                                      width: 5,
                                    )
                                  ])
                            : CustomAppBarWhiteColor(
                                context: context,
                                title: 'Preview Form',
                                subtitle: InjectionHelper
                                    .equityInvestmentController.status.value,
                                action: [
                                    const CustomCallCenter(),
                                    const SizedBox(
                                      width: 5,
                                    )
                                  ]),
                    body: InjectionHelper.equityInvestmentController
                                .isLoadingData.value ==
                            true
                        ? const LinearProgressIndicator()
                        : ConnectivityWidgetWrapper(
                            stacked: false,
                            alignment: Alignment.bottomCenter,
                            offlineWidget: Column(
                              children: const [
                                SizedBox(
                                  height: 20,
                                ),
                                Expanded(child: OfflineWidget()),
                              ],
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        if (widget.id != null)
                                          if (InjectionHelper
                                                  .equityInvestmentController
                                                  .applicationData
                                                  .value
                                                  .status ==
                                              'Rejected')
                                            CustomRejectReason(
                                              isReson: true,
                                              onEdit: () {},
                                              title:
                                                  "Rejected Application Reason",
                                              reason: InjectionHelper
                                                  .equityInvestmentController
                                                  .applicationData
                                                  .value
                                                  .reason!,
                                            ),
                                        CustomFinancingInfo(
                                          isEditable: InjectionHelper
                                                          .equityInvestmentController
                                                          .applicationData
                                                          .value
                                                          .status ==
                                                      "Draft" ||
                                                  widget.id == null
                                              ? true
                                              : isEdit,
                                          financingAmount: InjectionHelper
                                              .equityInvestmentController
                                              .financingAmoung
                                              .value
                                              .toString(),
                                          date: InjectionHelper
                                                      .equityInvestmentController
                                                      .whenOnchangeDate
                                                      .value !=
                                                  ""
                                              ? InjectionHelper
                                                  .equityInvestmentController
                                                  .intendedDate
                                                  .value
                                              : InjectionHelper
                                                          .equityInvestmentController
                                                          .intendedDate
                                                          .value ==
                                                      ""
                                                  ? ""
                                                  : FormatDate
                                                      .formatDateTimeGetfunding(
                                                          InjectionHelper
                                                              .equityInvestmentController
                                                              .intendedDate
                                                              .value),
                                          useOfFund: InjectionHelper
                                              .equityInvestmentController
                                              .useOfFund
                                              .value,
                                          onTap: () => ontapFinancing(context),
                                        ),
                                        CustomReviewCompanyInfocard(
                                          isEditable: InjectionHelper
                                                          .equityInvestmentController
                                                          .applicationData
                                                          .value
                                                          .status ==
                                                      "Draft" ||
                                                  widget.id == null
                                              ? true
                                              : isEdit,
                                          onTap: () {
                                            ontapCompanyInfo(context);
                                          },
                                          address: InjectionHelper
                                              .equityInvestmentController
                                              .address
                                              .value,
                                          year: InjectionHelper
                                              .equityInvestmentController
                                              .yearOfEstablishment
                                              .value,
                                          typeofOrganization: InjectionHelper
                                              .equityInvestmentController
                                              .typeOfOrganization
                                              .value
                                              .display,
                                          companyName: InjectionHelper
                                              .equityInvestmentController
                                              .companyName
                                              .value,
                                          taxIdentification: InjectionHelper
                                              .equityInvestmentController
                                              .taxIdentificationNumber
                                              .value,
                                          industry: InjectionHelper
                                              .equityInvestmentController
                                              .industry
                                              .value
                                              .display,
                                          numberofStaff: InjectionHelper
                                                      .equityInvestmentController
                                                      .numberOfStaff
                                                      .value !=
                                                  ''
                                              ? FormatNumber.formatNumberDefualt(
                                                      int.parse(InjectionHelper
                                                          .equityInvestmentController
                                                          .numberOfStaff
                                                          .value))
                                                  .toString()
                                              : '',
                                          ownername: InjectionHelper
                                              .equityInvestmentController
                                              .ownerName
                                              .value,
                                          productSevice: InjectionHelper
                                              .equityInvestmentController
                                              .productSevice
                                              .value,
                                          patentDoc: InjectionHelper
                                              .equityInvestmentController
                                              .patentDocument
                                              .value,
                                          mocCertificate: InjectionHelper
                                              .equityInvestmentController
                                              .certificatioDoc
                                              .value,
                                          licenceDoc: InjectionHelper
                                              .equityInvestmentController
                                              .licenseDoc
                                              .value,
                                          memorandom: InjectionHelper
                                              .equityInvestmentController
                                              .memorandumDoc
                                              .value,
                                        ),
                                        CustomReviewRequiredCard(
                                          isEditable: InjectionHelper
                                                          .equityInvestmentController
                                                          .applicationData
                                                          .value
                                                          .status ==
                                                      "Draft" ||
                                                  widget.id == null
                                              ? true
                                              : isEdit,
                                          //Part 1
                                          numberofshare:
                                              FormatNumber.formatNumberDefualt(
                                                      InjectionHelper
                                                          .equityInvestmentController
                                                          .numberOfShareHolders
                                                          .value)
                                                  .toString(),
                                          numberofboard:
                                              FormatNumber.formatNumberDefualt(
                                                      InjectionHelper
                                                          .equityInvestmentController
                                                          .numberOfBoardMembers
                                                          .value)
                                                  .toString(),

                                          havetheconsensus: InjectionHelper
                                              .equityInvestmentController
                                              .haveTheConsenus
                                              .value,

                                          purposeEquity: InjectionHelper
                                              .equityInvestmentController
                                              .purposeOfFund
                                              .value,

                                          majority: InjectionHelper
                                              .equityInvestmentController
                                              .areYouTheMajorityShareholder
                                              .value,
                                          businessplan: InjectionHelper
                                              .equityInvestmentController
                                              .businessPlan
                                              .value,
                                          article: InjectionHelper
                                              .equityInvestmentController
                                              .articleOfIncorporation
                                              .value,

                                          // Part 2
                                          incomingstatement: InjectionHelper
                                              .equityInvestmentController
                                              .incomeStatement
                                              .value,
                                          balancesheet: InjectionHelper
                                              .equityInvestmentController
                                              .balanceSheet
                                              .value,
                                          cashflow: InjectionHelper
                                              .equityInvestmentController
                                              .cashFlowStatement
                                              .value,

                                          havethefinancail: InjectionHelper
                                              .equityInvestmentController
                                              .havefinancial
                                              .value,
                                          //Part 3
                                          marketstudy: InjectionHelper
                                              .equityInvestmentController
                                              .marketStudy
                                              .value,

                                          otherdoc: InjectionHelper
                                              .equityInvestmentController
                                              .otherDocuments
                                              .value,
                                          onTabFinancialProject: () {
                                            ontapFinancialProject(context);
                                          },

                                          onTabOtherProject: () {
                                            ontapOthersProject(context);
                                          },

                                          onTap: () {
                                            ontapRequiredDoc(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                if (InjectionHelper.equityInvestmentController
                                            .applicationData.value.status ==
                                        "Draft" ||
                                    widget.id == null)
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 0, right: 0, bottom: 10),
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          left: 20, right: 20, top: 10),
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.only(
                                                bottom: 10, top: 10),
                                            child: CustomSelect2GetFunding(
                                              isFromCreateOrUpdated:
                                                  checkEqual(),
                                              islongLabel: true,
                                              title:
                                                  'I hereby declare that the informations provided above are correct and true.',
                                              isSelect: !checkEqual()
                                                  ? false
                                                  : InjectionHelper
                                                      .equityInvestmentController
                                                      .isAgree
                                                      .value,
                                              ontap: () {
                                                if (checkEqual()) {
                                                  if (InjectionHelper
                                                      .equityInvestmentController
                                                      .isAgree
                                                      .value) {
                                                    InjectionHelper
                                                        .equityInvestmentController
                                                        .isAgree
                                                        .value = false;
                                                  } else {
                                                    setState(() {
                                                      InjectionHelper
                                                          .equityInvestmentController
                                                          .isAgree
                                                          .value = true;
                                                    });
                                                  }
                                                } else {
                                                  InjectionHelper
                                                      .equityInvestmentController
                                                      .isAgree
                                                      .value = false;
                                                }
                                              },
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: CustomButton(
                                                    isDisable: false,
                                                    isOutline: true,
                                                    onPressed: widget.id !=
                                                                null &&
                                                            InjectionHelper
                                                                    .equityInvestmentController
                                                                    .applicationData
                                                                    .value
                                                                    .step ==
                                                                3
                                                        ? () {
                                                            Navigator.pop(
                                                                context);
                                                            Navigator.pop(
                                                                context);
                                                          }
                                                        : () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                    title: "Close"),
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Expanded(
                                                child: CustomButton(
                                                  isDisable: InjectionHelper
                                                          .equityInvestmentController
                                                          .isAgree
                                                          .value
                                                      ? false
                                                      : true,
                                                  isOutline: false,
                                                  onPressed: InjectionHelper
                                                          .equityInvestmentController
                                                          .isAgree
                                                          .value
                                                      ? widget.id != null &&
                                                              InjectionHelper
                                                                      .equityInvestmentController
                                                                      .applicationData
                                                                      .value
                                                                      .status ==
                                                                  "Draft"
                                                          ? () async {
                                                              FirebaseAnalyticsHelper
                                                                  .sendAnalyticsEvent(
                                                                      "Equity Update Draft to Submit");

                                                              await InjectionHelper.equityInvestmentController.onEditEquityInvestment(
                                                                  context:
                                                                      context,
                                                                  submitRequest:
                                                                      "submitted",
                                                                  pagenumber:
                                                                      "update draft",
                                                                  frompage: InjectionHelper
                                                                      .equityInvestmentController
                                                                      .applicationData
                                                                      .value
                                                                      .step!
                                                                      .toInt(),
                                                                  id: widget
                                                                      .id!);
                                                            }
                                                          : () async {
                                                              FirebaseAnalyticsHelper
                                                                  .sendAnalyticsEvent(
                                                                      "Submit Equity Investment");
                                                              await InjectionHelper.equityInvestmentController.onSubmitEquityInvestment(
                                                                  frompage: InjectionHelper
                                                                              .equityInvestmentController
                                                                              .applicationData
                                                                              .value
                                                                              .step !=
                                                                          null
                                                                      ? InjectionHelper
                                                                          .equityInvestmentController
                                                                          .applicationData
                                                                          .value
                                                                          .step!
                                                                          .toInt()
                                                                      : 0,
                                                                  context:
                                                                      context);
                                                            }
                                                      : null,
                                                  title: InjectionHelper
                                                              .equityInvestmentController
                                                              .applicationData
                                                              .value
                                                              .status ==
                                                          "Rejected"
                                                      ? 'Re-Submit'
                                                      : widget.id != null &&
                                                              InjectionHelper
                                                                      .equityInvestmentController
                                                                      .applicationData
                                                                      .value
                                                                      .status!
                                                                      .toLowerCase() ==
                                                                  'new'
                                                          ? 'Update'
                                                          : 'Submit',
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
        ),
      ),
    );
  }
}
