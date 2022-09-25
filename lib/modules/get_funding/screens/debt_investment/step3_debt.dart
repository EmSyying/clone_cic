import 'dart:io';
import 'package:cicgreenloan/Utils/helper/numerice_format.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/customer_controller.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/member_controller.dart';
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
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../Utils/helper/container_partern.dart';
import '../../../../Utils/helper/custom_appbar_colorswhite.dart';
import '../../../../Utils/helper/firebase_analytics.dart';
import '../../../../Utils/helper/format_number.dart';
import '../../../../widgets/get_funding/custom_add_other_label.dart';
import '../../../../widgets/get_funding/custom_call_center.dart';
import '../../../../widgets/get_funding/custom_select_2_getfunding.dart';

class Step3Debt extends StatefulWidget {
  final int? id;
  final int? step;
  const Step3Debt({
    Key? key,
    this.id,
    this.step,
  }) : super(key: key);

  @override
  State<Step3Debt> createState() => _Step3DebtState();
}

class _Step3DebtState extends State<Step3Debt> {
  final memberCon = Get.put(MemberController());
  final cutomerController = Get.put(CustomerController());
  final debtCon = Get.put(DebtInvestmentController());
  final optionCon = Get.put(DocumentCategory());
  var defaultData = DebtStep3Model();
  var tempData = DebtStep3Model();
  int? currentIndex;
  void _onValidate() {
    if (debtCon.companyName.value == "") {
      debtCon.isValCompanyName.value = false;
    } else {
      debtCon.isValCompanyName.value = true;
    }

    if (debtCon.address.value == '') {
      debtCon.isValAddress.value = false;
    } else {
      debtCon.isValAddress.value = true;
    }

    if (debtCon.yearOfEstablishment.value == '') {
      debtCon.isValYearOfEstablishment.value = false;
    } else {
      debtCon.isValYearOfEstablishment.value = true;
    }

    if (debtCon.typeOfOrganization.value.display == null) {
      debtCon.isValTypeOfOrganization.value = false;
    } else {
      debtCon.isValTypeOfOrganization.value = true;
    }

    if (debtCon.industry.value.display == null) {
      debtCon.isValIndustry.value = false;
    } else {
      debtCon.isValIndustry.value = true;
    }

    if (debtCon.numberOfStaff.value == '') {
      debtCon.isValNumberOfStaff.value = false;
      debtCon.update();
    } else {
      debtCon.isValNumberOfStaff.value = true;
      debtCon.update();
    }

    if (debtCon.ownerName.value == '') {
      debtCon.isValOwnerName.value = false;
    } else {
      debtCon.isValOwnerName.value = true;
    }

    if (debtCon.productSevice.value == '') {
      debtCon.isValProductService.value = false;
    } else {
      debtCon.isValProductService.value = true;
    }
    if (debtCon.companyName.value != "" &&
        debtCon.address.value != "" &&
        debtCon.yearOfEstablishment.value != "" &&
        debtCon.typeOfOrganization.value.display != null &&
        debtCon.industry.value.display != null &&
        debtCon.numberOfStaff.value != "" &&
        debtCon.ownerName.value != "" &&
        debtCon.productSevice.value != "") {
      FocusScope.of(context).unfocus();
      context
          .push("/get_funding/debt-step4?id=${widget.id}&&step=${widget.step}");
    }
  }

  @override
  void initState() {
    memberCon.fetchCompanyMember(
        id: cutomerController.customer.value.customerId);
    super.initState();
    if (memberCon.companyDataList.isNotEmpty) {
      memberCon.addCompany.value = false;
    }
    debtCon.productController.value;
    debtCon.addresscontroller.value;
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
                    id: value.company!.typeOfOrganization!.id,
                    display: value.company!.typeOfOrganization!.display)
                : Optionmodel(id: 0, display: null);

        debtCon.taxIdentificationNumber.value =
            value.company!.taxIdentificationNumber!;
        debtCon.taxindentificationController.text =
            value.company!.taxIdentificationNumber!;

        debtCon.industry.value = value.company!.industry != null
            ? Optionmodel(
                id: value.company!.industry!.id,
                display: value.company!.industry!.display)
            : Optionmodel(id: 0, display: null);
        debtCon.typeOfOrganization.value.display ==
            value.company!.typeOfOrganization!.display;
        debtCon.industry.value.display == value.company!.industry!.display;

        ///
        if (value.company!.numberOfStaff != null &&
            value.company!.numberOfStaff != 0) {
          var displaynumberOfStaff =
              FormatNumber.formatNumberDefualt(value.company!.numberOfStaff!);
          debtCon.numberofStaffController.text =
              displaynumberOfStaff.toString();
        } else {
          debtCon.numberofStaffController.text = '';
        }

        ///
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

        if (value.companyPatentDoc == 1) {
          debtCon.isPatentDoc.value = true;
        } else {
          debtCon.isPatentDoc.value = false;
        }
        if (value.companyMoCCertificate == 1) {
          debtCon.isCertificate.value = true;
        } else {
          debtCon.isCertificate.value = false;
        }
        if (value.companyLicenceDoc == 1) {
          debtCon.isLicense.value = true;
        } else {
          debtCon.isLicense.value = false;
        }
        if (value.companyMAA == 1) {
          debtCon.isMemorandum.value = true;
        } else {
          debtCon.isMemorandum.value = false;
        }

        defaultData = DebtStep3Model(
          companyName: debtCon.companyName.value,
          address: debtCon.address.value,
          yearOfEstablishment: debtCon.yearOfEstablishment.value,
          typeOfOrganization: debtCon.typeOfOrganization.value,
          taxIdentificationNumber: debtCon.taxIdentificationNumber.value,
          industry: debtCon.industry.value,
          numberOfStaff: debtCon.numberOfStaff.value,
          ownerName: debtCon.ownerName.value,
          productSevice: debtCon.productSevice.value,
          patentDoc: debtCon.patentDocument.value,
          licenceDoc: debtCon.licenseDoc.value,
          mocCertificate: debtCon.certificatioDoc.value,
          memorandum: debtCon.memorandumDoc.value,
        );
        tempData = DebtStep3Model(
          companyName: debtCon.companyName.value,
          address: debtCon.address.value,
          yearOfEstablishment: debtCon.yearOfEstablishment.value,
          typeOfOrganization: debtCon.typeOfOrganization.value,
          taxIdentificationNumber: debtCon.taxIdentificationNumber.value,
          industry: debtCon.industry.value,
          numberOfStaff: debtCon.numberOfStaff.value,
          ownerName: debtCon.ownerName.value,
          productSevice: debtCon.productSevice.value,
          patentDoc: debtCon.patentDocument.value,
          licenceDoc: debtCon.licenseDoc.value,
          mocCertificate: debtCon.certificatioDoc.value,
          memorandum: debtCon.memorandumDoc.value,
        );
      });
    }
  }

  setValidate() {
    debtCon.isValCompanyName.value = true;
    debtCon.isValAddress.value = true;
    debtCon.isValYearOfEstablishment.value = true;
    debtCon.isValTypeOfOrganization.value = true;
    debtCon.isValIndustry.value = true;
    debtCon.isValNumberOfStaff.value = true;
    debtCon.isValOwnerName.value = true;
    debtCon.isValProductService.value = true;
  }

  onResetCompany() {
    debtCon.companyName.value = "";
    debtCon.address.value = "";
    debtCon.yearOfEstablishment.value = "";
    debtCon.typeOfOrganization.value = Optionmodel(display: null, id: 0);
    debtCon.taxIdentificationNumber.value = "";
    debtCon.industry.value = Optionmodel(
      display: null,
      id: 0,
    );
    debtCon.numberOfStaff.value = "0";
    debtCon.ownerName.value = "";
    debtCon.productSevice.value = "";
    debtCon.addresscontroller.text = "";
    debtCon.yearofestablistmentController.text = "";
    debtCon.ownernameController.text = "";
    debtCon.productController.text = "";
    debtCon.numberofStaffController.text = "";
    debtCon.taxindentificationController.text = "";

    debtCon.isPatentDoc.value = false;
    debtCon.isCertificate.value = false;
    debtCon.isMemorandum.value = false;
    debtCon.isLicense.value = false;

    debtCon.patentDocument.value = 0;
    debtCon.certificatioDoc.value = 0;
    debtCon.licenseDoc.value = 0;
    debtCon.memorandumDoc.value = 0;
  }

  TextEditingController addNewOtherType = TextEditingController();
  TextEditingController addNewOtherIndustry = TextEditingController();

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
                              onPressed: tempData == defaultData &&
                                      debtCon.companyName.value == "" &&
                                      debtCon.address.value == "" &&
                                      debtCon.yearOfEstablishment.value == "" &&
                                      debtCon.typeOfOrganization.value
                                              .display ==
                                          null &&
                                      debtCon.taxIdentificationNumber.value ==
                                          "" &&
                                      debtCon.industry.value.display == null &&
                                      debtCon.numberOfStaff.value == "0" &&
                                      debtCon.ownerName.value == "" &&
                                      debtCon.productSevice.value == ""
                                  ? () {
                                      setValidate();
                                      Navigator.pop(context);
                                    }
                                  : () {
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
                                                  Navigator.pop(context);
                                                  await debtCon
                                                      .onEditDebtInvestment(
                                                          id: widget.id,
                                                          context: context,
                                                          frompage: debtCon
                                                              .applicationDetail
                                                              .value
                                                              .step!
                                                              .toInt(),
                                                          step: 3);
                                                }
                                              : () async {
                                                  Navigator.pop(context);
                                                  await debtCon
                                                      .onSubmitDebtInvestment(
                                                          context: context,
                                                          step: 3);
                                                },
                                          onDiscard: () {
                                            setValidate();
                                            context.go("/get_funding");
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
                            context: context,
                            title: 'Debt Investment',
                            action: [
                              const CustomCallCenter(),
                              const CustomCircleChart(
                                isDebtInvestment: true,
                                numberPage: 3,
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
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 20),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Text(
                                            'Company Information',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline2,
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        CustomFormCard(
                                          padding: const EdgeInsets.only(
                                              bottom: 20, top: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              memberCon.companyDataList
                                                          .isNotEmpty &&
                                                      memberCon.addCompany
                                                              .value ==
                                                          false
                                                  ? Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 5),
                                                      child: CICDropdown(
                                                        colors: Colors.white,
                                                        onCreateCompany: () {
                                                          onResetCompany();

                                                          memberCon.addCompany
                                                              .value = true;
                                                          memberCon.addCompany
                                                              .refresh();
                                                          memberCon.update();

                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        isCompany: true,
                                                        isValidate: debtCon
                                                            .isValCompanyName
                                                            .value,
                                                        item: memberCon
                                                            .companyDataList
                                                            .asMap()
                                                            .entries
                                                            .map((e) {
                                                          return DropDownItem(
                                                            itemList: {
                                                              "Name": e.value
                                                                  .companyName,
                                                              "Code": e.key
                                                                  .toString(),
                                                              "Address": e.value
                                                                  .address,
                                                              "Product": e.value
                                                                  .companyProductAndService,
                                                              "Tax": e.value
                                                                          .taxIdentificationNumber !=
                                                                      ""
                                                                  ? e.value
                                                                      .taxIdentificationNumber
                                                                  : "",
                                                              "Year": e.value
                                                                  .yearFounded,
                                                              "Typeid": e.value
                                                                          .typeOfOrganization !=
                                                                      null
                                                                  ? e
                                                                      .value
                                                                      .typeOfOrganization!
                                                                      .id
                                                                      .toString()
                                                                  : '0',
                                                              "TypeDis": e.value
                                                                          .typeOfOrganization !=
                                                                      null
                                                                  ? e
                                                                      .value
                                                                      .typeOfOrganization!
                                                                      .display
                                                                  : null,
                                                              "Industryid": e
                                                                          .value
                                                                          .industry !=
                                                                      null
                                                                  ? e
                                                                      .value
                                                                      .industry!
                                                                      .id
                                                                      .toString()
                                                                  : '0',
                                                              "IndustryDis": e
                                                                          .value
                                                                          .industry !=
                                                                      null
                                                                  ? e
                                                                      .value
                                                                      .industry!
                                                                      .display
                                                                  : null,
                                                              "NumberOfStaff": e
                                                                          .value
                                                                          .numberOfStaff !=
                                                                      0
                                                                  ? e.value
                                                                      .numberOfStaff
                                                                      .toString()
                                                                  : '',
                                                              "OwnerName": e
                                                                  .value
                                                                  .ownerName,
                                                              "patent": e.value
                                                                          .companyFiles !=
                                                                      null
                                                                  ? e
                                                                      .value
                                                                      .companyFiles!
                                                                      .companyPatentDoc
                                                                  : [],
                                                              "moc": e.value
                                                                          .companyFiles !=
                                                                      null
                                                                  ? e
                                                                      .value
                                                                      .companyFiles!
                                                                      .companyMoCCertificate
                                                                  : [],
                                                              "licence": e.value
                                                                          .companyFiles !=
                                                                      null
                                                                  ? e
                                                                      .value
                                                                      .companyFiles!
                                                                      .companyLicenceDoc
                                                                  : []
                                                            },
                                                          );
                                                        }).toList(),
                                                        onChange: (v) {
                                                          debtCon.companyName
                                                                  .value =
                                                              v["Name"];

                                                          setState(() {
                                                            tempData.companyName =
                                                                debtCon
                                                                    .companyName
                                                                    .value;
                                                          });

                                                          debtCon.address
                                                                  .value =
                                                              v["Address"];

                                                          debtCon
                                                              .addresscontroller
                                                              .text = v["Address"];

                                                          v["patent"]
                                                              .map((e) =>
                                                                  debtCon
                                                                      .patentDoc
                                                                      .add(e
                                                                          .url))
                                                              .toList();
                                                          v["licence"]
                                                              .map((e) => debtCon
                                                                  .licenceDoc
                                                                  .add(e.url))
                                                              .toList();
                                                          v["moc"]
                                                              .map((e) => debtCon
                                                                  .mocCertificate
                                                                  .add(e.url))
                                                              .toList();

                                                          ///Disable File +++
                                                          debtCon
                                                              .yearOfEstablishment
                                                              .value = v['Year'];
                                                          debtCon
                                                              .yearofestablistmentController
                                                              .text = v['Year'];
                                                          debtCon.ownerName
                                                                  .value =
                                                              v['OwnerName'];
                                                          debtCon.ownernameController
                                                                  .text =
                                                              v['OwnerName'];
                                                          v['NumberOfStaff'] ==
                                                                  ''
                                                              ? debtCon
                                                                  .numberOfStaff
                                                                  .value = ''
                                                              : debtCon
                                                                      .numberOfStaff
                                                                      .value =
                                                                  v['NumberOfStaff'];

                                                          ///
                                                          if (v['NumberOfStaff'] ==
                                                              '') {
                                                            debtCon
                                                                .numberofStaffController
                                                                .text = '';
                                                          } else {
                                                            var displaynumberstaff =
                                                                FormatNumber
                                                                    .formatNumberDefualt(
                                                                        int.parse(
                                                                            v['NumberOfStaff']));
                                                            debtCon.numberofStaffController
                                                                    .text =
                                                                displaynumberstaff
                                                                    .toString();
                                                          }

                                                          ///
                                                          debtCon.typeOfOrganization
                                                                  .value =
                                                              Optionmodel(
                                                                  id: int.parse(v[
                                                                      'Typeid']),
                                                                  display: v[
                                                                      'TypeDis']);
                                                          debtCon.industry
                                                                  .value =
                                                              Optionmodel(
                                                                  id: int.parse(v[
                                                                      'Industryid']),
                                                                  display: v[
                                                                      'IndustryDis']);
                                                          debtCon
                                                              .taxindentificationController
                                                              .text = v['Tax'];
                                                          debtCon
                                                              .taxIdentificationNumber
                                                              .value = v['Tax'];
                                                          debtCon.companyIndex
                                                                  .value =
                                                              v['Code'];

                                                          debtCon.productSevice
                                                                  .value =
                                                              v["Product"];
                                                          debtCon
                                                              .productController
                                                              .text = v["Product"];

                                                          debtCon
                                                              .isValProductService
                                                              .value = true;
                                                          debtCon
                                                              .isValCompanyName
                                                              .value = true;
                                                          debtCon.isValAddress
                                                              .value = true;
                                                          debtCon
                                                              .isValYearOfEstablishment
                                                              .value = true;
                                                          debtCon
                                                              .isValTypeOfOrganization
                                                              .value = true;
                                                          debtCon.isValIndustry
                                                              .value = true;
                                                          debtCon
                                                              .isValNumberOfStaff
                                                              .value = true;
                                                          debtCon.isValOwnerName
                                                              .value = true;
                                                        },
                                                        label: 'Company Name',
                                                        defaultValue: debtCon
                                                                    .companyName
                                                                    .value !=
                                                                ''
                                                            ? {
                                                                "Name": debtCon
                                                                    .companyName
                                                                    .value,
                                                                "Code": debtCon
                                                                    .companyIndex
                                                                    .value
                                                              }
                                                            : null,
                                                      ),
                                                    )
                                                  : memberCon.addCompany
                                                              .value ==
                                                          true
                                                      ? CustomTextFieldNew(
                                                          autoFocus: memberCon
                                                              .addCompany.value,
                                                          textInputAction:
                                                              TextInputAction
                                                                  .next,
                                                          maxLine: 1,
                                                          isRequired: true,
                                                          isValidate: debtCon
                                                              .isValCompanyName
                                                              .value,
                                                          //===
                                                          labelText:
                                                              'Company Name',
                                                          hintText:
                                                              'Company Name',
                                                          onChange: (value) {
                                                            debtCon
                                                                .isValCompanyName
                                                                .value = true;
                                                            if (value.isEmpty) {
                                                              debtCon
                                                                  .companyName
                                                                  .value = '';
                                                              setState(() {
                                                                tempData.companyName =
                                                                    "";
                                                              });
                                                            } else {
                                                              debtCon
                                                                  .companyName
                                                                  .value = value;
                                                              setState(() {
                                                                tempData.companyName =
                                                                    debtCon
                                                                        .companyName
                                                                        .value;
                                                              });
                                                            }
                                                          },
                                                          initialValue: debtCon
                                                              .companyName
                                                              .value,
                                                        )
                                                      : CustomTextFieldNew(
                                                          autoFocus: memberCon
                                                              .addCompany.value,
                                                          textInputAction:
                                                              TextInputAction
                                                                  .next,
                                                          maxLine: 1,
                                                          isRequired: true,
                                                          isValidate: debtCon
                                                              .isValCompanyName
                                                              .value,
                                                          labelText:
                                                              'Company Name',
                                                          hintText:
                                                              'Company Name',
                                                          onChange: (value) {
                                                            debtCon
                                                                .isValCompanyName
                                                                .value = true;
                                                            if (value.isEmpty) {
                                                              debtCon
                                                                  .companyName
                                                                  .value = '';
                                                              setState(() {
                                                                tempData.companyName =
                                                                    "";
                                                              });
                                                            } else {
                                                              debtCon
                                                                  .companyName
                                                                  .value = value;
                                                              setState(() {
                                                                tempData.companyName =
                                                                    debtCon
                                                                        .companyName
                                                                        .value;
                                                              });
                                                            }
                                                          },
                                                          initialValue: debtCon
                                                              .companyName
                                                              .value,
                                                        ),
                                              const SizedBox(height: 5),
                                              CustomTextFieldNew(
                                                textInputAction:
                                                    TextInputAction.next,
                                                maxLine: 1,
                                                controller:
                                                    debtCon.addresscontroller,
                                                isRequired: true,
                                                isValidate:
                                                    debtCon.isValAddress.value,
                                                labelText: 'Address',
                                                hintText: 'Address',
                                                onChange: (value) {
                                                  if (value.isEmpty) {
                                                    debtCon.isValAddress.value =
                                                        false;
                                                    debtCon.address.value = '';
                                                    setState(() {
                                                      tempData.address = "";
                                                    });
                                                  } else {
                                                    debtCon.isValAddress.value =
                                                        true;
                                                    debtCon.address.value =
                                                        value;
                                                    setState(() {
                                                      tempData.address =
                                                          debtCon.address.value;
                                                    });
                                                  }
                                                },
                                                initialValue:
                                                    debtCon.address.value,
                                              ),
                                              CustomTextFieldNew(
                                                textInputAction:
                                                    TextInputAction.next,
                                                maxLine: 1,
                                                maxlenght: 4,
                                                isRequired: true,
                                                isValidate: debtCon
                                                    .isValYearOfEstablishment
                                                    .value,
                                                labelText:
                                                    'Year Of Establishment',
                                                hintText:
                                                    'Year Of Establishment',
                                                onChange: (value) {
                                                  if (value.isEmpty) {
                                                    debtCon
                                                        .isValYearOfEstablishment
                                                        .value = false;
                                                    debtCon.yearOfEstablishment
                                                        .value = '';
                                                    setState(() {
                                                      tempData.yearOfEstablishment =
                                                          "";
                                                    });
                                                  } else {
                                                    debtCon
                                                        .isValYearOfEstablishment
                                                        .value = true;
                                                    debtCon.yearOfEstablishment
                                                        .value = value;
                                                    setState(() {
                                                      tempData.yearOfEstablishment =
                                                          debtCon
                                                              .yearOfEstablishment
                                                              .value;
                                                    });
                                                  }
                                                },
                                                keyboardType:
                                                    TextInputType.number,
                                                inputFormatterList: [
                                                  FilteringTextInputFormatter
                                                      .digitsOnly,
                                                  FilteringTextInputFormatter
                                                      .deny(RegExp(r'^0+')),
                                                ],
                                                controller: debtCon
                                                    .yearofestablistmentController,
                                                initialValue: debtCon
                                                    .yearOfEstablishment.value,
                                              ),
                                              CICDropdown(
                                                onCreateCompany: () {
                                                  Navigator.pop(context);

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
                                                        debtCon.typeOfOrganization
                                                                .value.display =
                                                            addNewOtherType
                                                                .text;
                                                        if (addNewOtherType
                                                                .text !=
                                                            "") {
                                                          debtCon
                                                              .typeOfOrganization
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
                                                          addNewOtherType,
                                                      initialValue: "",
                                                      hintText:
                                                          'Type Of Organization',
                                                      labelText:
                                                          'Type Of Organization',
                                                    ),
                                                  );
                                                },
                                                isCompany: true,
                                                otherLabel: "Add Other",
                                                colors: Colors.white,
                                                isValidate: debtCon
                                                    .isValTypeOfOrganization
                                                    .value,
                                                item: optionCon.optionData.value
                                                    .organization!
                                                    .asMap()
                                                    .entries
                                                    .map((e) {
                                                  return DropDownItem(
                                                    itemList: {
                                                      "Name": e.value.display!,
                                                      "Code":
                                                          e.value.id.toString()
                                                    },
                                                  );
                                                }).toList(),
                                                onChange: (v) {
                                                  debtCon.typeOfOrganization
                                                      .value = Optionmodel(
                                                    display: v["Name"],
                                                    id: int.parse(
                                                      v["Code"],
                                                    ),
                                                  );
                                                  setState(() {
                                                    tempData.typeOfOrganization =
                                                        Optionmodel(
                                                      id: int.parse(
                                                        v["Code"],
                                                      ),
                                                      display: v["Name"],
                                                    );
                                                  });

                                                  debtCon
                                                      .isValTypeOfOrganization
                                                      .value = true;
                                                },
                                                label: 'Type Of Organization',
                                                defaultValue: debtCon
                                                                .typeOfOrganization
                                                                .value
                                                                .display !=
                                                            null &&
                                                        debtCon.typeOfOrganization
                                                                .value.display!
                                                                .toLowerCase() !=
                                                            'null'
                                                    ? {
                                                        "Name": debtCon
                                                            .typeOfOrganization
                                                            .value
                                                            .display,
                                                        "Code": debtCon
                                                            .typeOfOrganization
                                                            .value
                                                            .id
                                                      }
                                                    : null,
                                              ),
                                              const SizedBox(height: 10),
                                              CustomTextFieldNew(
                                                textInputAction:
                                                    TextInputAction.next,
                                                maxLine: 1,
                                                controller: debtCon
                                                    .taxindentificationController,
                                                initialValue: debtCon
                                                    .taxIdentificationNumber
                                                    .value,
                                                labelText:
                                                    'Tax Identification Number (TIN)',
                                                hintText:
                                                    'Tax Identification Number (TIN)',
                                                onChange: (value) {
                                                  if (value.isEmpty) {
                                                    debtCon
                                                        .taxIdentificationNumber
                                                        .value = '';
                                                    setState(() {
                                                      tempData.taxIdentificationNumber =
                                                          "";
                                                    });
                                                  } else {
                                                    debtCon
                                                        .taxIdentificationNumber
                                                        .value = value;
                                                    setState(() {
                                                      tempData.taxIdentificationNumber =
                                                          debtCon
                                                              .taxIdentificationNumber
                                                              .value;
                                                    });
                                                  }
                                                },
                                              ),
                                              CICDropdown(
                                                onCreateCompany: () {
                                                  Navigator.pop(context);

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
                                                        debtCon.industry.value
                                                                .display =
                                                            addNewOtherIndustry
                                                                .text;
                                                        if (addNewOtherIndustry
                                                                .text !=
                                                            "") {
                                                          debtCon.industry.value
                                                              .id = null;
                                                        }
                                                      });
                                                      Navigator.pop(context);
                                                    },
                                                    context: context,
                                                    textFieldHere:
                                                        CustomTextFieldNew(
                                                      controller:
                                                          addNewOtherIndustry,
                                                      initialValue: "",
                                                      hintText: 'Industry',
                                                      labelText: 'Industry',
                                                    ),
                                                  );
                                                },
                                                isCompany: true,
                                                otherLabel: "Add Other",
                                                colors: Colors.white,
                                                isValidate:
                                                    debtCon.isValIndustry.value,
                                                item:
                                                    // listIndustryTest
                                                    optionCon.optionData.value
                                                        .industry!
                                                        .asMap()
                                                        .entries
                                                        .map((e) {
                                                  return DropDownItem(
                                                    itemList: {
                                                      "Name": e.value.display!,
                                                      "Code":
                                                          e.value.id.toString()
                                                    },
                                                  );
                                                }).toList(),
                                                onChange: (v) {
                                                  debtCon.industry.value =
                                                      Optionmodel(
                                                    display: v["Name"],
                                                    id: int.parse(
                                                      v["Code"],
                                                    ),
                                                  );
                                                  setState(() {
                                                    tempData.industry =
                                                        debtCon.industry.value;
                                                  });

                                                  debtCon.isValIndustry.value =
                                                      true;
                                                },
                                                label: 'Industry',
                                                defaultValue: debtCon
                                                                .industry
                                                                .value
                                                                .display !=
                                                            null &&
                                                        debtCon.industry.value
                                                                .display!
                                                                .toLowerCase() !=
                                                            'null'
                                                    ? {
                                                        "Name": debtCon.industry
                                                            .value.display,
                                                        "Code": debtCon
                                                            .industry.value.id
                                                      }
                                                    : null,
                                              ),
                                              const SizedBox(height: 10),
                                              CustomTextFieldNew(
                                                textInputAction:
                                                    TextInputAction.next,
                                                maxLine: 1,
                                                isRequired: true,
                                                isValidate: debtCon
                                                    .isValNumberOfStaff.value,
                                                labelText: 'Number Of Staff',
                                                hintText: 'Number Of Staff',
                                                onChange: (valueChanged) {
                                                  String value = valueChanged
                                                      .replaceAll(',', '');
                                                  if (value == '') {
                                                    debtCon.isValNumberOfStaff
                                                        .value = false;
                                                    setState(() {
                                                      tempData.numberOfStaff =
                                                          "0";
                                                    });
                                                    // debtCon.isValNumberOfStaff
                                                    //     .value = false;
                                                    debtCon.numberOfStaff
                                                        .value = '';
                                                  } else {
                                                    debtCon.isValNumberOfStaff
                                                        .value = true;
                                                    debtCon.numberOfStaff
                                                        .value = value;
                                                    setState(() {
                                                      tempData.numberOfStaff =
                                                          value;
                                                    });
                                                  }
                                                },
                                                controller: debtCon
                                                    .numberofStaffController,
                                                initialValue: debtCon
                                                            .numberOfStaff
                                                            .value ==
                                                        "0"
                                                    ? ""
                                                    : debtCon
                                                        .numberOfStaff.value,
                                                keyboardType:
                                                    TextInputType.number,
                                                inputFormatterList: [
                                                  FilteringTextInputFormatter
                                                      .digitsOnly,
                                                  FilteringTextInputFormatter
                                                      .deny(RegExp(r'^0+')),
                                                  NumericTextFormatter()
                                                ],
                                              ),
                                              CustomTextFieldNew(
                                                textInputAction:
                                                    TextInputAction.next,
                                                maxLine: 1,
                                                isRequired: true,
                                                isValidate: debtCon
                                                    .isValOwnerName.value,
                                                labelText: 'Owner Name',
                                                hintText: 'Owner Name',
                                                onChange: (value) {
                                                  if (value.isEmpty) {
                                                    debtCon.isValOwnerName
                                                        .value = false;
                                                    debtCon.ownerName.value =
                                                        '';
                                                    setState(() {
                                                      tempData.ownerName = "";
                                                    });
                                                  } else {
                                                    debtCon.isValOwnerName
                                                        .value = true;
                                                    debtCon.ownerName.value =
                                                        value;
                                                    setState(() {
                                                      tempData.ownerName =
                                                          debtCon
                                                              .ownerName.value;
                                                    });
                                                  }
                                                },
                                                controller:
                                                    debtCon.ownernameController,
                                                initialValue:
                                                    debtCon.ownerName.value,
                                              ),
                                              CustomTextFieldNew(
                                                isRequired: true,
                                                controller:
                                                    debtCon.productController,
                                                isValidate: debtCon
                                                    .isValProductService.value,
                                                labelText: 'Product / Service',
                                                hintText: 'Product / Service',
                                                onChange: (value) {
                                                  if (value.isEmpty) {
                                                    debtCon.isValProductService
                                                        .value = false;
                                                    debtCon.productSevice
                                                        .value = '';
                                                    setState(() {
                                                      tempData.productSevice =
                                                          "";
                                                    });
                                                  } else {
                                                    debtCon.isValProductService
                                                        .value = true;
                                                    debtCon.productSevice
                                                        .value = value;
                                                    setState(() {
                                                      tempData.productSevice =
                                                          value;
                                                    });
                                                  }
                                                },
                                                initialValue:
                                                    debtCon.productSevice.value,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20,
                                                        vertical: 20),
                                                child: Text(
                                                  'Which of the following legal documents that you have? (Multiple selections)',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText2!
                                                      .copyWith(
                                                        fontFamily: 'DMSans',
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 20,
                                                  right: 20,
                                                ),
                                                child: Column(
                                                  children: [
                                                    CustomSelect2GetFunding(
                                                      isMultipleSelect: true,
                                                      title:
                                                          'Company’s Patent Document',
                                                      isSelect: debtCon
                                                          .isPatentDoc.value,
                                                      ontap: () {
                                                        debtCon.isPatentDoc
                                                                .value =
                                                            !debtCon.isPatentDoc
                                                                .value;
                                                        if (debtCon.isPatentDoc
                                                            .value) {
                                                          debtCon.patentDocument
                                                              .value = 1;
                                                          tempData.patentDoc =
                                                              1;
                                                        } else {
                                                          debtCon.patentDocument
                                                              .value = 0;
                                                          tempData.patentDoc =
                                                              0;
                                                        }
                                                      },
                                                    ),
                                                    const SizedBox(
                                                      height: 15,
                                                    ),
                                                    CustomSelect2GetFunding(
                                                      isMultipleSelect: true,
                                                      title:
                                                          'Company’s MOC Certificate',
                                                      isSelect: debtCon
                                                          .isCertificate.value,
                                                      ontap: () {
                                                        debtCon.isCertificate
                                                                .value =
                                                            !debtCon
                                                                .isCertificate
                                                                .value;
                                                        if (debtCon
                                                            .isCertificate
                                                            .value) {
                                                          debtCon
                                                              .certificatioDoc
                                                              .value = 1;
                                                          tempData
                                                              .mocCertificate = 1;
                                                        } else {
                                                          debtCon
                                                              .certificatioDoc
                                                              .value = 0;
                                                          tempData
                                                              .mocCertificate = 0;
                                                        }
                                                      },
                                                    ),
                                                    const SizedBox(
                                                      height: 15,
                                                    ),
                                                    CustomSelect2GetFunding(
                                                      isMultipleSelect: true,
                                                      title:
                                                          'Company’s License Document',
                                                      isSelect: debtCon
                                                          .isLicense.value,
                                                      ontap: () {
                                                        debtCon.isLicense
                                                                .value =
                                                            !debtCon.isLicense
                                                                .value;
                                                        if (debtCon
                                                            .isLicense.value) {
                                                          debtCon.licenseDoc
                                                              .value = 1;
                                                          tempData.licenceDoc =
                                                              1;
                                                        } else {
                                                          debtCon.licenseDoc
                                                              .value = 0;
                                                          tempData.licenceDoc =
                                                              0;
                                                        }
                                                      },
                                                    ),
                                                    const SizedBox(
                                                      height: 15,
                                                    ),
                                                    CustomSelect2GetFunding(
                                                      isMultipleSelect: true,
                                                      title:
                                                          'Company’s Memorandum And Article Of \n Association',
                                                      isSelect: debtCon
                                                          .isMemorandum.value,
                                                      ontap: () {
                                                        debtCon.isMemorandum
                                                                .value =
                                                            !debtCon
                                                                .isMemorandum
                                                                .value;

                                                        if (debtCon.isMemorandum
                                                            .value) {
                                                          debtCon.memorandumDoc
                                                              .value = 1;
                                                          tempData.memorandum =
                                                              1;
                                                        } else {
                                                          debtCon.memorandumDoc
                                                              .value = 0;
                                                          tempData.memorandum =
                                                              0;
                                                        }
                                                      },
                                                    ),
                                                    const SizedBox(
                                                      height: 15,
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
                                      left: 20, right: 20, bottom: 30, top: 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: CustomButton(
                                          isDisable: tempData == defaultData &&
                                                  tempData.memorandum ==
                                                      defaultData.memorandum &&
                                                  debtCon.memorandumDoc.value ==
                                                      debtCon
                                                          .memorandumDoc.value &&
                                                  addNewOtherIndustry.text ==
                                                      "" &&
                                                  addNewOtherType.text == ""
                                              ? true
                                              : debtCon.companyName.value == "" &&
                                                      debtCon.address.value ==
                                                          "" &&
                                                      debtCon.yearOfEstablishment
                                                              .value ==
                                                          "" &&
                                                      debtCon
                                                              .typeOfOrganization
                                                              .value
                                                              .display ==
                                                          null &&
                                                      debtCon
                                                              .taxIdentificationNumber
                                                              .value ==
                                                          "" &&
                                                      debtCon.industry.value
                                                              .display ==
                                                          null &&
                                                      debtCon.numberOfStaff
                                                              .value ==
                                                          "0" &&
                                                      debtCon.ownerName.value ==
                                                          "" &&
                                                      debtCon.productSevice
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
                                                      "Debt Update Draft Step3");
                                            } else {
                                              FirebaseAnalyticsHelper
                                                  .sendAnalyticsEvent(
                                                      "Debt Save Draft Step3");
                                            }
                                            widget.id != null
                                                ? await debtCon
                                                    .onEditDebtInvestment(
                                                        showDebtSnackbar: false,
                                                        id: widget.id,
                                                        frompage: debtCon
                                                            .applicationDetail
                                                            .value
                                                            .step!
                                                            .toInt(),
                                                        context: context,
                                                        step: 3)
                                                : await debtCon
                                                    .onSubmitDebtInvestment(
                                                        showDebtSnackbar: false,
                                                        context: context,
                                                        step: 3);
                                          },
                                          title: widget.id != null
                                              ? "Update Draft"
                                              : "Save Draft",
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      Expanded(
                                        child: CustomButton(
                                          isDisable: false,
                                          isOutline: false,
                                          onPressed: _onValidate,
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
