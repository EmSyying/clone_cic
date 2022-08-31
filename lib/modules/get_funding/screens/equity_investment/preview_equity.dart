import 'package:cicgreenloan/Utils/helper/format_number.dart';
import 'package:cicgreenloan/Utils/option_controller/option_controller.dart';
import 'package:cicgreenloan/modules/get_funding/models/equat_equity_model.dart';
import 'package:cicgreenloan/Utils/helper/option_model/option_model.dart';
import 'package:cicgreenloan/modules/get_funding/controller/equity_investment_controller.dart';
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
import '../../../../utils/function/format_date_time.dart';
import '../../../../widgets/get_funding/custom_call_center.dart';
import '../../../../widgets/get_funding/custom_rejected_reason.dart';
import '../../../member_directory/controllers/member_controller.dart';

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
  final equityController = Get.put(EquityInvestmentController());
  final memberController = Get.put(MemberController());
  final optionController = Get.put(DocumentCategory());
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
    await equityController.fetchAppDetails(widget.id!);
    //Financing Infomation

    financingAccountInit =
        equityController.applicationData.value.financialAmount.toString();
    intededDateInit =
        equityController.applicationData.value.intendedDateDisbursement!;
    useOfFundInit = equityController.applicationData.value.useofFund!;

    // Company Information
    companyNameInit =
        equityController.applicationData.value.company!.companyName!;
    addressInit = equityController.applicationData.value.company!.address!;
    yearOfEstablishmentInit =
        equityController.applicationData.value.company!.yearFounded!.toString();

    typeOfOrganizationInit =
        equityController.applicationData.value.company!.typeOfOrganization !=
                null
            ? equityController
                .applicationData.value.company!.typeOfOrganization!.display
                .toString()
            : Optionmodel(id: 0, display: "").display.toString();
    taxIdentificationInit =
        equityController.applicationData.value.company!.taxIdentificationNumber;
    industryInit =
        equityController.applicationData.value.company!.industry != null
            ? equityController.applicationData.value.company!.industry!.display
            : Optionmodel(id: 0, display: "").toString();
    numberOfStaffInit = equityController
        .applicationData.value.company!.numberOfStaff!
        .toString();
    ownerNameInit = equityController.applicationData.value.company!.ownerName!;
    productServiceInit = equityController
        .applicationData.value.company!.companyProductAndService!;

    numberOfShareholdersInit =
        equityController.applicationData.value.numberofshareholder!.toString();
    numberOfBoardMemberInit =
        equityController.applicationData.value.numberofboardmember!.toString();
    haveTheConsensusInit =
        equityController.applicationData.value.iscompanyraisefund!.toString();
    purpostOfFundInit =
        equityController.applicationData.value.raisefundusefor!.toString();
    areYouTheMajorityShareholderInit = equityController
        .applicationData.value.ismajorityshareholder!
        .toString();
  }

  bool checkEqual() {
    return financingAccountInit !=
            equityController.financingAmoung.value.toString() ||
        intededDateInit != equityController.intendedDate.value.toString() ||
        useOfFundInit != equityController.useOfFund.value.toString() ||
        companyNameInit != equityController.companyName.value ||
        addressInit != equityController.address.value ||
        yearOfEstablishmentInit != equityController.yearOfEstablishment.value ||
        typeOfOrganizationInit !=
            equityController.typeOfOrganization.value.display ||
        taxIdentificationInit !=
            equityController.taxIdentificationNumber.value ||
        industryInit != equityController.industry.value.display ||
        numberOfStaffInit != equityController.numberOfStaff.value ||
        ownerNameInit != equityController.ownerName.value ||
        productServiceInit != equityController.productSevice.value ||
        numberOfShareholdersInit !=
            equityController.numberOfShareHolders.value.toString() ||
        numberOfBoardMemberInit !=
            equityController.numberOfBoardMembers.value.toString() ||
        haveTheConsensusInit !=
            equityController.haveTheConsenus.value.toString() ||
        purpostOfFundInit != equityController.purposeOfFund.value.toString() ||
        areYouTheMajorityShareholderInit !=
            equityController.areYouTheMajorityShareholder.value.toString() ||
        _businessPlanInit != equityController.businessPlan.toString() ||
        _articleOfIncorporationInit !=
            equityController.articleOfIncorporation.toString() ||
        _incomeStatementInit != equityController.incomeStatement.toString() ||
        _balanceSheetInit != equityController.balanceSheet.toString() ||
        _cashFlowInitInit != equityController.cashFlowStatement.toString() ||
        haveFinancialProjectInit !=
            equityController.havefinancial.value.toString() ||
        _martketStudyInit != equityController.marketStudy.toString() ||
        _otherDocumentInit != equityController.otherDocuments.toString();
  }

  inistialdata() async {
    await equityController.fetchAppDetails(widget.id!);

    if (equityController.applicationData.value.status == 'New' ||
        equityController.applicationData.value.status == 'Draft' ||
        equityController.applicationData.value.status == 'Rejected' ||
        equityController.applicationData.value.status == 'Review' ||
        equityController.applicationData.value.status == 'Approved') {
      reason = equityController.applicationData.value.reason;
      equityController.status.value =
          equityController.applicationData.value.status!;
      idequity = equityController.applicationData.value.id;
      equityController.financingAmoung.value =
          equityController.applicationData.value.financialAmount != null
              ? equityController.applicationData.value.financialAmount!.toInt()
              : 0;

      equityController.intendedDate.value =
          equityController.applicationData.value.intendedDateDisbursement!;
      equityController.numberOfShareHolders.value =
          equityController.applicationData.value.numberofshareholder!.toInt();
      equityController.numberOfBoardMembers.value =
          equityController.applicationData.value.numberofboardmember!.toInt();
      equityController.useOfFund.value =
          equityController.applicationData.value.useofFund!;

      ///company
      equityController.companyName.value =
          equityController.applicationData.value.company!.companyName!;
      equityController.address.value =
          equityController.applicationData.value.company!.address!;
      equityController.yearOfEstablishment.value = equityController
          .applicationData.value.company!.yearFounded!
          .toString();

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
      equityController.incomeStatement.value =
          equityController.applicationData.value.incomeStatement!;
      equityController.businessPlan.value =
          equityController.applicationData.value.businessPlan!;
      equityController.balanceSheet.value =
          equityController.applicationData.value.balanceSheet!;
      equityController.articleOfIncorporation.value =
          equityController.applicationData.value.articleOfIncorporation!;
      equityController.cashFlowStatement.value =
          equityController.applicationData.value.cashFlowStatement!;
      equityController.marketStudy.value =
          equityController.applicationData.value.marketStudyDocs!;
      equityController.otherDocuments.value =
          equityController.applicationData.value.otherDocument!;

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
            companyName: equityController.companyName.value,
            address: equityController.address.value,
            yearOfEstablishment: equityController.yearOfEstablishment.value,
            typeOfOrganization: equityController.typeOfOrganization.value,
            taxIdentificationNumber:
                equityController.taxIdentificationNumber.value,
            industry: equityController.industry.value,
            numberOfStaff: equityController.numberOfStaff.value,
            ownerName: equityController.ownerName.value,
            productSevice: equityController.productSevice.value,
            companyPatentDoc: equityController.patentDocument.value,
            companyMocCertificate: equityController.certificatioDoc.value,
            companyLicence: equityController.licenseDoc.value,
            companyMemorandum: equityController.memorandumDoc.value),
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
          equityController.companyName.value = companyName;
          equityController.address.value = adress;
          equityController.addresscontroller.text = adress;
          equityController.yearOfEstablishment.value = year;
          equityController.yearOfestabliscontroller.text = year;
          equityController.typeOfOrganization.value = type;
          equityController.industry.value = industry;
          equityController.numberOfStaff.value = numberofstaff;
          equityController.numberofStaffcontroller.text = numberofstaff;
          equityController.ownerName.value = ownername;
          equityController.ownerNamecontroller.text = ownername;
          equityController.productSevice.value = productandsevice;
          equityController.productController.text = productandsevice;
          equityController.taxIdentificationNumber.value = tax;
          equityController.taxcontroller.text = tax;
          equityController.patentDocument.value = pantentDoc;
          equityController.certificatioDoc.value = mocCertificate;
          equityController.licenseDoc.value = licenceDoc;
          equityController.memorandumDoc.value = memorandumDoc;
        },
      ),
    );
    if (equityController.patentDocument.value == 1) {
      equityController.isPatentDoc.value = true;
    } else {
      equityController.isPatentDoc.value = false;
    }
    if (equityController.certificatioDoc.value == 1) {
      equityController.isCertificate.value = true;
    } else {
      equityController.isCertificate.value = false;
    }
    if (equityController.licenseDoc.value == 1) {
      equityController.isLicense.value = true;
    } else {
      equityController.isLicense.value = false;
    }
    if (equityController.memorandumDoc.value == 1) {
      equityController.isMemorandum.value = true;
    } else {
      equityController.isMemorandum.value = false;
    }
    memberController.addCompany.value = false;
    equityController.onResetValidateCompany();
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
                    appBar: equityController.isSubmitLoading.value == true
                        ? AppBar()
                        : widget.id == null
                            ? CustomAppBarWhiteColor(
                                context: context,
                                title: 'Submitted Application',
                                subtitle:
                                    equityController.isLoadingData.value == true
                                        ? ""
                                        : equityController.status.value,
                                action: [
                                    const CustomCallCenter(),
                                    const SizedBox(
                                      width: 5,
                                    )
                                  ])
                            : CustomAppBarWhiteColor(
                                context: context,
                                title: 'Preview Form',
                                subtitle: equityController.status.value,
                                action: [
                                    const CustomCallCenter(),
                                    const SizedBox(
                                      width: 5,
                                    )
                                  ]),
                    body: equityController.isLoadingData.value == true
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
                                          if (equityController.applicationData
                                                  .value.status ==
                                              'Rejected')
                                            CustomRejectReason(
                                              isReson: true,
                                              onEdit: () {},
                                              title:
                                                  "Rejected Application Reason",
                                              reason: equityController
                                                  .applicationData
                                                  .value
                                                  .reason!,
                                            ),
                                        CustomFinancingInfo(
                                          isEditable: equityController
                                                          .applicationData
                                                          .value
                                                          .status ==
                                                      "Draft" ||
                                                  widget.id == null
                                              ? true
                                              : isEdit,
                                          financingAmount: equityController
                                              .financingAmoung.value
                                              .toString(),
                                          date: equityController
                                                      .whenOnchangeDate.value !=
                                                  ""
                                              ? equityController
                                                  .intendedDate.value
                                              : equityController
                                                          .intendedDate.value ==
                                                      ""
                                                  ? ""
                                                  : FormatDate
                                                      .formatDateTimeGetfunding(
                                                          equityController
                                                              .intendedDate
                                                              .value),
                                          useOfFund:
                                              equityController.useOfFund.value,
                                          onTap: () => ontapFinancing(context),
                                        ),
                                        CustomReviewCompanyInfocard(
                                          isEditable: equityController
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
                                          address:
                                              equityController.address.value,
                                          year: equityController
                                              .yearOfEstablishment.value,
                                          typeofOrganization: equityController
                                              .typeOfOrganization.value.display,
                                          companyName: equityController
                                              .companyName.value,
                                          taxIdentification: equityController
                                              .taxIdentificationNumber.value,
                                          industry: equityController
                                              .industry.value.display,
                                          numberofStaff: equityController
                                                      .numberOfStaff.value !=
                                                  ''
                                              ? FormatNumber
                                                      .formatNumberDefualt(
                                                          int.parse(
                                                              equityController
                                                                  .numberOfStaff
                                                                  .value))
                                                  .toString()
                                              : '',
                                          ownername:
                                              equityController.ownerName.value,
                                          productSevice: equityController
                                              .productSevice.value,
                                          patentDoc: equityController
                                              .patentDocument.value,
                                          mocCertificate: equityController
                                              .certificatioDoc.value,
                                          licenceDoc:
                                              equityController.licenseDoc.value,
                                          memorandom: equityController
                                              .memorandumDoc.value,
                                        ),
                                        CustomReviewRequiredCard(
                                          isEditable: equityController
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
                                                      equityController
                                                          .numberOfShareHolders
                                                          .value)
                                                  .toString(),
                                          numberofboard:
                                              FormatNumber.formatNumberDefualt(
                                                      equityController
                                                          .numberOfBoardMembers
                                                          .value)
                                                  .toString(),

                                          havetheconsensus: equityController
                                              .haveTheConsenus.value,

                                          purposeEquity: equityController
                                              .purposeOfFund.value,

                                          majority: equityController
                                              .areYouTheMajorityShareholder
                                              .value,
                                          businessplan: equityController
                                              .businessPlan.value,
                                          article: equityController
                                              .articleOfIncorporation.value,

                                          // Part 2
                                          incomingstatement: equityController
                                              .incomeStatement.value,
                                          balancesheet: equityController
                                              .balanceSheet.value,
                                          cashflow: equityController
                                              .cashFlowStatement.value,

                                          havethefinancail: equityController
                                              .havefinancial.value,
                                          //Part 3
                                          marketstudy: equityController
                                              .marketStudy.value,

                                          otherdoc: equityController
                                              .otherDocuments.value,
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
                                if (equityController
                                            .applicationData.value.status ==
                                        "Draft" ||
                                    widget.id == null)
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 0, right: 0, bottom: 30),
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
                                                  : equityController
                                                      .isAgree.value,
                                              ontap: () {
                                                if (checkEqual()) {
                                                  if (equityController
                                                      .isAgree.value) {
                                                    equityController
                                                        .isAgree.value = false;
                                                  } else {
                                                    setState(() {
                                                      equityController
                                                          .isAgree.value = true;
                                                    });
                                                  }
                                                } else {
                                                  equityController
                                                      .isAgree.value = false;
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
                                                            equityController
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
                                                  isDisable: !checkEqual()
                                                      ? true
                                                      : false,
                                                  isOutline: false,
                                                  onPressed: equityController
                                                          .isAgree.value
                                                      ? widget.id != null &&
                                                              equityController
                                                                      .applicationData
                                                                      .value
                                                                      .status ==
                                                                  "Draft"
                                                          ? () async {
                                                              FirebaseAnalyticsHelper
                                                                  .sendAnalyticsEvent(
                                                                      "Equity Update Draft to Submit");

                                                              await equityController.onEditEquityInvestment(
                                                                  context:
                                                                      context,
                                                                  submitRequest:
                                                                      "submitted",
                                                                  pagenumber:
                                                                      "update draft",
                                                                  frompage: equityController
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
                                                              await equityController.onSubmitEquityInvestment(
                                                                  frompage: equityController
                                                                              .applicationData
                                                                              .value
                                                                              .step !=
                                                                          null
                                                                      ? equityController
                                                                          .applicationData
                                                                          .value
                                                                          .step!
                                                                          .toInt()
                                                                      : 0,
                                                                  context:
                                                                      context);
                                                            }
                                                      : null,
                                                  title: equityController
                                                              .applicationData
                                                              .value
                                                              .status ==
                                                          "Rejected"
                                                      ? 'Re-Submit'
                                                      : widget.id != null &&
                                                              equityController
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
