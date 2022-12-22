import 'dart:io';
import 'package:cicgreenloan/Utils/helper/numerice_format.dart';
import 'package:cicgreenloan/modules/get_funding/models/equatable_debt_model.dart';
import 'package:cicgreenloan/Utils/helper/option_model/option_model.dart';
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
import '../../../../Utils/helper/injection_helper/injection_helper.dart';
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
  var defaultData = DebtStep3Model();
  var tempData = DebtStep3Model();
  int? currentIndex;
  void _onValidate() {
    if (InjectionHelper.debtInvestmentController.companyName.value == "") {
      InjectionHelper.debtInvestmentController.isValCompanyName.value = false;
    } else {
      InjectionHelper.debtInvestmentController.isValCompanyName.value = true;
    }

    if (InjectionHelper.debtInvestmentController.address.value == '') {
      InjectionHelper.debtInvestmentController.isValAddress.value = false;
    } else {
      InjectionHelper.debtInvestmentController.isValAddress.value = true;
    }

    if (InjectionHelper.debtInvestmentController.yearOfEstablishment.value ==
        '') {
      InjectionHelper.debtInvestmentController.isValYearOfEstablishment.value =
          false;
    } else {
      InjectionHelper.debtInvestmentController.isValYearOfEstablishment.value =
          true;
    }

    if (InjectionHelper
            .debtInvestmentController.typeOfOrganization.value.display ==
        null) {
      InjectionHelper.debtInvestmentController.isValTypeOfOrganization.value =
          false;
    } else {
      InjectionHelper.debtInvestmentController.isValTypeOfOrganization.value =
          true;
    }

    if (InjectionHelper.debtInvestmentController.industry.value.display ==
        null) {
      InjectionHelper.debtInvestmentController.isValIndustry.value = false;
    } else {
      InjectionHelper.debtInvestmentController.isValIndustry.value = true;
    }

    if (InjectionHelper.debtInvestmentController.numberOfStaff.value == '') {
      InjectionHelper.debtInvestmentController.isValNumberOfStaff.value = false;
      InjectionHelper.debtInvestmentController.update();
    } else {
      InjectionHelper.debtInvestmentController.isValNumberOfStaff.value = true;
      InjectionHelper.debtInvestmentController.update();
    }

    if (InjectionHelper.debtInvestmentController.ownerName.value == '') {
      InjectionHelper.debtInvestmentController.isValOwnerName.value = false;
    } else {
      InjectionHelper.debtInvestmentController.isValOwnerName.value = true;
    }

    if (InjectionHelper.debtInvestmentController.productSevice.value == '') {
      InjectionHelper.debtInvestmentController.isValProductService.value =
          false;
    } else {
      InjectionHelper.debtInvestmentController.isValProductService.value = true;
    }
    if (InjectionHelper.debtInvestmentController.companyName.value != "" &&
        InjectionHelper.debtInvestmentController.address.value != "" &&
        InjectionHelper.debtInvestmentController.yearOfEstablishment.value !=
            "" &&
        InjectionHelper
                .debtInvestmentController.typeOfOrganization.value.display !=
            null &&
        InjectionHelper.debtInvestmentController.industry.value.display !=
            null &&
        InjectionHelper.debtInvestmentController.numberOfStaff.value != "" &&
        InjectionHelper.debtInvestmentController.ownerName.value != "" &&
        InjectionHelper.debtInvestmentController.productSevice.value != "") {
      FocusScope.of(context).unfocus();
      context
          .push("/get_funding/debt-step4?id=${widget.id}&&step=${widget.step}");
    }
  }

  @override
  void initState() {
    InjectionHelper.memberController.fetchCompanyMember(
        id: InjectionHelper.customerController.customer.value.customerId);
    super.initState();
    if (InjectionHelper.memberController.companyDataList.isNotEmpty) {
      InjectionHelper.memberController.addCompany.value = false;
    }
    InjectionHelper.debtInvestmentController.productController.value;
    InjectionHelper.debtInvestmentController.addresscontroller.value;
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
                    id: value.company!.typeOfOrganization!.id,
                    display: value.company!.typeOfOrganization!.display)
                : Optionmodel(id: 0, display: null);

        InjectionHelper.debtInvestmentController.taxIdentificationNumber.value =
            value.company!.taxIdentificationNumber!;
        InjectionHelper.debtInvestmentController.taxindentificationController
            .text = value.company!.taxIdentificationNumber!;

        InjectionHelper.debtInvestmentController.industry.value =
            value.company!.industry != null
                ? Optionmodel(
                    id: value.company!.industry!.id,
                    display: value.company!.industry!.display)
                : Optionmodel(id: 0, display: null);
        InjectionHelper
                .debtInvestmentController.typeOfOrganization.value.display ==
            value.company!.typeOfOrganization!.display;
        InjectionHelper.debtInvestmentController.industry.value.display ==
            value.company!.industry!.display;

        ///
        if (value.company!.numberOfStaff != null &&
            value.company!.numberOfStaff != 0) {
          var displaynumberOfStaff =
              FormatNumber.formatNumberDefualt(value.company!.numberOfStaff!);
          InjectionHelper.debtInvestmentController.numberofStaffController
              .text = displaynumberOfStaff.toString();
        } else {
          InjectionHelper
              .debtInvestmentController.numberofStaffController.text = '';
        }

        ///
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

        if (value.companyPatentDoc == 1) {
          InjectionHelper.debtInvestmentController.isPatentDoc.value = true;
        } else {
          InjectionHelper.debtInvestmentController.isPatentDoc.value = false;
        }
        if (value.companyMoCCertificate == 1) {
          InjectionHelper.debtInvestmentController.isCertificate.value = true;
        } else {
          InjectionHelper.debtInvestmentController.isCertificate.value = false;
        }
        if (value.companyLicenceDoc == 1) {
          InjectionHelper.debtInvestmentController.isLicense.value = true;
        } else {
          InjectionHelper.debtInvestmentController.isLicense.value = false;
        }
        if (value.companyMAA == 1) {
          InjectionHelper.debtInvestmentController.isMemorandum.value = true;
        } else {
          InjectionHelper.debtInvestmentController.isMemorandum.value = false;
        }

        defaultData = DebtStep3Model(
          companyName:
              InjectionHelper.debtInvestmentController.companyName.value,
          address: InjectionHelper.debtInvestmentController.address.value,
          yearOfEstablishment: InjectionHelper
              .debtInvestmentController.yearOfEstablishment.value,
          typeOfOrganization:
              InjectionHelper.debtInvestmentController.typeOfOrganization.value,
          taxIdentificationNumber: InjectionHelper
              .debtInvestmentController.taxIdentificationNumber.value,
          industry: InjectionHelper.debtInvestmentController.industry.value,
          numberOfStaff:
              InjectionHelper.debtInvestmentController.numberOfStaff.value,
          ownerName: InjectionHelper.debtInvestmentController.ownerName.value,
          productSevice:
              InjectionHelper.debtInvestmentController.productSevice.value,
          patentDoc:
              InjectionHelper.debtInvestmentController.patentDocument.value,
          licenceDoc: InjectionHelper.debtInvestmentController.licenseDoc.value,
          mocCertificate:
              InjectionHelper.debtInvestmentController.certificatioDoc.value,
          memorandum:
              InjectionHelper.debtInvestmentController.memorandumDoc.value,
        );
        tempData = DebtStep3Model(
          companyName:
              InjectionHelper.debtInvestmentController.companyName.value,
          address: InjectionHelper.debtInvestmentController.address.value,
          yearOfEstablishment: InjectionHelper
              .debtInvestmentController.yearOfEstablishment.value,
          typeOfOrganization:
              InjectionHelper.debtInvestmentController.typeOfOrganization.value,
          taxIdentificationNumber: InjectionHelper
              .debtInvestmentController.taxIdentificationNumber.value,
          industry: InjectionHelper.debtInvestmentController.industry.value,
          numberOfStaff:
              InjectionHelper.debtInvestmentController.numberOfStaff.value,
          ownerName: InjectionHelper.debtInvestmentController.ownerName.value,
          productSevice:
              InjectionHelper.debtInvestmentController.productSevice.value,
          patentDoc:
              InjectionHelper.debtInvestmentController.patentDocument.value,
          licenceDoc: InjectionHelper.debtInvestmentController.licenseDoc.value,
          mocCertificate:
              InjectionHelper.debtInvestmentController.certificatioDoc.value,
          memorandum:
              InjectionHelper.debtInvestmentController.memorandumDoc.value,
        );
      });
    }
  }

  setValidate() {
    InjectionHelper.debtInvestmentController.isValCompanyName.value = true;
    InjectionHelper.debtInvestmentController.isValAddress.value = true;
    InjectionHelper.debtInvestmentController.isValYearOfEstablishment.value =
        true;
    InjectionHelper.debtInvestmentController.isValTypeOfOrganization.value =
        true;
    InjectionHelper.debtInvestmentController.isValIndustry.value = true;
    InjectionHelper.debtInvestmentController.isValNumberOfStaff.value = true;
    InjectionHelper.debtInvestmentController.isValOwnerName.value = true;
    InjectionHelper.debtInvestmentController.isValProductService.value = true;
  }

  onResetCompany() {
    InjectionHelper.debtInvestmentController.companyName.value = "";
    InjectionHelper.debtInvestmentController.address.value = "";
    InjectionHelper.debtInvestmentController.yearOfEstablishment.value = "";
    InjectionHelper.debtInvestmentController.typeOfOrganization.value =
        Optionmodel(display: null, id: 0);
    InjectionHelper.debtInvestmentController.taxIdentificationNumber.value = "";
    InjectionHelper.debtInvestmentController.industry.value = Optionmodel(
      display: null,
      id: 0,
    );
    InjectionHelper.debtInvestmentController.numberOfStaff.value = "0";
    InjectionHelper.debtInvestmentController.ownerName.value = "";
    InjectionHelper.debtInvestmentController.productSevice.value = "";
    InjectionHelper.debtInvestmentController.addresscontroller.text = "";
    InjectionHelper
        .debtInvestmentController.yearofestablistmentController.text = "";
    InjectionHelper.debtInvestmentController.ownernameController.text = "";
    InjectionHelper.debtInvestmentController.productController.text = "";
    InjectionHelper.debtInvestmentController.numberofStaffController.text = "";
    InjectionHelper.debtInvestmentController.taxindentificationController.text =
        "";

    InjectionHelper.debtInvestmentController.isPatentDoc.value = false;
    InjectionHelper.debtInvestmentController.isCertificate.value = false;
    InjectionHelper.debtInvestmentController.isMemorandum.value = false;
    InjectionHelper.debtInvestmentController.isLicense.value = false;

    InjectionHelper.debtInvestmentController.patentDocument.value = 0;
    InjectionHelper.debtInvestmentController.certificatioDoc.value = 0;
    InjectionHelper.debtInvestmentController.licenseDoc.value = 0;
    InjectionHelper.debtInvestmentController.memorandumDoc.value = 0;
  }

  TextEditingController addNewOtherType = TextEditingController();
  TextEditingController addNewOtherIndustry = TextEditingController();

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
                              onPressed:
                                  tempData == defaultData &&
                                          InjectionHelper
                                                  .debtInvestmentController
                                                  .companyName
                                                  .value ==
                                              "" &&
                                          InjectionHelper
                                                  .debtInvestmentController
                                                  .address
                                                  .value ==
                                              "" &&
                                          InjectionHelper
                                                  .debtInvestmentController
                                                  .yearOfEstablishment
                                                  .value ==
                                              "" &&
                                          InjectionHelper
                                                  .debtInvestmentController
                                                  .typeOfOrganization
                                                  .value
                                                  .display ==
                                              null &&
                                          InjectionHelper
                                                  .debtInvestmentController
                                                  .taxIdentificationNumber
                                                  .value ==
                                              "" &&
                                          InjectionHelper
                                                  .debtInvestmentController
                                                  .industry
                                                  .value
                                                  .display ==
                                              null &&
                                          InjectionHelper
                                                  .debtInvestmentController
                                                  .numberOfStaff
                                                  .value ==
                                              "0" &&
                                          InjectionHelper
                                                  .debtInvestmentController
                                                  .ownerName
                                                  .value ==
                                              "" &&
                                          InjectionHelper
                                                  .debtInvestmentController
                                                  .productSevice
                                                  .value ==
                                              ""
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
                                                      await InjectionHelper
                                                          .debtInvestmentController
                                                          .onEditDebtInvestment(
                                                              id: widget.id,
                                                              context: context,
                                                              frompage: InjectionHelper
                                                                  .debtInvestmentController
                                                                  .applicationDetail
                                                                  .value
                                                                  .step!
                                                                  .toInt(),
                                                              step: 3);
                                                    }
                                                  : () async {
                                                      Navigator.pop(context);
                                                      await InjectionHelper
                                                          .debtInvestmentController
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
                      () => InjectionHelper
                              .debtInvestmentController.isLoadingData.value
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
                                              InjectionHelper
                                                          .memberController
                                                          .companyDataList
                                                          .isNotEmpty &&
                                                      InjectionHelper
                                                              .memberController
                                                              .addCompany
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

                                                          InjectionHelper
                                                              .memberController
                                                              .addCompany
                                                              .value = true;
                                                          InjectionHelper
                                                              .memberController
                                                              .addCompany
                                                              .refresh();
                                                          InjectionHelper
                                                              .memberController
                                                              .update();

                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        isCompany: true,
                                                        isValidate: InjectionHelper
                                                            .debtInvestmentController
                                                            .isValCompanyName
                                                            .value,
                                                        item: InjectionHelper
                                                            .memberController
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
                                                          InjectionHelper
                                                              .debtInvestmentController
                                                              .companyName
                                                              .value = v["Name"];

                                                          setState(() {
                                                            tempData.companyName =
                                                                InjectionHelper
                                                                    .debtInvestmentController
                                                                    .companyName
                                                                    .value;
                                                          });

                                                          InjectionHelper
                                                              .debtInvestmentController
                                                              .address
                                                              .value = v["Address"];

                                                          InjectionHelper
                                                              .debtInvestmentController
                                                              .addresscontroller
                                                              .text = v["Address"];

                                                          v["patent"]
                                                              .map((e) =>
                                                                  InjectionHelper
                                                                      .debtInvestmentController
                                                                      .patentDoc
                                                                      .add(e
                                                                          .url))
                                                              .toList();
                                                          v["licence"]
                                                              .map((e) =>
                                                                  InjectionHelper
                                                                      .debtInvestmentController
                                                                      .licenceDoc
                                                                      .add(e
                                                                          .url))
                                                              .toList();
                                                          v["moc"]
                                                              .map((e) => InjectionHelper
                                                                  .debtInvestmentController
                                                                  .mocCertificate
                                                                  .add(e.url))
                                                              .toList();

                                                          ///Disable File +++
                                                          InjectionHelper
                                                              .debtInvestmentController
                                                              .yearOfEstablishment
                                                              .value = v['Year'];
                                                          InjectionHelper
                                                              .debtInvestmentController
                                                              .yearofestablistmentController
                                                              .text = v['Year'];
                                                          InjectionHelper
                                                                  .debtInvestmentController
                                                                  .ownerName
                                                                  .value =
                                                              v['OwnerName'];
                                                          InjectionHelper
                                                              .debtInvestmentController
                                                              .ownernameController
                                                              .text = v['OwnerName'];
                                                          v['NumberOfStaff'] ==
                                                                  ''
                                                              ? InjectionHelper
                                                                  .debtInvestmentController
                                                                  .numberOfStaff
                                                                  .value = ''
                                                              : InjectionHelper
                                                                      .debtInvestmentController
                                                                      .numberOfStaff
                                                                      .value =
                                                                  v['NumberOfStaff'];

                                                          ///
                                                          if (v['NumberOfStaff'] ==
                                                              '') {
                                                            InjectionHelper
                                                                .debtInvestmentController
                                                                .numberofStaffController
                                                                .text = '';
                                                          } else {
                                                            var displaynumberstaff =
                                                                FormatNumber
                                                                    .formatNumberDefualt(
                                                                        int.parse(
                                                                            v['NumberOfStaff']));
                                                            InjectionHelper
                                                                    .debtInvestmentController
                                                                    .numberofStaffController
                                                                    .text =
                                                                displaynumberstaff
                                                                    .toString();
                                                          }

                                                          ///
                                                          InjectionHelper
                                                                  .debtInvestmentController
                                                                  .typeOfOrganization
                                                                  .value =
                                                              Optionmodel(
                                                                  id: int.parse(v[
                                                                      'Typeid']),
                                                                  display: v[
                                                                      'TypeDis']);
                                                          InjectionHelper
                                                                  .debtInvestmentController
                                                                  .industry
                                                                  .value =
                                                              Optionmodel(
                                                                  id: int.parse(v[
                                                                      'Industryid']),
                                                                  display: v[
                                                                      'IndustryDis']);
                                                          InjectionHelper
                                                              .debtInvestmentController
                                                              .taxindentificationController
                                                              .text = v['Tax'];
                                                          InjectionHelper
                                                              .debtInvestmentController
                                                              .taxIdentificationNumber
                                                              .value = v['Tax'];
                                                          InjectionHelper
                                                              .debtInvestmentController
                                                              .companyIndex
                                                              .value = v['Code'];

                                                          InjectionHelper
                                                              .debtInvestmentController
                                                              .productSevice
                                                              .value = v["Product"];
                                                          InjectionHelper
                                                              .debtInvestmentController
                                                              .productController
                                                              .text = v["Product"];

                                                          InjectionHelper
                                                              .debtInvestmentController
                                                              .isValProductService
                                                              .value = true;
                                                          InjectionHelper
                                                              .debtInvestmentController
                                                              .isValCompanyName
                                                              .value = true;
                                                          InjectionHelper
                                                              .debtInvestmentController
                                                              .isValAddress
                                                              .value = true;
                                                          InjectionHelper
                                                              .debtInvestmentController
                                                              .isValYearOfEstablishment
                                                              .value = true;
                                                          InjectionHelper
                                                              .debtInvestmentController
                                                              .isValTypeOfOrganization
                                                              .value = true;
                                                          InjectionHelper
                                                              .debtInvestmentController
                                                              .isValIndustry
                                                              .value = true;
                                                          InjectionHelper
                                                              .debtInvestmentController
                                                              .isValNumberOfStaff
                                                              .value = true;
                                                          InjectionHelper
                                                              .debtInvestmentController
                                                              .isValOwnerName
                                                              .value = true;
                                                        },
                                                        label: 'Company Name',
                                                        defaultValue: InjectionHelper
                                                                    .debtInvestmentController
                                                                    .companyName
                                                                    .value !=
                                                                ''
                                                            ? {
                                                                "Name": InjectionHelper
                                                                    .debtInvestmentController
                                                                    .companyName
                                                                    .value,
                                                                "Code": InjectionHelper
                                                                    .debtInvestmentController
                                                                    .companyIndex
                                                                    .value
                                                              }
                                                            : null,
                                                      ),
                                                    )
                                                  : InjectionHelper
                                                              .memberController
                                                              .addCompany
                                                              .value ==
                                                          true
                                                      ? CustomTextFieldNew(
                                                          autoFocus:
                                                              InjectionHelper
                                                                  .memberController
                                                                  .addCompany
                                                                  .value,
                                                          textInputAction:
                                                              TextInputAction
                                                                  .next,
                                                          maxLine: 1,
                                                          isRequired: true,
                                                          isValidate: InjectionHelper
                                                              .debtInvestmentController
                                                              .isValCompanyName
                                                              .value,
                                                          //===
                                                          labelText:
                                                              'Company Name',
                                                          hintText:
                                                              'Company Name',
                                                          onChange: (value) {
                                                            InjectionHelper
                                                                .debtInvestmentController
                                                                .isValCompanyName
                                                                .value = true;
                                                            if (value.isEmpty) {
                                                              InjectionHelper
                                                                  .debtInvestmentController
                                                                  .companyName
                                                                  .value = '';
                                                              setState(() {
                                                                tempData.companyName =
                                                                    "";
                                                              });
                                                            } else {
                                                              InjectionHelper
                                                                  .debtInvestmentController
                                                                  .companyName
                                                                  .value = value;
                                                              setState(() {
                                                                tempData.companyName =
                                                                    InjectionHelper
                                                                        .debtInvestmentController
                                                                        .companyName
                                                                        .value;
                                                              });
                                                            }
                                                          },
                                                          initialValue:
                                                              InjectionHelper
                                                                  .debtInvestmentController
                                                                  .companyName
                                                                  .value,
                                                        )
                                                      : CustomTextFieldNew(
                                                          autoFocus:
                                                              InjectionHelper
                                                                  .memberController
                                                                  .addCompany
                                                                  .value,
                                                          textInputAction:
                                                              TextInputAction
                                                                  .next,
                                                          maxLine: 1,
                                                          isRequired: true,
                                                          isValidate: InjectionHelper
                                                              .debtInvestmentController
                                                              .isValCompanyName
                                                              .value,
                                                          labelText:
                                                              'Company Name',
                                                          hintText:
                                                              'Company Name',
                                                          onChange: (value) {
                                                            InjectionHelper
                                                                .debtInvestmentController
                                                                .isValCompanyName
                                                                .value = true;
                                                            if (value.isEmpty) {
                                                              InjectionHelper
                                                                  .debtInvestmentController
                                                                  .companyName
                                                                  .value = '';
                                                              setState(() {
                                                                tempData.companyName =
                                                                    "";
                                                              });
                                                            } else {
                                                              InjectionHelper
                                                                  .debtInvestmentController
                                                                  .companyName
                                                                  .value = value;
                                                              setState(() {
                                                                tempData.companyName =
                                                                    InjectionHelper
                                                                        .debtInvestmentController
                                                                        .companyName
                                                                        .value;
                                                              });
                                                            }
                                                          },
                                                          initialValue:
                                                              InjectionHelper
                                                                  .debtInvestmentController
                                                                  .companyName
                                                                  .value,
                                                        ),
                                              const SizedBox(height: 5),
                                              CustomTextFieldNew(
                                                textInputAction:
                                                    TextInputAction.next,
                                                maxLine: 1,
                                                controller: InjectionHelper
                                                    .debtInvestmentController
                                                    .addresscontroller,
                                                isRequired: true,
                                                isValidate: InjectionHelper
                                                    .debtInvestmentController
                                                    .isValAddress
                                                    .value,
                                                labelText: 'Address',
                                                hintText: 'Address',
                                                onChange: (value) {
                                                  if (value.isEmpty) {
                                                    InjectionHelper
                                                        .debtInvestmentController
                                                        .isValAddress
                                                        .value = false;
                                                    InjectionHelper
                                                        .debtInvestmentController
                                                        .address
                                                        .value = '';
                                                    setState(() {
                                                      tempData.address = "";
                                                    });
                                                  } else {
                                                    InjectionHelper
                                                        .debtInvestmentController
                                                        .isValAddress
                                                        .value = true;
                                                    InjectionHelper
                                                        .debtInvestmentController
                                                        .address
                                                        .value = value;
                                                    setState(() {
                                                      tempData.address =
                                                          InjectionHelper
                                                              .debtInvestmentController
                                                              .address
                                                              .value;
                                                    });
                                                  }
                                                },
                                                initialValue: InjectionHelper
                                                    .debtInvestmentController
                                                    .address
                                                    .value,
                                              ),
                                              CustomTextFieldNew(
                                                textInputAction:
                                                    TextInputAction.next,
                                                maxLine: 1,
                                                maxlenght: 4,
                                                isRequired: true,
                                                isValidate: InjectionHelper
                                                    .debtInvestmentController
                                                    .isValYearOfEstablishment
                                                    .value,
                                                labelText:
                                                    'Year Of Establishment',
                                                hintText:
                                                    'Year Of Establishment',
                                                onChange: (value) {
                                                  if (value.isEmpty) {
                                                    InjectionHelper
                                                        .debtInvestmentController
                                                        .isValYearOfEstablishment
                                                        .value = false;
                                                    InjectionHelper
                                                        .debtInvestmentController
                                                        .yearOfEstablishment
                                                        .value = '';
                                                    setState(() {
                                                      tempData.yearOfEstablishment =
                                                          "";
                                                    });
                                                  } else {
                                                    InjectionHelper
                                                        .debtInvestmentController
                                                        .isValYearOfEstablishment
                                                        .value = true;
                                                    InjectionHelper
                                                        .debtInvestmentController
                                                        .yearOfEstablishment
                                                        .value = value;
                                                    setState(() {
                                                      tempData.yearOfEstablishment =
                                                          InjectionHelper
                                                              .debtInvestmentController
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
                                                controller: InjectionHelper
                                                    .debtInvestmentController
                                                    .yearofestablistmentController,
                                                initialValue: InjectionHelper
                                                    .debtInvestmentController
                                                    .yearOfEstablishment
                                                    .value,
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
                                                        InjectionHelper
                                                                .debtInvestmentController
                                                                .typeOfOrganization
                                                                .value
                                                                .display =
                                                            addNewOtherType
                                                                .text;
                                                        if (addNewOtherType
                                                                .text !=
                                                            "") {
                                                          InjectionHelper
                                                              .debtInvestmentController
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
                                                isValidate: InjectionHelper
                                                    .debtInvestmentController
                                                    .isValTypeOfOrganization
                                                    .value,
                                                item: InjectionHelper
                                                    .optionController
                                                    .optionData
                                                    .value
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
                                                  InjectionHelper
                                                      .debtInvestmentController
                                                      .typeOfOrganization
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

                                                  InjectionHelper
                                                      .debtInvestmentController
                                                      .isValTypeOfOrganization
                                                      .value = true;
                                                },
                                                label: 'Type Of Organization',
                                                defaultValue: InjectionHelper
                                                                .debtInvestmentController
                                                                .typeOfOrganization
                                                                .value
                                                                .display !=
                                                            null &&
                                                        InjectionHelper
                                                                .debtInvestmentController
                                                                .typeOfOrganization
                                                                .value
                                                                .display !=
                                                            '' &&
                                                        InjectionHelper
                                                                .debtInvestmentController
                                                                .typeOfOrganization
                                                                .value
                                                                .display!
                                                                .toLowerCase() !=
                                                            'null'
                                                    ? {
                                                        "Name": InjectionHelper
                                                            .debtInvestmentController
                                                            .typeOfOrganization
                                                            .value
                                                            .display,
                                                        "Code": InjectionHelper
                                                            .debtInvestmentController
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
                                                controller: InjectionHelper
                                                    .debtInvestmentController
                                                    .taxindentificationController,
                                                initialValue: InjectionHelper
                                                    .debtInvestmentController
                                                    .taxIdentificationNumber
                                                    .value,
                                                labelText:
                                                    'Tax Identification Number (TIN)',
                                                hintText:
                                                    'Tax Identification Number (TIN)',
                                                onChange: (value) {
                                                  if (value.isEmpty) {
                                                    InjectionHelper
                                                        .debtInvestmentController
                                                        .taxIdentificationNumber
                                                        .value = '';
                                                    setState(() {
                                                      tempData.taxIdentificationNumber =
                                                          "";
                                                    });
                                                  } else {
                                                    InjectionHelper
                                                        .debtInvestmentController
                                                        .taxIdentificationNumber
                                                        .value = value;
                                                    setState(() {
                                                      tempData.taxIdentificationNumber =
                                                          InjectionHelper
                                                              .debtInvestmentController
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
                                                        InjectionHelper
                                                                .debtInvestmentController
                                                                .industry
                                                                .value
                                                                .display =
                                                            addNewOtherIndustry
                                                                .text;
                                                        if (addNewOtherIndustry
                                                                .text !=
                                                            "") {
                                                          InjectionHelper
                                                              .debtInvestmentController
                                                              .industry
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
                                                isValidate: InjectionHelper
                                                    .debtInvestmentController
                                                    .isValIndustry
                                                    .value,
                                                item:
                                                    // listIndustryTest
                                                    InjectionHelper
                                                        .optionController
                                                        .optionData
                                                        .value
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
                                                  InjectionHelper
                                                      .debtInvestmentController
                                                      .industry
                                                      .value = Optionmodel(
                                                    display: v["Name"],
                                                    id: int.parse(
                                                      v["Code"],
                                                    ),
                                                  );
                                                  setState(() {
                                                    tempData.industry =
                                                        InjectionHelper
                                                            .debtInvestmentController
                                                            .industry
                                                            .value;
                                                  });

                                                  InjectionHelper
                                                      .debtInvestmentController
                                                      .isValIndustry
                                                      .value = true;
                                                },
                                                label: 'Industry',
                                                defaultValue: InjectionHelper
                                                                .debtInvestmentController
                                                                .industry
                                                                .value
                                                                .display !=
                                                            null &&
                                                        InjectionHelper
                                                                .debtInvestmentController
                                                                .industry
                                                                .value
                                                                .display !=
                                                            '' &&
                                                        InjectionHelper
                                                                .debtInvestmentController
                                                                .industry
                                                                .value
                                                                .display!
                                                                .toLowerCase() !=
                                                            'null'
                                                    ? {
                                                        "Name": InjectionHelper
                                                            .debtInvestmentController
                                                            .industry
                                                            .value
                                                            .display,
                                                        "Code": InjectionHelper
                                                            .debtInvestmentController
                                                            .industry
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
                                                isRequired: true,
                                                isValidate: InjectionHelper
                                                    .debtInvestmentController
                                                    .isValNumberOfStaff
                                                    .value,
                                                labelText: 'Number Of Staff',
                                                hintText: 'Number Of Staff',
                                                onChange: (valueChanged) {
                                                  String value = valueChanged
                                                      .replaceAll(',', '');
                                                  if (value == '') {
                                                    InjectionHelper
                                                        .debtInvestmentController
                                                        .isValNumberOfStaff
                                                        .value = false;
                                                    setState(() {
                                                      tempData.numberOfStaff =
                                                          "0";
                                                    });
                                                    // InjectionHelper.debtInvestmentController.isValNumberOfStaff
                                                    //     .value = false;
                                                    InjectionHelper
                                                        .debtInvestmentController
                                                        .numberOfStaff
                                                        .value = '';
                                                  } else {
                                                    InjectionHelper
                                                        .debtInvestmentController
                                                        .isValNumberOfStaff
                                                        .value = true;
                                                    InjectionHelper
                                                        .debtInvestmentController
                                                        .numberOfStaff
                                                        .value = value;
                                                    setState(() {
                                                      tempData.numberOfStaff =
                                                          value;
                                                    });
                                                  }
                                                },
                                                controller: InjectionHelper
                                                    .debtInvestmentController
                                                    .numberofStaffController,
                                                initialValue: InjectionHelper
                                                            .debtInvestmentController
                                                            .numberOfStaff
                                                            .value ==
                                                        "0"
                                                    ? ""
                                                    : InjectionHelper
                                                        .debtInvestmentController
                                                        .numberOfStaff
                                                        .value,
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
                                                isValidate: InjectionHelper
                                                    .debtInvestmentController
                                                    .isValOwnerName
                                                    .value,
                                                labelText: 'Owner Name',
                                                hintText: 'Owner Name',
                                                onChange: (value) {
                                                  if (value.isEmpty) {
                                                    InjectionHelper
                                                        .debtInvestmentController
                                                        .isValOwnerName
                                                        .value = false;
                                                    InjectionHelper
                                                        .debtInvestmentController
                                                        .ownerName
                                                        .value = '';
                                                    setState(() {
                                                      tempData.ownerName = "";
                                                    });
                                                  } else {
                                                    InjectionHelper
                                                        .debtInvestmentController
                                                        .isValOwnerName
                                                        .value = true;
                                                    InjectionHelper
                                                        .debtInvestmentController
                                                        .ownerName
                                                        .value = value;
                                                    setState(() {
                                                      tempData.ownerName =
                                                          InjectionHelper
                                                              .debtInvestmentController
                                                              .ownerName
                                                              .value;
                                                    });
                                                  }
                                                },
                                                controller: InjectionHelper
                                                    .debtInvestmentController
                                                    .ownernameController,
                                                initialValue: InjectionHelper
                                                    .debtInvestmentController
                                                    .ownerName
                                                    .value,
                                              ),
                                              CustomTextFieldNew(
                                                isRequired: true,
                                                controller: InjectionHelper
                                                    .debtInvestmentController
                                                    .productController,
                                                isValidate: InjectionHelper
                                                    .debtInvestmentController
                                                    .isValProductService
                                                    .value,
                                                labelText: 'Product / Service',
                                                hintText: 'Product / Service',
                                                onChange: (value) {
                                                  if (value.isEmpty) {
                                                    InjectionHelper
                                                        .debtInvestmentController
                                                        .isValProductService
                                                        .value = false;
                                                    InjectionHelper
                                                        .debtInvestmentController
                                                        .productSevice
                                                        .value = '';
                                                    setState(() {
                                                      tempData.productSevice =
                                                          "";
                                                    });
                                                  } else {
                                                    InjectionHelper
                                                        .debtInvestmentController
                                                        .isValProductService
                                                        .value = true;
                                                    InjectionHelper
                                                        .debtInvestmentController
                                                        .productSevice
                                                        .value = value;
                                                    setState(() {
                                                      tempData.productSevice =
                                                          value;
                                                    });
                                                  }
                                                },
                                                initialValue: InjectionHelper
                                                    .debtInvestmentController
                                                    .productSevice
                                                    .value,
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
                                                      isSelect: InjectionHelper
                                                          .debtInvestmentController
                                                          .isPatentDoc
                                                          .value,
                                                      ontap: () {
                                                        InjectionHelper
                                                                .debtInvestmentController
                                                                .isPatentDoc
                                                                .value =
                                                            !InjectionHelper
                                                                .debtInvestmentController
                                                                .isPatentDoc
                                                                .value;
                                                        if (InjectionHelper
                                                            .debtInvestmentController
                                                            .isPatentDoc
                                                            .value) {
                                                          InjectionHelper
                                                              .debtInvestmentController
                                                              .patentDocument
                                                              .value = 1;
                                                          tempData.patentDoc =
                                                              1;
                                                        } else {
                                                          InjectionHelper
                                                              .debtInvestmentController
                                                              .patentDocument
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
                                                      isSelect: InjectionHelper
                                                          .debtInvestmentController
                                                          .isCertificate
                                                          .value,
                                                      ontap: () {
                                                        InjectionHelper
                                                                .debtInvestmentController
                                                                .isCertificate
                                                                .value =
                                                            !InjectionHelper
                                                                .debtInvestmentController
                                                                .isCertificate
                                                                .value;
                                                        if (InjectionHelper
                                                            .debtInvestmentController
                                                            .isCertificate
                                                            .value) {
                                                          InjectionHelper
                                                              .debtInvestmentController
                                                              .certificatioDoc
                                                              .value = 1;
                                                          tempData
                                                              .mocCertificate = 1;
                                                        } else {
                                                          InjectionHelper
                                                              .debtInvestmentController
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
                                                      isSelect: InjectionHelper
                                                          .debtInvestmentController
                                                          .isLicense
                                                          .value,
                                                      ontap: () {
                                                        InjectionHelper
                                                                .debtInvestmentController
                                                                .isLicense
                                                                .value =
                                                            !InjectionHelper
                                                                .debtInvestmentController
                                                                .isLicense
                                                                .value;
                                                        if (InjectionHelper
                                                            .debtInvestmentController
                                                            .isLicense
                                                            .value) {
                                                          InjectionHelper
                                                              .debtInvestmentController
                                                              .licenseDoc
                                                              .value = 1;
                                                          tempData.licenceDoc =
                                                              1;
                                                        } else {
                                                          InjectionHelper
                                                              .debtInvestmentController
                                                              .licenseDoc
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
                                                      isSelect: InjectionHelper
                                                          .debtInvestmentController
                                                          .isMemorandum
                                                          .value,
                                                      ontap: () {
                                                        InjectionHelper
                                                                .debtInvestmentController
                                                                .isMemorandum
                                                                .value =
                                                            !InjectionHelper
                                                                .debtInvestmentController
                                                                .isMemorandum
                                                                .value;

                                                        if (InjectionHelper
                                                            .debtInvestmentController
                                                            .isMemorandum
                                                            .value) {
                                                          InjectionHelper
                                                              .debtInvestmentController
                                                              .memorandumDoc
                                                              .value = 1;
                                                          tempData.memorandum =
                                                              1;
                                                        } else {
                                                          InjectionHelper
                                                              .debtInvestmentController
                                                              .memorandumDoc
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
                                      left: 20, right: 20, bottom: 10, top: 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: CustomButton(
                                          isDisable: tempData == defaultData &&
                                                  tempData.memorandum ==
                                                      defaultData.memorandum &&
                                                  InjectionHelper
                                                          .debtInvestmentController
                                                          .memorandumDoc
                                                          .value ==
                                                      InjectionHelper
                                                          .debtInvestmentController
                                                          .memorandumDoc
                                                          .value &&
                                                  addNewOtherIndustry.text ==
                                                      "" &&
                                                  addNewOtherType.text == ""
                                              ? true
                                              : InjectionHelper.debtInvestmentController.companyName.value == "" &&
                                                      InjectionHelper.debtInvestmentController.address.value ==
                                                          "" &&
                                                      InjectionHelper
                                                              .debtInvestmentController
                                                              .yearOfEstablishment
                                                              .value ==
                                                          "" &&
                                                      InjectionHelper
                                                              .debtInvestmentController
                                                              .typeOfOrganization
                                                              .value
                                                              .display ==
                                                          null &&
                                                      InjectionHelper
                                                              .debtInvestmentController
                                                              .taxIdentificationNumber
                                                              .value ==
                                                          "" &&
                                                      InjectionHelper
                                                              .debtInvestmentController
                                                              .industry
                                                              .value
                                                              .display ==
                                                          null &&
                                                      InjectionHelper
                                                              .debtInvestmentController
                                                              .numberOfStaff
                                                              .value ==
                                                          "0" &&
                                                      InjectionHelper
                                                              .debtInvestmentController
                                                              .ownerName
                                                              .value ==
                                                          "" &&
                                                      InjectionHelper
                                                              .debtInvestmentController
                                                              .productSevice
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
                                                ? await InjectionHelper
                                                    .debtInvestmentController
                                                    .onEditDebtInvestment(
                                                        showDebtSnackbar: false,
                                                        id: widget.id,
                                                        frompage: InjectionHelper
                                                            .debtInvestmentController
                                                            .applicationDetail
                                                            .value
                                                            .step!
                                                            .toInt(),
                                                        context: context,
                                                        step: 3)
                                                : await InjectionHelper
                                                    .debtInvestmentController
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
