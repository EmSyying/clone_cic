import 'package:cicgreenloan/modules/get_funding/screens/debt_investment/pop_up_edit/required_doc.dart';
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
import '../../../../Utils/helper/injection_helper/injection_helper.dart';
import '../../../../utils/function/format_date_time.dart';
import '../../../../widgets/get_funding/custom_call_center.dart';
import '../../../../widgets/get_funding/custom_review_required_doc_debt.dart';

//===
class PreviewDebtForm extends StatefulWidget {
  final int? id;
  const PreviewDebtForm({Key? key, this.id}) : super(key: key);

  @override
  State<PreviewDebtForm> createState() => _PreviewDebtFormState();
}

class _PreviewDebtFormState extends State<PreviewDebtForm> {
  @override
  void initState() {
    if (widget.id != null) {
      onGetData();
    } else {
      InjectionHelper.debtInvestmentController.isAgree.value = false;
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
              name: InjectionHelper.debtInvestmentController.fullCurrentAddress
                  .value.addressList![0].name,
              code: InjectionHelper.debtInvestmentController.fullCurrentAddress
                  .value.addressList![0].code,
            ),
            Address(
              name: InjectionHelper.debtInvestmentController.fullCurrentAddress
                  .value.addressList![1].name,
              code: InjectionHelper.debtInvestmentController.fullCurrentAddress
                  .value.addressList![1].code,
            ),
            Address(
              name: InjectionHelper.debtInvestmentController.fullCurrentAddress
                  .value.addressList![2].name,
              code: InjectionHelper.debtInvestmentController.fullCurrentAddress
                  .value.addressList![2].code,
            ),
            InjectionHelper.debtInvestmentController.fullCurrentAddress.value
                        .addressList!.length !=
                    3
                ? Address(
                    name: InjectionHelper.debtInvestmentController
                        .fullCurrentAddress.value.addressList![3].name,
                    code: InjectionHelper.debtInvestmentController
                        .fullCurrentAddress.value.addressList![3].code,
                  )
                : Address(),
          ],
          houseNo: InjectionHelper
                  .debtInvestmentController.fullCurrentAddress.value.houseNo ??
              "",
          streetNo: InjectionHelper
                  .debtInvestmentController.fullCurrentAddress.value.streetNo ??
              "",
        ),
        permanetAddress: FullAddress(
          addressList: [
            Address(
              name: InjectionHelper.debtInvestmentController.fullResidentAddress
                  .value.addressList![0].name,
              code: InjectionHelper.debtInvestmentController.fullResidentAddress
                  .value.addressList![0].code,
            ),
            Address(
              name: InjectionHelper.debtInvestmentController.fullResidentAddress
                  .value.addressList![1].name,
              code: InjectionHelper.debtInvestmentController.fullResidentAddress
                  .value.addressList![1].code,
            ),
            Address(
              name: InjectionHelper.debtInvestmentController.fullResidentAddress
                  .value.addressList![2].name,
              code: InjectionHelper.debtInvestmentController.fullResidentAddress
                  .value.addressList![2].code,
            ),
            InjectionHelper.debtInvestmentController.fullResidentAddress.value
                        .addressList!.length !=
                    3
                ? Address(
                    name: InjectionHelper.debtInvestmentController
                        .fullResidentAddress.value.addressList![3].name,
                    code: InjectionHelper.debtInvestmentController
                        .fullResidentAddress.value.addressList![3].code,
                  )
                : Address(),
          ],
          houseNo: InjectionHelper
                  .debtInvestmentController.fullResidentAddress.value.houseNo ??
              "",
          streetNo: InjectionHelper.debtInvestmentController.fullResidentAddress
                  .value.streetNo ??
              "",
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
    if (InjectionHelper.debtInvestmentController.patentDocument.value == 1) {
      InjectionHelper.debtInvestmentController.isPatentDoc.value = true;
    } else {
      InjectionHelper.debtInvestmentController.isPatentDoc.value = false;
    }
    if (InjectionHelper.debtInvestmentController.certificatioDoc.value == 1) {
      InjectionHelper.debtInvestmentController.isCertificate.value = true;
    } else {
      InjectionHelper.debtInvestmentController.isCertificate.value = false;
    }
    if (InjectionHelper.debtInvestmentController.licenseDoc.value == 1) {
      InjectionHelper.debtInvestmentController.isLicense.value = true;
    } else {
      InjectionHelper.debtInvestmentController.isLicense.value = false;
    }
    if (InjectionHelper.debtInvestmentController.memorandumDoc.value == 1) {
      InjectionHelper.debtInvestmentController.isMemorandum.value = true;
    } else {
      InjectionHelper.debtInvestmentController.isMemorandum.value = false;
    }
    InjectionHelper.memberController.addCompany.value = false;
    InjectionHelper.debtInvestmentController.onResetValidateCompany();
  }

  int? incomeStatement;
  int? balanceSheet;
  int? cashFlow;
  int? businessPlan;
  int? otherDocument;

  bool checkNotEqual() {
    return
        //personal info
        InjectionHelper.debtInvestmentController.fullName.value !=
                InjectionHelper.debtInvestmentController.applicationDetail.value
                    .customerInfo!.customerName ||
            InjectionHelper.debtInvestmentController.dateOfBirth.value !=
                InjectionHelper.debtInvestmentController.applicationDetail.value
                    .customerInfo!.customerDateOfBirth! ||
            InjectionHelper.debtInvestmentController.email.value !=
                InjectionHelper.debtInvestmentController.applicationDetail.value
                    .customerInfo!.customerEmail! ||
            InjectionHelper.debtInvestmentController.gender.value.display !=
                InjectionHelper.debtInvestmentController.applicationDetail.value
                    .customerInfo!.customerGender!.display ||

            // address
            //current
            InjectionHelper.debtInvestmentController.fullCurrentAddress.value.houseNo !=
                InjectionHelper.debtInvestmentController.applicationDetail.value
                    .customerInfo!.currentHouseNo ||
            InjectionHelper.debtInvestmentController.fullCurrentAddress.value.streetNo !=
                InjectionHelper.debtInvestmentController.applicationDetail.value
                    .customerInfo!.currentStreetNo ||
            InjectionHelper.debtInvestmentController.fullCurrentAddress.value.addressList![0].name.toString() !=
                InjectionHelper.debtInvestmentController.applicationDetail.value
                    .customerInfo!.currentAddress!.city!.name
                    .toString() ||
            InjectionHelper.debtInvestmentController.fullCurrentAddress.value.addressList![1].name !=
                InjectionHelper.debtInvestmentController.applicationDetail.value.customerInfo!.currentAddress!.district!.name ||
            InjectionHelper.debtInvestmentController.fullCurrentAddress.value.addressList![2].name != InjectionHelper.debtInvestmentController.applicationDetail.value.customerInfo!.currentAddress!.commune!.name ||
            InjectionHelper.debtInvestmentController.fullCurrentAddress.value.addressList![3].name != InjectionHelper.debtInvestmentController.applicationDetail.value.customerInfo!.currentAddress!.village!.name ||
            //permanent
            InjectionHelper.debtInvestmentController.fullResidentAddress.value.houseNo != InjectionHelper.debtInvestmentController.applicationDetail.value.customerInfo!.residenceHouseNo ||
            InjectionHelper.debtInvestmentController.fullResidentAddress.value.streetNo != InjectionHelper.debtInvestmentController.applicationDetail.value.customerInfo!.residenceStreetNo ||
            InjectionHelper.debtInvestmentController.fullResidentAddress.value.addressList![0].name != InjectionHelper.debtInvestmentController.applicationDetail.value.customerInfo!.residenceAddress!.city!.name ||
            InjectionHelper.debtInvestmentController.fullResidentAddress.value.addressList![1].name != InjectionHelper.debtInvestmentController.applicationDetail.value.customerInfo!.residenceAddress!.district!.name ||
            InjectionHelper.debtInvestmentController.fullResidentAddress.value.addressList![2].name != InjectionHelper.debtInvestmentController.applicationDetail.value.customerInfo!.residenceAddress!.commune!.name ||
            InjectionHelper.debtInvestmentController.fullResidentAddress.value.addressList![3].name != InjectionHelper.debtInvestmentController.applicationDetail.value.customerInfo!.residenceAddress!.village!.name ||
            //financing information
            InjectionHelper.debtInvestmentController.financingPurpose.value.display != InjectionHelper.debtInvestmentController.applicationDetail.value.financialPurpose!.display ||
            InjectionHelper.debtInvestmentController.financingAmount.value != InjectionHelper.debtInvestmentController.applicationDetail.value.financialAmount!.toDouble() ||
            InjectionHelper.debtInvestmentController.term.value.toString() != InjectionHelper.debtInvestmentController.applicationDetail.value.duration!.toString() ||
            InjectionHelper.debtInvestmentController.intendedDate.value != InjectionHelper.debtInvestmentController.applicationDetail.value.intendedDateDisbursement! ||
            //company information
            InjectionHelper.debtInvestmentController.companyName.value != InjectionHelper.debtInvestmentController.applicationDetail.value.company!.companyName ||
            InjectionHelper.debtInvestmentController.address.value != InjectionHelper.debtInvestmentController.applicationDetail.value.company!.address ||
            InjectionHelper.debtInvestmentController.yearOfEstablishment.value != InjectionHelper.debtInvestmentController.applicationDetail.value.company!.yearFounded ||
            InjectionHelper.debtInvestmentController.typeOfOrganization.value.display != InjectionHelper.debtInvestmentController.applicationDetail.value.company!.typeOfOrganization!.display ||
            InjectionHelper.debtInvestmentController.taxIdentificationNumber.value != InjectionHelper.debtInvestmentController.applicationDetail.value.company!.taxIdentificationNumber ||
            InjectionHelper.debtInvestmentController.industry.value.display != InjectionHelper.debtInvestmentController.applicationDetail.value.company!.industry!.display ||
            InjectionHelper.debtInvestmentController.numberOfStaff.value != InjectionHelper.debtInvestmentController.applicationDetail.value.company!.numberOfStaff.toString() ||
            InjectionHelper.debtInvestmentController.ownerName.value != InjectionHelper.debtInvestmentController.applicationDetail.value.company!.ownerName ||
            InjectionHelper.debtInvestmentController.productSevice.value != InjectionHelper.debtInvestmentController.applicationDetail.value.company!.companyProductAndService ||

            //other doc
            InjectionHelper.debtInvestmentController.incomeStatement.value != incomeStatement ||
            InjectionHelper.debtInvestmentController.balanceSheet.value != balanceSheet ||
            InjectionHelper.debtInvestmentController.cashFlowStatement.value != cashFlow ||
            InjectionHelper.debtInvestmentController.businessPlan.value != businessPlan ||
            InjectionHelper.debtInvestmentController.otherDocuments.value != otherDocument!;
  }

  void onGetData() async {
    if (widget.id != null) {
      await InjectionHelper.debtInvestmentController
          .fetchAppDetails(widget.id!);

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
      // Financing info
      if (InjectionHelper
              .debtInvestmentController.applicationDetail.value.productType !=
          null) {
        InjectionHelper.debtInvestmentController.productType.value.productName =
            InjectionHelper.debtInvestmentController.applicationDetail.value
                .productType!.name;
        InjectionHelper.debtInvestmentController.productType.value.id =
            InjectionHelper.debtInvestmentController.applicationDetail.value
                .productType!.id!
                .toInt();
      }
      if (InjectionHelper.debtInvestmentController.applicationDetail.value
              .financialPurpose !=
          null) {
        InjectionHelper
                .debtInvestmentController.financingPurpose.value.display =
            InjectionHelper.debtInvestmentController.applicationDetail.value
                .financialPurpose!.display;
        InjectionHelper.debtInvestmentController.financingPurpose.value.id =
            InjectionHelper.debtInvestmentController.applicationDetail.value
                .financialPurpose!.id;
      }
      if (InjectionHelper
              .debtInvestmentController.applicationDetail.value.financialAmount!
              .toDouble() !=
          0.0) {
        InjectionHelper.debtInvestmentController.financingAmount.value =
            InjectionHelper.debtInvestmentController.applicationDetail.value
                .financialAmount!
                .toDouble();
      }
      if (InjectionHelper.debtInvestmentController.applicationDetail.value
              .intendedDateDisbursement !=
          null) {
        InjectionHelper.debtInvestmentController.intendedDate.value =
            InjectionHelper.debtInvestmentController.applicationDetail.value
                .intendedDateDisbursement!;
      }
      if (InjectionHelper
              .debtInvestmentController.applicationDetail.value.duration !=
          0) {
        InjectionHelper.debtInvestmentController.term.value = InjectionHelper
            .debtInvestmentController.applicationDetail.value.duration!
            .toInt();
      }
      debugPrint("Function assign value is work22222");
      //company info
      if (InjectionHelper.debtInvestmentController.applicationDetail.value
              .company!.companyName !=
          "") {
        InjectionHelper.debtInvestmentController.companyName.value =
            InjectionHelper.debtInvestmentController.applicationDetail.value
                .company!.companyName!;
      }

      if (InjectionHelper.debtInvestmentController.applicationDetail.value
              .company!.address !=
          "") {
        InjectionHelper.debtInvestmentController.address.value = InjectionHelper
            .debtInvestmentController.applicationDetail.value.company!.address!;
      }
      if (InjectionHelper.debtInvestmentController.applicationDetail.value
              .company!.yearFounded !=
          "") {
        InjectionHelper.debtInvestmentController.yearOfEstablishment.value =
            InjectionHelper.debtInvestmentController.applicationDetail.value
                .company!.yearFounded!;
      }
      if (InjectionHelper.debtInvestmentController.applicationDetail.value
              .company!.typeOfOrganization!.display !=
          '') {
        InjectionHelper
                .debtInvestmentController.typeOfOrganization.value.display =
            InjectionHelper.debtInvestmentController.applicationDetail.value
                .company!.typeOfOrganization!.display!;
        if (InjectionHelper.debtInvestmentController.applicationDetail.value
                .company!.typeOfOrganization!.id !=
            null) {
          InjectionHelper.debtInvestmentController.typeOfOrganization.value.id =
              InjectionHelper.debtInvestmentController.applicationDetail.value
                  .company!.typeOfOrganization!.id!;
        }
      }
      if (InjectionHelper.debtInvestmentController.applicationDetail.value
              .company!.taxIdentificationNumber !=
          '') {
        InjectionHelper.debtInvestmentController.taxIdentificationNumber.value =
            InjectionHelper.debtInvestmentController.applicationDetail.value
                .company!.taxIdentificationNumber!;
      }
      if (InjectionHelper.debtInvestmentController.applicationDetail.value
              .company!.industry!.display !=
          "") {
        InjectionHelper.debtInvestmentController.industry.value.display =
            InjectionHelper.debtInvestmentController.applicationDetail.value
                .company!.industry!.display!;
        if (InjectionHelper.debtInvestmentController.applicationDetail.value
                .company!.industry!.id !=
            null) {
          InjectionHelper.debtInvestmentController.industry.value.id =
              InjectionHelper.debtInvestmentController.applicationDetail.value
                  .company!.industry!.id!;
        }
      }
      if (InjectionHelper.debtInvestmentController.applicationDetail.value
              .company!.numberOfStaff !=
          0) {
        InjectionHelper.debtInvestmentController.numberOfStaff.value =
            InjectionHelper.debtInvestmentController.applicationDetail.value
                .company!.numberOfStaff
                .toString();
      }
      if (InjectionHelper.debtInvestmentController.applicationDetail.value
              .company!.ownerName !=
          "") {
        InjectionHelper.debtInvestmentController.ownerName.value =
            InjectionHelper.debtInvestmentController.applicationDetail.value
                .company!.ownerName!;
      }
      if (InjectionHelper.debtInvestmentController.applicationDetail.value
              .company!.companyProductAndService !=
          "") {
        InjectionHelper.debtInvestmentController.productSevice.value =
            InjectionHelper.debtInvestmentController.applicationDetail.value
                .company!.companyProductAndService!;
      }
      InjectionHelper.debtInvestmentController.patentDocument.value =
          InjectionHelper.debtInvestmentController.applicationDetail.value
              .companyPatentDoc!;
      InjectionHelper.debtInvestmentController.certificatioDoc.value =
          InjectionHelper.debtInvestmentController.applicationDetail.value
              .companyMoCCertificate!;
      InjectionHelper.debtInvestmentController.licenseDoc.value =
          InjectionHelper.debtInvestmentController.applicationDetail.value
              .companyLicenceDoc!;
      InjectionHelper.debtInvestmentController.memorandumDoc.value =
          InjectionHelper
              .debtInvestmentController.applicationDetail.value.companyMAA!;

      InjectionHelper.debtInvestmentController.incomeStatement.value =
          InjectionHelper.debtInvestmentController.applicationDetail.value
              .incomeStatement!;
      InjectionHelper.debtInvestmentController.balanceSheet.value =
          InjectionHelper
              .debtInvestmentController.applicationDetail.value.balanceSheet!;

      InjectionHelper.debtInvestmentController.cashFlowStatement.value =
          InjectionHelper.debtInvestmentController.applicationDetail.value
              .cashFlowStatement!;

      InjectionHelper.debtInvestmentController.otherDocuments.value =
          InjectionHelper
              .debtInvestmentController.applicationDetail.value.otherDocument!;
      InjectionHelper.debtInvestmentController.businessPlan.value =
          InjectionHelper
              .debtInvestmentController.applicationDetail.value.businessPlan!;
    }
  }

  bool isEditRejected = false;
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
                    appBar: InjectionHelper.debtInvestmentController
                                .isLoadingSubmit.value ==
                            true
                        ? AppBar()
                        : widget.id != null
                            ? CustomAppBarWhiteColor(
                                context: context,
                                title: 'Submitted Application',
                                subtitle: InjectionHelper
                                            .debtInvestmentController
                                            .isLoadingData
                                            .value ==
                                        true
                                    ? ""
                                    : InjectionHelper.debtInvestmentController
                                        .applicationDetail.value.status,
                                // '${InjectionHelper.debtInvestmentController.applicationDetail.value.status}',
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
                                    .debtInvestmentController
                                    .applicationDetail
                                    .value
                                    .status,
                                action: [
                                    const CustomCallCenter(),
                                    const SizedBox(
                                      width: 5,
                                    )
                                  ]),
                    body: InjectionHelper
                            .debtInvestmentController.isLoadingData.value
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
                                                  .debtInvestmentController
                                                  .applicationDetail
                                                  .value
                                                  .reason !=
                                              null)
                                            if (InjectionHelper
                                                    .debtInvestmentController
                                                    .applicationDetail
                                                    .value
                                                    .status ==
                                                'Rejected')
                                              CustomRejectReason(
                                                isReson: true,
                                                onEdit: () {},
                                                title:
                                                    "Rejected Application Reason",
                                                reason: InjectionHelper
                                                    .debtInvestmentController
                                                    .applicationDetail
                                                    .value
                                                    .reason,
                                              ),
                                        CustomReviewProfileCard(
                                          onTap: () {
                                            _onShowEditPersonalInfo(context);
                                          },
                                          isEdit: widget.id == null ||
                                                  InjectionHelper
                                                          .debtInvestmentController
                                                          .applicationDetail
                                                          .value
                                                          .status ==
                                                      "Draft"
                                              ? true
                                              : false,
                                          dob: InjectionHelper
                                              .debtInvestmentController
                                              .dateOfBirth
                                              .value,
                                          email: InjectionHelper
                                              .debtInvestmentController
                                              .email
                                              .value,
                                          fullName: InjectionHelper
                                              .debtInvestmentController
                                              .fullName
                                              .value,
                                          gender: InjectionHelper
                                              .debtInvestmentController
                                              .gender
                                              .value
                                              .display,
                                          phone: InjectionHelper
                                              .debtInvestmentController
                                              .phoneNumber
                                              .value,
                                        ),
                                        CustomReviewAddress(
                                          houseNo: InjectionHelper
                                                  .debtInvestmentController
                                                  .fullCurrentAddress
                                                  .value
                                                  .houseNo ??
                                              "",
                                          street: InjectionHelper
                                                  .debtInvestmentController
                                                  .fullCurrentAddress
                                                  .value
                                                  .streetNo ??
                                              "",
                                          city: InjectionHelper
                                                      .debtInvestmentController
                                                      .fullCurrentAddress
                                                      .value
                                                      .addressList !=
                                                  null
                                              ? "${InjectionHelper.debtInvestmentController.fullCurrentAddress.value.addressList![0].name}"
                                              : "",
                                          district: InjectionHelper
                                                      .debtInvestmentController
                                                      .fullCurrentAddress
                                                      .value
                                                      .addressList !=
                                                  null
                                              ? "${InjectionHelper.debtInvestmentController.fullCurrentAddress.value.addressList![1].name}"
                                              : "",
                                          commune: InjectionHelper
                                                      .debtInvestmentController
                                                      .fullCurrentAddress
                                                      .value
                                                      .addressList !=
                                                  null
                                              ? "${InjectionHelper.debtInvestmentController.fullCurrentAddress.value.addressList![2].name}"
                                              : "",
                                          village: InjectionHelper
                                                      .debtInvestmentController
                                                      .fullCurrentAddress
                                                      .value
                                                      .addressList ==
                                                  null
                                              ? ""
                                              : InjectionHelper
                                                          .debtInvestmentController
                                                          .fullCurrentAddress
                                                          .value
                                                          .addressList!
                                                          .length !=
                                                      3
                                                  ? "${InjectionHelper.debtInvestmentController.fullCurrentAddress.value.addressList![3].name}"
                                                  : "",
                                          permanenthouseNo: InjectionHelper
                                                  .debtInvestmentController
                                                  .fullResidentAddress
                                                  .value
                                                  .houseNo ??
                                              "",
                                          permanentStreet: InjectionHelper
                                                  .debtInvestmentController
                                                  .fullResidentAddress
                                                  .value
                                                  .streetNo ??
                                              "",
                                          permanentCity: InjectionHelper
                                                      .debtInvestmentController
                                                      .fullResidentAddress
                                                      .value
                                                      .addressList !=
                                                  null
                                              ? "${InjectionHelper.debtInvestmentController.fullResidentAddress.value.addressList![0].name}"
                                              : "",
                                          permanentDistrict: InjectionHelper
                                                      .debtInvestmentController
                                                      .fullResidentAddress
                                                      .value
                                                      .addressList !=
                                                  null
                                              ? "${InjectionHelper.debtInvestmentController.fullResidentAddress.value.addressList![1].name}"
                                              : "",
                                          permanentCommune: InjectionHelper
                                                      .debtInvestmentController
                                                      .fullResidentAddress
                                                      .value
                                                      .addressList !=
                                                  null
                                              ? "${InjectionHelper.debtInvestmentController.fullResidentAddress.value.addressList![2].name}"
                                              : "",
                                          permanentVillage: InjectionHelper
                                                      .debtInvestmentController
                                                      .fullResidentAddress
                                                      .value
                                                      .addressList ==
                                                  null
                                              ? ""
                                              : InjectionHelper
                                                          .debtInvestmentController
                                                          .fullResidentAddress
                                                          .value
                                                          .addressList!
                                                          .length !=
                                                      3
                                                  ? "${InjectionHelper.debtInvestmentController.fullResidentAddress.value.addressList![3].name}"
                                                  : "",
                                          isEdit: widget.id == null ||
                                                  InjectionHelper
                                                          .debtInvestmentController
                                                          .applicationDetail
                                                          .value
                                                          .status ==
                                                      "Draft"
                                              ? true
                                              : false,
                                          onTap: () {
                                            onEditAddress(context);
                                          },
                                        ),
                                        CustomReviewFinancingCard(
                                          isEdit: widget.id == null ||
                                                  InjectionHelper
                                                          .debtInvestmentController
                                                          .applicationDetail
                                                          .value
                                                          .status ==
                                                      "Draft"
                                              ? true
                                              : false,
                                          onTap: () {
                                            InjectionHelper
                                                .debtInvestmentController
                                                .isValidateTerm
                                                .value = true;
                                            InjectionHelper
                                                .debtInvestmentController
                                                .isValidateFinancingAmount
                                                .value = true;
                                            _onShowEditFinancingInfo(
                                                context,
                                                InjectionHelper
                                                    .debtInvestmentController
                                                    .productType
                                                    .value
                                                    .id);
                                          },
                                          productType: InjectionHelper
                                              .debtInvestmentController
                                              .productType
                                              .value
                                              .productName,
                                          financingAmount:
                                              '\$${FormatNumber.formatNumber(double.parse(InjectionHelper.debtInvestmentController.financingAmount.toString()))}',
                                          financingPurpose: InjectionHelper
                                              .debtInvestmentController
                                              .financingPurpose
                                              .value
                                              .display,
                                          intendedDate: InjectionHelper
                                                      .debtInvestmentController
                                                      .whenOnchangeDate
                                                      .value ==
                                                  ""
                                              ? InjectionHelper
                                                          .debtInvestmentController
                                                          .intendedDate
                                                          .value ==
                                                      ""
                                                  ? ""
                                                  : FormatDate
                                                      .formatDateTimeGetfunding(
                                                          InjectionHelper
                                                              .debtInvestmentController
                                                              .intendedDate
                                                              .value)
                                              : InjectionHelper
                                                  .debtInvestmentController
                                                  .intendedDate
                                                  .value,
                                          term: InjectionHelper
                                              .debtInvestmentController
                                              .term
                                              .value
                                              .toString(),
                                        ),
                                        CustomReviewCompanyInfocard(
                                          title: 'Company Information*',
                                          isEditable: widget.id == null ||
                                                  InjectionHelper
                                                          .debtInvestmentController
                                                          .applicationDetail
                                                          .value
                                                          .status ==
                                                      "Draft"
                                              ? true
                                              : false,
                                          onTap: () {
                                            ontapCompanyInfo(context);
                                          },
                                          address: InjectionHelper
                                              .debtInvestmentController
                                              .address
                                              .value,
                                          year: InjectionHelper
                                              .debtInvestmentController
                                              .yearOfEstablishment
                                              .value,
                                          typeofOrganization: InjectionHelper
                                              .debtInvestmentController
                                              .typeOfOrganization
                                              .value
                                              .display,
                                          companyName: InjectionHelper
                                              .debtInvestmentController
                                              .companyName
                                              .value,
                                          taxIdentification: InjectionHelper
                                              .debtInvestmentController
                                              .taxIdentificationNumber
                                              .value,
                                          industry: InjectionHelper
                                              .debtInvestmentController
                                              .industry
                                              .value
                                              .display,
                                          numberofStaff: InjectionHelper
                                                      .debtInvestmentController
                                                      .numberOfStaff
                                                      .value !=
                                                  ''
                                              ? FormatNumber.formatNumberDefualt(
                                                      int.parse(InjectionHelper
                                                          .debtInvestmentController
                                                          .numberOfStaff
                                                          .value))
                                                  .toString()
                                              : '',
                                          ownername: InjectionHelper
                                              .debtInvestmentController
                                              .ownerName
                                              .value,
                                          productSevice: InjectionHelper
                                              .debtInvestmentController
                                              .productSevice
                                              .value,
                                          patentDoc: InjectionHelper
                                              .debtInvestmentController
                                              .patentDocument
                                              .value,
                                          mocCertificate: InjectionHelper
                                              .debtInvestmentController
                                              .certificatioDoc
                                              .value,
                                          licenceDoc: InjectionHelper
                                              .debtInvestmentController
                                              .licenseDoc
                                              .value,
                                          memorandom: InjectionHelper
                                              .debtInvestmentController
                                              .memorandumDoc
                                              .value,
                                        ),
                                        CustomRiviewRequiredDocInDebt(
                                          isEdit: widget.id == null ||
                                                  InjectionHelper
                                                          .debtInvestmentController
                                                          .applicationDetail
                                                          .value
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
                                if (widget.id == null ||
                                    InjectionHelper.debtInvestmentController
                                            .applicationDetail.value.status ==
                                        "Draft")
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
                                                  widget.id == null ||
                                                      checkNotEqual(),
                                              islongLabel: true,
                                              title:
                                                  'I hereby declare that the informations provided above are correct and true.',
                                              isSelect: widget.id != null &&
                                                      !checkNotEqual()
                                                  ? false
                                                  : InjectionHelper
                                                      .debtInvestmentController
                                                      .isAgree
                                                      .value,
                                              ontap: widget.id != null
                                                  ? () {
                                                      if (InjectionHelper
                                                              .debtInvestmentController
                                                              .fullCurrentAddress
                                                              .value
                                                              .addressList![0]
                                                              .name ==
                                                          InjectionHelper
                                                              .debtInvestmentController
                                                              .applicationDetail
                                                              .value
                                                              .customerInfo!
                                                              .currentAddress!
                                                              .city!
                                                              .name) {
                                                      } else {}

                                                      if (checkNotEqual()) {
                                                        if (InjectionHelper
                                                            .debtInvestmentController
                                                            .isAgree
                                                            .value) {
                                                          InjectionHelper
                                                              .debtInvestmentController
                                                              .isAgree
                                                              .value = false;
                                                        } else {
                                                          setState(() {
                                                            InjectionHelper
                                                                .debtInvestmentController
                                                                .isAgree
                                                                .value = true;
                                                          });
                                                        }
                                                      } else {
                                                        InjectionHelper
                                                            .debtInvestmentController
                                                            .isAgree
                                                            .value = false;
                                                      }
                                                    }
                                                  : () {
                                                      InjectionHelper
                                                              .debtInvestmentController
                                                              .isAgree
                                                              .value =
                                                          !InjectionHelper
                                                              .debtInvestmentController
                                                              .isAgree
                                                              .value;
                                                    },
                                            ),
                                          ),
                                          if (InjectionHelper
                                                      .debtInvestmentController
                                                      .applicationDetail
                                                      .value
                                                      .status !=
                                                  'Approved' &&
                                              InjectionHelper
                                                      .debtInvestmentController
                                                      .applicationDetail
                                                      .value
                                                      .status !=
                                                  'Rejected')
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: CustomButton(
                                                    isDisable: false,
                                                    isOutline: true,
                                                    onPressed: () async {
                                                      if (InjectionHelper
                                                                  .debtInvestmentController
                                                                  .applicationDetail
                                                                  .value
                                                                  .status !=
                                                              "Draft" &&
                                                          InjectionHelper
                                                                  .debtInvestmentController
                                                                  .applicationDetail
                                                                  .value
                                                                  .status !=
                                                              "New") {
                                                        Navigator.pop(context);
                                                      } else {
                                                        Navigator.pop(context);
                                                      }
                                                    },
                                                    title: "Close",
                                                  ),
                                                ),
                                                const SizedBox(width: 20),
                                                Expanded(
                                                  child: widget.id == null
                                                      ? CustomButton(
                                                          isDisable: InjectionHelper
                                                                  .debtInvestmentController
                                                                  .isAgree
                                                                  .value
                                                              ? false
                                                              : true,
                                                          isOutline: false,
                                                          onPressed: () async {
                                                            FirebaseAnalyticsHelper
                                                                .sendAnalyticsEvent(
                                                                    "Submit Debt Investment");
                                                            await InjectionHelper
                                                                .debtInvestmentController
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
                                                                  InjectionHelper
                                                                          .debtInvestmentController
                                                                          .isAgree
                                                                          .value ==
                                                                      false,
                                                          isOutline: false,
                                                          onPressed: InjectionHelper
                                                                      .debtInvestmentController
                                                                      .applicationDetail
                                                                      .value
                                                                      .status ==
                                                                  "Draft"
                                                              ? () async {
                                                                  FirebaseAnalyticsHelper
                                                                      .sendAnalyticsEvent(
                                                                          "Debt Update Draft to Submit");
                                                                  // Draft to new
                                                                  debugPrint(
                                                                      "Draft to new");
                                                                  await InjectionHelper
                                                                      .debtInvestmentController
                                                                      .onEditDebtInvestment(
                                                                    step: 5,
                                                                    context:
                                                                        context,
                                                                    id: widget
                                                                        .id,
                                                                    frompage: InjectionHelper
                                                                        .debtInvestmentController
                                                                        .applicationDetail
                                                                        .value
                                                                        .step!
                                                                        .toInt(),
                                                                  );
                                                                }
                                                              : InjectionHelper
                                                                          .debtInvestmentController
                                                                          .applicationDetail
                                                                          .value
                                                                          .status ==
                                                                      "Rejected"
                                                                  ? () async {
                                                                      // New to New
                                                                      await InjectionHelper
                                                                          .debtInvestmentController
                                                                          .onEditDebtInvestment(
                                                                        context:
                                                                            context,
                                                                        step: 5,
                                                                        id: widget
                                                                            .id,
                                                                        frompage: InjectionHelper
                                                                            .debtInvestmentController
                                                                            .applicationDetail
                                                                            .value
                                                                            .step!
                                                                            .toInt(),
                                                                      );
                                                                    }
                                                                  : InjectionHelper
                                                                              .debtInvestmentController
                                                                              .applicationDetail
                                                                              .value
                                                                              .status ==
                                                                          "New"
                                                                      ? () async {
                                                                          // New to New

                                                                          await InjectionHelper
                                                                              .debtInvestmentController
                                                                              .onEditDebtInvestment(
                                                                            step:
                                                                                5,
                                                                            context:
                                                                                context,
                                                                            id: widget.id,
                                                                            frompage:
                                                                                InjectionHelper.debtInvestmentController.applicationDetail.value.step!.toInt(),
                                                                          );
                                                                        }
                                                                      : () async {
                                                                          await InjectionHelper.debtInvestmentController.onSubmitDebtInvestment(
                                                                              //frompage: InjectionHelper.debtInvestmentController.applicationDetail.value.step!.toInt(),
                                                                              context: context,
                                                                              step: widget.id != null && InjectionHelper.debtInvestmentController.applicationDetail.value.status == "Rejected" ? null : 5);
                                                                        },
                                                          title: InjectionHelper
                                                                      .debtInvestmentController
                                                                      .applicationDetail
                                                                      .value
                                                                      .status ==
                                                                  "Rejected"
                                                              ? "Re-Submit"
                                                              : InjectionHelper
                                                                          .debtInvestmentController
                                                                          .applicationDetail
                                                                          .value
                                                                          .status ==
                                                                      "New"
                                                                  ? "Update"
                                                                  : InjectionHelper
                                                                              .debtInvestmentController
                                                                              .applicationDetail
                                                                              .value
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
