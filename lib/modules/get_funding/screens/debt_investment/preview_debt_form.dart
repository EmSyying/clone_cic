import 'package:cicgreenloan/modules/get_funding/screens/debt_investment/pop_up_edit/required_doc.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/member_controller.dart';
import 'package:cicgreenloan/modules/get_funding/controller/debt_investment_controller.dart';
import 'package:cicgreenloan/modules/get_funding/models/appliication_card_model.dart';
import 'package:cicgreenloan/modules/get_funding/screens/debt_investment/pop_up_edit/company_info.dart';
import 'package:cicgreenloan/modules/get_funding/screens/debt_investment/pop_up_edit/financing_info.dart';
import 'package:cicgreenloan/modules/get_funding/screens/debt_investment/pop_up_edit/personal_info.dart';
import 'package:cicgreenloan/utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/utils/form_builder/custom_material_modal_sheet.dart';
import 'package:cicgreenloan/utils/offline_widget.dart';
import 'package:cicgreenloan/widgets/get_funding/custmer_view_personal_info.dart';
import 'package:cicgreenloan/widgets/get_funding/custom_rejected_reason.dart';
import 'package:cicgreenloan/widgets/get_funding/custom_review_address.dart';
import 'package:cicgreenloan/widgets/get_funding/custom_review_company_info_card.dart';
import 'package:cicgreenloan/widgets/get_funding/custom_review_financing_info.dart';
import 'package:cicgreenloan/widgets/get_funding/custom_select_2_getfunding.dart';
import 'package:cicgreenloan/widgets/get_funding/edit_address.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:cicgreenloan/utils/select_address/address_model/address.dart';
import 'package:cicgreenloan/utils/select_address/address_model/full_address_model.dart';

import '../../../../Utils/helper/container_partern.dart';
import '../../../../Utils/helper/custom_appbar_colorswhite.dart';
import '../../../../Utils/helper/firebase_analytics.dart';
import '../../../../Utils/helper/format_number.dart';
import '../../../../utils/function/format_date_time.dart';
import '../../../../utils/select_address/select_address_controller.dart';
import '../../../../widgets/get_funding/custom_call_center.dart';
import '../../../../widgets/get_funding/custom_review_required_doc_debt.dart';

//===
class PreviewDebtForm extends StatefulWidget {
  final ApplicationData? applicationDetail;
  final String? fromPage;
  final String? isDraft;
  const PreviewDebtForm(
      {this.applicationDetail, this.fromPage, this.isDraft, Key? key})
      : super(key: key);

  @override
  State<PreviewDebtForm> createState() => _PreviewDebtFormState();
}

class _PreviewDebtFormState extends State<PreviewDebtForm> {
  final DebtInvestmentController debtCon = Get.put(DebtInvestmentController());
  final MemberController memCon = Get.put(MemberController());
  final reqCon = Get.put(RequestLoanController());

  @override
  void initState() {
    debugPrint("presed:${widget.isDraft} from Page:${widget.fromPage}");
    if (widget.applicationDetail != null) {
      onGetData();
      debugPrint(
          "====pressed from notification===:${widget.applicationDetail!.id}");
      // checkNotEqual();
    } else {
      debtCon.isAgree.value = false;
    }
    super.initState();
  }

  List addressOption = ['Yes', 'No'];
  _onShowEditPersonalInfo(BuildContext context) {
    onShowCustomCupertinoModalSheet(
      icon: const Icon(Icons.clear),
      isNoIcon: false,
      title: 'Personal Information',
      context: context,
      child: const EditPersonalInfo(),
    );
  }

  onEditAddress(BuildContext context) {
    onShowCustomCupertinoModalSheet(
      icon: const Icon(Icons.clear),
      isNoIcon: false,
      title: 'Address',
      context: context,
      child: OnEditAddress(
        fullAddress: FullAddress(
          addressList: [
            Address(
              name: debtCon.fullCurrentAddress.value.addressList![0].name,
              code: debtCon.fullCurrentAddress.value.addressList![0].code,
            ),
            Address(
              name: debtCon.fullCurrentAddress.value.addressList![1].name,
              code: debtCon.fullCurrentAddress.value.addressList![1].code,
            ),
            Address(
              name: debtCon.fullCurrentAddress.value.addressList![2].name,
              code: debtCon.fullCurrentAddress.value.addressList![2].code,
            ),
            debtCon.fullCurrentAddress.value.addressList!.length != 3
                ? Address(
                    name: debtCon.fullCurrentAddress.value.addressList![3].name,
                    code: debtCon.fullCurrentAddress.value.addressList![3].code,
                  )
                : Address(),
          ],
          houseNo: debtCon.fullCurrentAddress.value.houseNo ?? "",
          streetNo: debtCon.fullCurrentAddress.value.streetNo ?? "",
        ),
        permanetAddress: FullAddress(
          addressList: [
            Address(
              name: debtCon.fullResidentAddress.value.addressList![0].name,
              code: debtCon.fullResidentAddress.value.addressList![0].code,
            ),
            Address(
              name: debtCon.fullResidentAddress.value.addressList![1].name,
              code: debtCon.fullResidentAddress.value.addressList![1].code,
            ),
            Address(
              name: debtCon.fullResidentAddress.value.addressList![2].name,
              code: debtCon.fullResidentAddress.value.addressList![2].code,
            ),
            debtCon.fullResidentAddress.value.addressList!.length != 3
                ? Address(
                    name:
                        debtCon.fullResidentAddress.value.addressList![3].name,
                    code:
                        debtCon.fullResidentAddress.value.addressList![3].code,
                  )
                : Address(),
          ],
          houseNo: debtCon.fullResidentAddress.value.houseNo ?? "",
          streetNo: debtCon.fullResidentAddress.value.streetNo ?? "",
        ),
      ),
    );
  }

  _onShowEditFinancingInfo(BuildContext context, int? productTypeId) {
    onShowCustomCupertinoModalSheet(
      title: 'Financing Information',
      icon: const Icon(Icons.clear),
      isNoIcon: false,
      context: context,
      child: EditFinancingInfo(
        productTypeId: productTypeId,
      ),
    );
  }

  onEditRequiredDoc(BuildContext context) {
    onShowCustomCupertinoModalSheet(
      title: 'Required Documents',
      icon: const Icon(Icons.clear),
      isNoIcon: false,
      context: context,
      child: const RequiredDoc(),
    );
  }

  ontapCompanyInfo(context) async {
    await onShowCustomCupertinoModalSheet(
        icon: const Icon(Icons.clear),
        isNoIcon: false,
        title: 'Company Information',
        context: context,
        child: const EditCompanyInfo());
    if (debtCon.patentDocument.value == 1) {
      debtCon.isPatentDoc.value = true;
    } else {
      debtCon.isPatentDoc.value = false;
    }
    if (debtCon.certificatioDoc.value == 1) {
      debtCon.isCertificate.value = true;
    } else {
      debtCon.isCertificate.value = false;
    }
    if (debtCon.licenseDoc.value == 1) {
      debtCon.isLicense.value = true;
    } else {
      debtCon.isLicense.value = false;
    }
    if (debtCon.memorandumDoc.value == 1) {
      debtCon.isMemorandum.value = true;
    } else {
      debtCon.isMemorandum.value = false;
    }
    memCon.addCompany.value = false;
    debtCon.onResetValidateCompany();
  }

  int? incomeStatement;
  int? balanceSheet;
  int? cashFlow;
  int? businessPlan;
  int? otherDocument;

  bool checkNotEqual() {
    return
        //personal info
        debtCon.fullName.value !=
                debtCon.applicationDetail.value.customerInfo!.customerName ||
            debtCon.dateOfBirth.value !=
                debtCon.applicationDetail.value.customerInfo!
                    .customerDateOfBirth! ||
            debtCon.email.value !=
                debtCon.applicationDetail.value.customerInfo!.customerEmail! ||
            debtCon.gender.value.display !=
                debtCon.applicationDetail.value.customerInfo!.customerGender!
                    .display ||

            // address
            //current
            debtCon.fullCurrentAddress.value.houseNo !=
                debtCon.applicationDetail.value.customerInfo!.currentHouseNo ||
            debtCon.fullCurrentAddress.value.streetNo !=
                debtCon.applicationDetail.value.customerInfo!.currentStreetNo ||
            debtCon.fullCurrentAddress.value.addressList![0].name.toString() !=
                debtCon.applicationDetail.value.customerInfo!.currentAddress!
                    .city!.name
                    .toString() ||
            debtCon.fullCurrentAddress.value.addressList![1].name !=
                debtCon.applicationDetail.value.customerInfo!.currentAddress!
                    .district!.name ||
            debtCon.fullCurrentAddress.value.addressList![2].name !=
                debtCon.applicationDetail.value.customerInfo!.currentAddress!
                    .commune!.name ||
            debtCon.fullCurrentAddress.value.addressList![3].name !=
                debtCon.applicationDetail.value.customerInfo!.currentAddress!
                    .village!.name ||
            //permanent
            debtCon.fullResidentAddress.value.houseNo !=
                debtCon
                    .applicationDetail.value.customerInfo!.residenceHouseNo ||
            debtCon.fullResidentAddress.value.streetNo !=
                debtCon.applicationDetail.value.customerInfo!.residenceStreetNo ||
            debtCon.fullResidentAddress.value.addressList![0].name != debtCon.applicationDetail.value.customerInfo!.residenceAddress!.city!.name ||
            debtCon.fullResidentAddress.value.addressList![1].name != debtCon.applicationDetail.value.customerInfo!.residenceAddress!.district!.name ||
            debtCon.fullResidentAddress.value.addressList![2].name != debtCon.applicationDetail.value.customerInfo!.residenceAddress!.commune!.name ||
            debtCon.fullResidentAddress.value.addressList![3].name != debtCon.applicationDetail.value.customerInfo!.residenceAddress!.village!.name ||
            //financing information
            debtCon.financingPurpose.value.display != debtCon.applicationDetail.value.financialPurpose!.display ||
            debtCon.financingAmount.value != debtCon.applicationDetail.value.financialAmount!.toDouble() ||
            debtCon.term.value.toString() != debtCon.applicationDetail.value.duration!.toString() ||
            debtCon.intendedDate.value != debtCon.applicationDetail.value.intendedDateDisbursement! ||
            //company information
            debtCon.companyName.value != debtCon.applicationDetail.value.company!.companyName ||
            debtCon.address.value != debtCon.applicationDetail.value.company!.address ||
            debtCon.yearOfEstablishment.value != debtCon.applicationDetail.value.company!.yearFounded ||
            debtCon.typeOfOrganization.value.display != debtCon.applicationDetail.value.company!.typeOfOrganization!.display ||
            debtCon.taxIdentificationNumber.value != debtCon.applicationDetail.value.company!.taxIdentificationNumber ||
            debtCon.industry.value.display != debtCon.applicationDetail.value.company!.industry!.display ||
            debtCon.numberOfStaff.value != debtCon.applicationDetail.value.company!.numberOfStaff.toString() ||
            debtCon.ownerName.value != debtCon.applicationDetail.value.company!.ownerName ||
            debtCon.productSevice.value != debtCon.applicationDetail.value.company!.companyProductAndService ||

            //other doc
            debtCon.incomeStatement.value != incomeStatement ||
            debtCon.balanceSheet.value != balanceSheet ||
            debtCon.cashFlowStatement.value != cashFlow ||
            debtCon.businessPlan.value != businessPlan ||
            debtCon.otherDocuments.value != otherDocument!;
  }

  void onGetData() async {
    if (widget.isDraft == "true" || widget.fromPage == "submitted") {
      await debtCon.fetchAppDetails(widget.applicationDetail!.id!);

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
        debtCon.dateOfBirth.value =
            debtCon.applicationDetail.value.customerInfo!.customerDateOfBirth!;
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
          houseNo:
              debtCon.applicationDetail.value.customerInfo!.residenceHouseNo ??
                  "",
          streetNo:
              debtCon.applicationDetail.value.customerInfo!.residenceStreetNo ??
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
      // Financing info
      if (debtCon.applicationDetail.value.productType != null) {
        debtCon.productType.value.productName =
            debtCon.applicationDetail.value.productType!.name;
        debtCon.productType.value.id =
            debtCon.applicationDetail.value.productType!.id!.toInt();
      }
      if (debtCon.applicationDetail.value.financialPurpose != null) {
        debtCon.financingPurpose.value.display =
            debtCon.applicationDetail.value.financialPurpose!.display;
        debtCon.financingPurpose.value.id =
            debtCon.applicationDetail.value.financialPurpose!.id;
      }
      if (debtCon.applicationDetail.value.financialAmount!.toDouble() != 0.0) {
        debtCon.financingAmount.value =
            debtCon.applicationDetail.value.financialAmount!.toDouble();
      }
      if (debtCon.applicationDetail.value.intendedDateDisbursement != null) {
        debtCon.intendedDate.value =
            debtCon.applicationDetail.value.intendedDateDisbursement!;
      }
      if (debtCon.applicationDetail.value.duration != 0) {
        debtCon.term.value = debtCon.applicationDetail.value.duration!.toInt();
      }
      debugPrint("Function assign value is work22222");
      //company info
      if (debtCon.applicationDetail.value.company!.companyName != "") {
        debtCon.companyName.value =
            debtCon.applicationDetail.value.company!.companyName!;
      }

      if (debtCon.applicationDetail.value.company!.address != "") {
        debtCon.address.value =
            debtCon.applicationDetail.value.company!.address!;
      }
      if (debtCon.applicationDetail.value.company!.yearFounded != "") {
        debtCon.yearOfEstablishment.value =
            debtCon.applicationDetail.value.company!.yearFounded!;
      }
      if (debtCon
              .applicationDetail.value.company!.typeOfOrganization!.display !=
          '') {
        debtCon.typeOfOrganization.value.display = debtCon
            .applicationDetail.value.company!.typeOfOrganization!.display!;
        if (debtCon.applicationDetail.value.company!.typeOfOrganization!.id !=
            null) {
          debtCon.typeOfOrganization.value.id =
              debtCon.applicationDetail.value.company!.typeOfOrganization!.id!;
        }
      }
      if (debtCon.applicationDetail.value.company!.taxIdentificationNumber !=
          '') {
        debtCon.taxIdentificationNumber.value =
            debtCon.applicationDetail.value.company!.taxIdentificationNumber!;
      }
      if (debtCon.applicationDetail.value.company!.industry!.display != "") {
        debtCon.industry.value.display =
            debtCon.applicationDetail.value.company!.industry!.display!;
        if (debtCon.applicationDetail.value.company!.industry!.id != null) {
          debtCon.industry.value.id =
              debtCon.applicationDetail.value.company!.industry!.id!;
        }
      }
      if (debtCon.applicationDetail.value.company!.numberOfStaff != 0) {
        debtCon.numberOfStaff.value =
            debtCon.applicationDetail.value.company!.numberOfStaff.toString();
      }
      if (debtCon.applicationDetail.value.company!.ownerName != "") {
        debtCon.ownerName.value =
            debtCon.applicationDetail.value.company!.ownerName!;
      }
      if (debtCon.applicationDetail.value.company!.companyProductAndService !=
          "") {
        debtCon.productSevice.value =
            debtCon.applicationDetail.value.company!.companyProductAndService!;
      }
      debtCon.patentDocument.value =
          debtCon.applicationDetail.value.companyPatentDoc!;
      debtCon.certificatioDoc.value =
          debtCon.applicationDetail.value.companyMoCCertificate!;
      debtCon.licenseDoc.value =
          debtCon.applicationDetail.value.companyLicenceDoc!;
      debtCon.memorandumDoc.value = debtCon.applicationDetail.value.companyMAA!;

      debtCon.incomeStatement.value =
          debtCon.applicationDetail.value.incomeStatement!;
      debtCon.balanceSheet.value =
          debtCon.applicationDetail.value.balanceSheet!;

      debtCon.cashFlowStatement.value =
          debtCon.applicationDetail.value.cashFlowStatement!;

      debtCon.otherDocuments.value =
          debtCon.applicationDetail.value.otherDocument!;
      debtCon.businessPlan.value =
          debtCon.applicationDetail.value.businessPlan!;
    }
  }

  bool isEditRejected = false;
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
                    appBar: debtCon.isLoadingSubmit.value == true
                        ? AppBar()
                        : widget.fromPage == "submitted"
                            ? CustomAppBarWhiteColor(
                                context: context,
                                title: 'Submitted Application',
                                subtitle: debtCon.isLoadingData.value == true
                                    ? ""
                                    : debtCon.applicationDetail.value.status,
                                // '${debtCon.applicationDetail.value.status}',
                                action: [
                                    const CustomCallCenter(),
                                    const SizedBox(
                                      width: 5,
                                    )
                                  ])
                            : CustomAppBarWhiteColor(
                                context: context,
                                title: 'Preview Form',
                                subtitle: '',
                                action: [
                                    const CustomCallCenter(),
                                    const SizedBox(
                                      width: 5,
                                    )
                                  ]),
                    body: debtCon.isLoadingData.value
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
                                        if (widget.applicationDetail != null)
                                          if (debtCon.applicationDetail.value
                                                  .reason !=
                                              null)
                                            if (debtCon.applicationDetail.value
                                                    .status ==
                                                'Rejected')
                                              CustomRejectReason(
                                                isReson: true,
                                                onEdit: () {},
                                                title:
                                                    "Rejected Application Reason",
                                                reason: debtCon
                                                    .applicationDetail
                                                    .value
                                                    .reason,
                                              ),
                                        CustomReviewProfileCard(
                                          onTap: () {
                                           
                                            _onShowEditPersonalInfo(context);
                                          },
                                          isEdit: widget.applicationDetail ==
                                                      null ||
                                                  widget.applicationDetail!
                                                          .status ==
                                                      "Draft"
                                              ? true
                                              : false,
                                          dob: debtCon.dateOfBirth.value,
                                          email: debtCon.email.value,
                                          fullName: debtCon.fullName.value,
                                          gender: debtCon.gender.value.display,
                                          phone: debtCon.phoneNumber.value,
                                        ),
                                        CustomReviewAddress(
                                          houseNo: debtCon.fullCurrentAddress
                                                  .value.houseNo ??
                                              "",
                                          street: debtCon.fullCurrentAddress
                                                  .value.streetNo ??
                                              "",
                                          city: debtCon.fullCurrentAddress.value
                                                      .addressList !=
                                                  null
                                              ? "${debtCon.fullCurrentAddress.value.addressList![0].name}"
                                              : "",
                                          district: debtCon.fullCurrentAddress
                                                      .value.addressList !=
                                                  null
                                              ? "${debtCon.fullCurrentAddress.value.addressList![1].name}"
                                              : "",
                                          commune: debtCon.fullCurrentAddress
                                                      .value.addressList !=
                                                  null
                                              ? "${debtCon.fullCurrentAddress.value.addressList![2].name}"
                                              : "",
                                          village: debtCon.fullCurrentAddress
                                                      .value.addressList ==
                                                  null
                                              ? ""
                                              : debtCon
                                                          .fullCurrentAddress
                                                          .value
                                                          .addressList!
                                                          .length !=
                                                      3
                                                  ? "${debtCon.fullCurrentAddress.value.addressList![3].name}"
                                                  : "",
                                          permanenthouseNo: debtCon
                                                  .fullResidentAddress
                                                  .value
                                                  .houseNo ??
                                              "",
                                          permanentStreet: debtCon
                                                  .fullResidentAddress
                                                  .value
                                                  .streetNo ??
                                              "",
                                          permanentCity: debtCon
                                                      .fullResidentAddress
                                                      .value
                                                      .addressList !=
                                                  null
                                              ? "${debtCon.fullResidentAddress.value.addressList![0].name}"
                                              : "",
                                          permanentDistrict: debtCon
                                                      .fullResidentAddress
                                                      .value
                                                      .addressList !=
                                                  null
                                              ? "${debtCon.fullResidentAddress.value.addressList![1].name}"
                                              : "",
                                          permanentCommune: debtCon
                                                      .fullResidentAddress
                                                      .value
                                                      .addressList !=
                                                  null
                                              ? "${debtCon.fullResidentAddress.value.addressList![2].name}"
                                              : "",
                                          permanentVillage: debtCon
                                                      .fullResidentAddress
                                                      .value
                                                      .addressList ==
                                                  null
                                              ? ""
                                              : debtCon
                                                          .fullResidentAddress
                                                          .value
                                                          .addressList!
                                                          .length !=
                                                      3
                                                  ? "${debtCon.fullResidentAddress.value.addressList![3].name}"
                                                  : "",
                                          isEdit: widget.applicationDetail ==
                                                      null ||
                                                  widget.applicationDetail!
                                                          .status ==
                                                      "Draft"
                                              ? true
                                              : false,
                                          onTap: () {
                                            onEditAddress(context);
                                          },
                                        ),
                                        CustomReviewFinancingCard(
                                          isEdit: widget.applicationDetail ==
                                                      null ||
                                                  widget.applicationDetail!
                                                          .status ==
                                                      "Draft"
                                              ? true
                                              : false,
                                          onTap: () {
                                            debtCon.isValidateTerm.value = true;
                                            debtCon.isValidateFinancingAmount
                                                .value = true;
                                            _onShowEditFinancingInfo(context,
                                                debtCon.productType.value.id);
                                          },
                                          productType: debtCon
                                              .productType.value.productName,
                                          financingAmount:
                                              '\$${FormatNumber.formatNumber(double.parse(debtCon.financingAmount.toString()))}',
                                          financingPurpose: debtCon
                                              .financingPurpose.value.display,
                                          intendedDate: debtCon
                                                      .whenOnchangeDate.value ==
                                                  ""
                                              ? debtCon.intendedDate.value == ""
                                                  ? ""
                                                  : FormatDate
                                                      .formatDateTimeGetfunding(
                                                          debtCon.intendedDate
                                                              .value)
                                              : debtCon.intendedDate.value,
                                          term: debtCon.term.value.toString(),
                                        ),
                                        CustomReviewCompanyInfocard(
                                          title: 'Company Information*',
                                          isEditable:
                                              widget.applicationDetail ==
                                                          null ||
                                                      widget.applicationDetail!
                                                              .status ==
                                                          "Draft"
                                                  ? true
                                                  : false,
                                          onTap: () {
                                            ontapCompanyInfo(context);
                                          },
                                          address: debtCon.address.value,
                                          year:
                                              debtCon.yearOfEstablishment.value,
                                          typeofOrganization: debtCon
                                              .typeOfOrganization.value.display,
                                          companyName:
                                              debtCon.companyName.value,
                                          taxIdentification: debtCon
                                              .taxIdentificationNumber.value,
                                          industry:
                                              debtCon.industry.value.display,
                                          numberofStaff:
                                              debtCon.numberOfStaff.value != ''
                                                  ? FormatNumber
                                                          .formatNumberDefualt(
                                                              int.parse(debtCon
                                                                  .numberOfStaff
                                                                  .value))
                                                      .toString()
                                                  : '',
                                          ownername: debtCon.ownerName.value,
                                          productSevice:
                                              debtCon.productSevice.value,
                                          patentDoc:
                                              debtCon.patentDocument.value,
                                          mocCertificate:
                                              debtCon.certificatioDoc.value,
                                          licenceDoc: debtCon.licenseDoc.value,
                                          memorandom:
                                              debtCon.memorandumDoc.value,
                                        ),
                                        CustomRiviewRequiredDocInDebt(
                                          isEdit: widget.applicationDetail ==
                                                      null ||
                                                  widget.applicationDetail!
                                                          .status ==
                                                      "Draft"
                                              ? true
                                              : false,
                                          onTap: () {
                                            onEditRequiredDoc(context);
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                if (widget.applicationDetail == null ||
                                    widget.applicationDetail!.status == "Draft")
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
                                                  widget.applicationDetail ==
                                                          null ||
                                                      checkNotEqual(),
                                              islongLabel: true,
                                              title:
                                                  'I hereby declare that the informations provided above are correct and true.',
                                              isSelect:
                                                  widget.applicationDetail !=
                                                              null &&
                                                          !checkNotEqual()
                                                      ? false
                                                      : debtCon.isAgree.value,
                                              ontap: widget.applicationDetail !=
                                                      null
                                                  ? () {
                                                      if (debtCon
                                                              .fullCurrentAddress
                                                              .value
                                                              .addressList![0]
                                                              .name ==
                                                          debtCon
                                                              .applicationDetail
                                                              .value
                                                              .customerInfo!
                                                              .currentAddress!
                                                              .city!
                                                              .name) {
                                                      } else {}

                                                      if (checkNotEqual()) {
                                                        if (debtCon
                                                            .isAgree.value) {
                                                          debtCon.isAgree
                                                              .value = false;
                                                        } else {
                                                          setState(() {
                                                            debtCon.isAgree
                                                                .value = true;
                                                          });
                                                        }
                                                      } else {
                                                        debtCon.isAgree.value =
                                                            false;
                                                      }
                                                    }
                                                  : () {
                                                      debtCon.isAgree.value =
                                                          !debtCon
                                                              .isAgree.value;
                                                    },
                                            ),
                                          ),
                                          if (debtCon.applicationDetail.value
                                                      .status !=
                                                  'Approved' &&
                                              debtCon.applicationDetail.value
                                                      .status !=
                                                  'Rejected')
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: CustomButton(
                                                    isDisable: false,
                                                    isOutline: true,
                                                    onPressed: () async {
                                                      if (debtCon
                                                                  .applicationDetail
                                                                  .value
                                                                  .status !=
                                                              "Draft" &&
                                                          debtCon
                                                                  .applicationDetail
                                                                  .value
                                                                  .status !=
                                                              "New") {
                                                        Navigator.pop(context);
                                                      } else {
                                                        Navigator.pop(context);
                                                      }
                                                    },
                                                    title:
                                                        widget.applicationDetail !=
                                                                null
                                                            ? "Close"
                                                            : "Close",
                                                  ),
                                                ),
                                                const SizedBox(width: 20),
                                                Expanded(
                                                  child: widget.fromPage ==
                                                              "submit" &&
                                                          widget.applicationDetail ==
                                                              null
                                                      ? CustomButton(
                                                          isDisable: debtCon
                                                                  .isAgree.value
                                                              ? false
                                                              : true,
                                                          isOutline: false,
                                                          onPressed: () async {
                                                            FirebaseAnalyticsHelper
                                                                .sendAnalyticsEvent(
                                                                    "Submit Debt Investment");
                                                            await debtCon
                                                                .onSubmitDebtInvestment(
                                                                    context:
                                                                        context);
                                                          },
                                                          title: 'Submit',
                                                        )
                                                      : CustomButton(
                                                          isDisable: !checkNotEqual()
                                                              ? true
                                                              : false ||
                                                                  debtCon.isAgree
                                                                          .value ==
                                                                      false,
                                                          isOutline: false,
                                                          onPressed: widget
                                                                      .applicationDetail!
                                                                      .status ==
                                                                  "Draft"
                                                              ? () async {
                                                                  FirebaseAnalyticsHelper
                                                                      .sendAnalyticsEvent(
                                                                          "Debt Update Draft to Submit");
                                                                  // Draft to new
                                                                  debugPrint(
                                                                      "Draft to new");
                                                                  await debtCon.onEditDebtInvestment(
                                                                      step: 5,
                                                                      context:
                                                                          context,
                                                                      id: widget
                                                                          .applicationDetail!
                                                                          .id!,
                                                                      frompage: debtCon
                                                                          .applicationDetail
                                                                          .value
                                                                          .step!
                                                                          .toInt(),
                                                                      updateType:
                                                                          "draft_to_new");
                                                                }
                                                              : widget.applicationDetail!
                                                                          .status ==
                                                                      "Rejected"
                                                                  ? () async {
                                                                      // New to New
                                                                      await debtCon
                                                                          .onEditDebtInvestment(
                                                                        context:
                                                                            context,
                                                                        step: 5,
                                                                        id: widget
                                                                            .applicationDetail!
                                                                            .id!,
                                                                        frompage: debtCon
                                                                            .applicationDetail
                                                                            .value
                                                                            .step!
                                                                            .toInt(),
                                                                        updateType:
                                                                            "rejected_to_new",
                                                                      );
                                                                    }
                                                                  : widget.applicationDetail!
                                                                              .status ==
                                                                          "New"
                                                                      ? () async {
                                                                          // New to New

                                                                          await debtCon
                                                                              .onEditDebtInvestment(
                                                                            step:
                                                                                5,
                                                                            context:
                                                                                context,
                                                                            id: widget.applicationDetail!.id!,
                                                                            updateType:
                                                                                "new_to_new",
                                                                            frompage:
                                                                                debtCon.applicationDetail.value.step!.toInt(),
                                                                          );
                                                                        }
                                                                      : () async {
                                                                          await debtCon.onSubmitDebtInvestment(
                                                                              //frompage: debtCon.applicationDetail.value.step!.toInt(),
                                                                              context: context,
                                                                              step: widget.applicationDetail != null && widget.applicationDetail!.status == "Rejected" ? null : 5);
                                                                        },
                                                          title: widget
                                                                      .applicationDetail!
                                                                      .status ==
                                                                  "Rejected"
                                                              ? "Re-Submit"
                                                              : widget.applicationDetail!
                                                                          .status ==
                                                                      "New"
                                                                  ? "Update"
                                                                  : widget.applicationDetail!
                                                                              .status ==
                                                                          "Draft"
                                                                      ? "Submit"
                                                                      : "Close",
                                                        ),
                                                ),
                                              ],
                                            ),
                                        ],
                                      ),
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
