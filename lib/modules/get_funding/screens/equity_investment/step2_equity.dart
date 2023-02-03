import 'dart:io';
import 'package:cicgreenloan/Utils/helper/format_number.dart';
import 'package:cicgreenloan/Utils/helper/numerice_format.dart';
import 'package:cicgreenloan/modules/get_funding/models/equat_equity_model.dart';
import 'package:cicgreenloan/Utils/helper/option_model/option_model.dart';
import 'package:cicgreenloan/utils/chart/custom_circle_chart_1_3.dart';
import 'package:cicgreenloan/utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/utils/form_builder/custom_form_card.dart';
import 'package:cicgreenloan/utils/form_builder/custom_textformfield.dart';
import 'package:cicgreenloan/utils/form_builder/dropdow_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../../../Utils/form_builder/custom_drop_down.dart';
import '../../../../Utils/helper/container_partern.dart';
import '../../../../Utils/helper/custom_appbar_colorswhite.dart';

import '../../../../Utils/helper/firebase_analytics.dart';
import '../../../../Utils/helper/injection_helper/injection_helper.dart';
import '../../../../Utils/pop_up_alert/show_alert_dialog.dart';
import '../../../../widgets/get_funding/custom_add_other_label.dart';
import '../../../../widgets/get_funding/custom_call_center.dart';
import '../../../../widgets/get_funding/custom_select_2_getfunding.dart';

class Step2Equity extends StatefulWidget {
  final int? id;

  final int? step;
  const Step2Equity({Key? key, this.id, this.step}) : super(key: key);
  @override
  State<Step2Equity> createState() => _Step2EquityState();
}

class _Step2EquityState extends State<Step2Equity> {
  final addressFocus = FocusNode();
  final yearofFocus = FocusNode();
  final taxFocus = FocusNode();
  final organizationFocus = FocusNode();
  final numberofFocus = FocusNode();
  final ownernameFocus = FocusNode();
  final productFocus = FocusNode();
  var defaultData = Step2EquityModel();
  var tempData = Step2EquityModel();
  void _onpress() {
    if (InjectionHelper.equityInvestmentController.companyName.value == '') {
      InjectionHelper.equityInvestmentController.isValCompanyName.value = false;
    } else {
      InjectionHelper.equityInvestmentController.isValCompanyName.value = true;
    }

    if (InjectionHelper.equityInvestmentController.address.value == '') {
      InjectionHelper.equityInvestmentController.isValAddress.value = false;
    } else {
      InjectionHelper.equityInvestmentController.isValAddress.value = true;
    }

    if (InjectionHelper.equityInvestmentController.yearOfEstablishment.value ==
        '') {
      InjectionHelper
          .equityInvestmentController.isValYearOfEstablishment.value = false;
    } else {
      InjectionHelper
          .equityInvestmentController.isValYearOfEstablishment.value = true;
    }

    if (InjectionHelper
            .equityInvestmentController.typeOfOrganization.value.display ==
        null) {
      InjectionHelper.equityInvestmentController.isValTypeOfOrganization.value =
          false;
    } else {
      InjectionHelper.equityInvestmentController.isValTypeOfOrganization.value =
          true;
    }

    if (InjectionHelper.equityInvestmentController.industry.value.display ==
        null) {
      InjectionHelper.equityInvestmentController.isValIndustry.value = false;
    } else {
      InjectionHelper.equityInvestmentController.isValIndustry.value = true;
    }

    if (InjectionHelper.equityInvestmentController.numberOfStaff.value == '') {
      InjectionHelper.equityInvestmentController.isValNumberOfStaff.value =
          false;
    } else {
      InjectionHelper.equityInvestmentController.isValNumberOfStaff.value =
          true;
    }

    if (InjectionHelper.equityInvestmentController.ownerName.value == '') {
      InjectionHelper.equityInvestmentController.isValOwnerName.value = false;
    } else {
      InjectionHelper.equityInvestmentController.isValOwnerName.value = true;
    }

    if (InjectionHelper.equityInvestmentController.productSevice.value == '') {
      InjectionHelper.equityInvestmentController.isValProductService.value =
          false;
    } else {
      InjectionHelper.equityInvestmentController.isValProductService.value =
          true;
    }

    if (InjectionHelper.equityInvestmentController.productSevice.value != '' &&
        InjectionHelper.equityInvestmentController.ownerName.value != '' &&
        InjectionHelper.equityInvestmentController.numberOfStaff.value != '' &&
        InjectionHelper.equityInvestmentController.industry.value.display !=
            null &&
        InjectionHelper
                .equityInvestmentController.typeOfOrganization.value.display !=
            null &&
        InjectionHelper.equityInvestmentController.yearOfEstablishment.value !=
            '' &&
        InjectionHelper.equityInvestmentController.address.value != '' &&
        InjectionHelper.equityInvestmentController.address.value != '' &&
        InjectionHelper.equityInvestmentController.companyName.value != '') {
      if (InjectionHelper.equityInvestmentController.purposeOfFund.value == 1) {
        InjectionHelper.equityInvestmentController.purposeOfFund.value =
            InjectionHelper
                .optionController.optionData.value.riaseuseoffund![0].id!;
      }
      context
          .go("/get_funding/equity-step3?id=${widget.id}&&step=${widget.step}");
    }
  }

  @override
  void initState() {
    InjectionHelper.memberController.fetchCompanyMember(
        id: InjectionHelper.customerController.customer.value.customerId);
    if (widget.id != null) {
      inistialdata();
    }

    if (InjectionHelper.memberController.companyDataList.isNotEmpty) {
      InjectionHelper.memberController.addCompany.value = false;
    }
    super.initState();
  }

  inistialdata() async {
    if (widget.id != null) {
      await InjectionHelper.equityInvestmentController
          .fetchAppDetails(widget.id!);
    }

    InjectionHelper.equityInvestmentController.financingAmountcontroller.text =
        InjectionHelper.equityInvestmentController.applicationData.value
                    .financialAmount
                    .toString() ==
                ""
            ? ""
            : InjectionHelper.equityInvestmentController.applicationData.value
                .financialAmount!
                .toString();

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

    InjectionHelper.equityInvestmentController.useOfFundcontroller.text =
        InjectionHelper
            .equityInvestmentController.applicationData.value.useofFund!;
    InjectionHelper.equityInvestmentController.useOfFund.value = InjectionHelper
        .equityInvestmentController.applicationData.value.useofFund!;
    InjectionHelper.equityInvestmentController.companyName.value =
        InjectionHelper.equityInvestmentController.applicationData.value
            .company!.companyName!;
    InjectionHelper.equityInvestmentController.address.value = InjectionHelper
        .equityInvestmentController.applicationData.value.company!.address!;
    InjectionHelper.equityInvestmentController.addresscontroller.text =
        InjectionHelper
            .equityInvestmentController.applicationData.value.company!.address!;
    InjectionHelper.equityInvestmentController.yearOfEstablishment.value =
        InjectionHelper.equityInvestmentController.applicationData.value
            .company!.yearFounded!
            .toString();
    InjectionHelper.equityInvestmentController.yearOfestabliscontroller.text =
        InjectionHelper.equityInvestmentController.applicationData.value
            .company!.yearFounded!
            .toString();
    InjectionHelper.equityInvestmentController.typeOfOrganization.value =
        InjectionHelper.equityInvestmentController.applicationData.value
                    .company!.typeOfOrganization !=
                null
            ? InjectionHelper.equityInvestmentController.applicationData.value
                .company!.typeOfOrganization!
            : Optionmodel(id: 0, display: null);

    InjectionHelper.equityInvestmentController.taxIdentificationNumber.value =
        InjectionHelper.equityInvestmentController.applicationData.value
            .company!.taxIdentificationNumber!;
    InjectionHelper.equityInvestmentController.taxcontroller.text =
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
        : Optionmodel(id: 0, display: null);

    ///
    var displayNumberofStaff = FormatNumber.formatNumberDefualt(InjectionHelper
        .equityInvestmentController
        .applicationData
        .value
        .company!
        .numberOfStaff!);
    InjectionHelper.equityInvestmentController.numberofStaffcontroller.text =
        InjectionHelper.equityInvestmentController.applicationData.value
                    .company!.numberOfStaff! ==
                0
            ? ""
            : displayNumberofStaff.toString();
    InjectionHelper.equityInvestmentController.numberOfStaff.value =
        InjectionHelper.equityInvestmentController.applicationData.value
            .company!.numberOfStaff!
            .toString();
    InjectionHelper.equityInvestmentController.ownerNamecontroller.text =
        InjectionHelper.equityInvestmentController.applicationData.value
            .company!.ownerName!;
    InjectionHelper.equityInvestmentController.ownerName.value = InjectionHelper
        .equityInvestmentController.applicationData.value.company!.ownerName!;
    InjectionHelper.equityInvestmentController.productSevice.value =
        InjectionHelper.equityInvestmentController.applicationData.value
            .company!.companyProductAndService!;
    InjectionHelper.equityInvestmentController.productController.text =
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
    debugPrint(
        "Patent doc:${InjectionHelper.equityInvestmentController.applicationData.value.companyPatentDoc}");
    if (InjectionHelper.equityInvestmentController.applicationData.value
            .companyPatentDoc ==
        1) {
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
  }

  onResetCompany() {
    InjectionHelper.equityInvestmentController.companyName.value = "";
    InjectionHelper.equityInvestmentController.address.value = "";
    InjectionHelper.equityInvestmentController.yearOfEstablishment.value = "";
    InjectionHelper.equityInvestmentController.typeOfOrganization.value =
        Optionmodel(display: null, id: 0);
    InjectionHelper.equityInvestmentController.taxIdentificationNumber.value =
        "";
    InjectionHelper.equityInvestmentController.industry.value = Optionmodel(
      display: null,
      id: 0,
    );
    InjectionHelper.equityInvestmentController.numberOfStaff.value = "";
    InjectionHelper.equityInvestmentController.ownerName.value = "";
    InjectionHelper.equityInvestmentController.productSevice.value = "";
    InjectionHelper.equityInvestmentController.addresscontroller.text = "";
    InjectionHelper.equityInvestmentController.yearOfestabliscontroller.text =
        "";
    InjectionHelper.equityInvestmentController.ownerNamecontroller.text = "";
    InjectionHelper.equityInvestmentController.productController.text = "";
    InjectionHelper.equityInvestmentController.numberofStaffcontroller.text =
        "";
    InjectionHelper.equityInvestmentController.taxcontroller.text = "";

    InjectionHelper.equityInvestmentController.isPatentDoc.value = false;
    InjectionHelper.equityInvestmentController.isCertificate.value = false;
    InjectionHelper.equityInvestmentController.isMemorandum.value = false;
    InjectionHelper.equityInvestmentController.isLicense.value = false;

    InjectionHelper.equityInvestmentController.patentDocument.value = 0;
    InjectionHelper.equityInvestmentController.certificatioDoc.value = 0;
    InjectionHelper.equityInvestmentController.memorandumDoc.value = 0;
    InjectionHelper.equityInvestmentController.licenseDoc.value = 0;
  }

  bool checkdisablesavedraf() {
    return InjectionHelper.equityInvestmentController.applicationData.value.company != null
        ? InjectionHelper.equityInvestmentController.companyName.value == InjectionHelper.equityInvestmentController.applicationData.value.company!.companyName &&
            InjectionHelper.equityInvestmentController.address.value ==
                InjectionHelper.equityInvestmentController.applicationData.value
                    .company!.address! &&
            InjectionHelper.equityInvestmentController.yearOfEstablishment.value ==
                InjectionHelper.equityInvestmentController.applicationData.value
                    .company!.yearFounded &&
            InjectionHelper.equityInvestmentController.typeOfOrganization.value ==
                InjectionHelper.equityInvestmentController.applicationData.value
                    .company!.typeOfOrganization &&
            InjectionHelper.equityInvestmentController.taxIdentificationNumber.value ==
                InjectionHelper.equityInvestmentController.applicationData.value
                    .company!.taxIdentificationNumber &&
            InjectionHelper.equityInvestmentController.industry.value ==
                InjectionHelper.equityInvestmentController.applicationData.value
                    .company!.industry &&
            InjectionHelper.equityInvestmentController.numberOfStaff.value ==
                InjectionHelper.equityInvestmentController.applicationData.value
                    .company!.numberOfStaff
                    .toString() &&
            InjectionHelper.equityInvestmentController.ownerName.value ==
                InjectionHelper.equityInvestmentController.applicationData.value
                    .company!.ownerName &&
            InjectionHelper.equityInvestmentController.patentDocument.value ==
                InjectionHelper.equityInvestmentController.applicationData.value.companyPatentDoc! &&
            InjectionHelper.equityInvestmentController.certificatioDoc.value == InjectionHelper.equityInvestmentController.applicationData.value.companyMoCCertificate! &&
            InjectionHelper.equityInvestmentController.licenseDoc.value == InjectionHelper.equityInvestmentController.applicationData.value.companyLicenceDoc! &&
            InjectionHelper.equityInvestmentController.memorandumDoc.value == InjectionHelper.equityInvestmentController.applicationData.value.companyMAA! &&
            InjectionHelper.equityInvestmentController.typeOfOrganization.value.display == InjectionHelper.equityInvestmentController.applicationData.value.company!.typeOfOrganization!.display &&
            InjectionHelper.equityInvestmentController.industry.value.display == InjectionHelper.equityInvestmentController.applicationData.value.company!.industry!.display &&
            InjectionHelper.equityInvestmentController.productSevice.value == InjectionHelper.equityInvestmentController.applicationData.value.company!.companyProductAndService
        : false;
  }

  TextEditingController addNewOtherType = TextEditingController();
  TextEditingController addNewOtherIndustry = TextEditingController();

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
                            leading: !InjectionHelper.equityInvestmentController
                                    .isLoadingData.value
                                ? Obx(
                                    () => IconButton(
                                      onPressed: widget.id != null &&
                                              checkdisablesavedraf()
                                          ? () {
                                              FocusScope.of(context).unfocus();
                                              Navigator.pop(context);
                                            }
                                          : InjectionHelper.equityInvestmentController.companyName.value == "" &&
                                                  InjectionHelper
                                                          .equityInvestmentController
                                                          .address
                                                          .value ==
                                                      "" &&
                                                  InjectionHelper
                                                          .equityInvestmentController
                                                          .yearOfEstablishment
                                                          .value ==
                                                      "" &&
                                                  InjectionHelper
                                                          .equityInvestmentController
                                                          .typeOfOrganization
                                                          .value
                                                          .display ==
                                                      null &&
                                                  InjectionHelper
                                                          .equityInvestmentController
                                                          .taxIdentificationNumber
                                                          .value ==
                                                      "" &&
                                                  InjectionHelper
                                                          .equityInvestmentController
                                                          .industry
                                                          .value
                                                          .display ==
                                                      null &&
                                                  InjectionHelper
                                                          .equityInvestmentController
                                                          .numberOfStaff
                                                          .value ==
                                                      "" &&
                                                  InjectionHelper
                                                          .equityInvestmentController
                                                          .ownerName
                                                          .value ==
                                                      "" &&
                                                  InjectionHelper
                                                          .equityInvestmentController
                                                          .productSevice
                                                          .value ==
                                                      ""
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
                                                        context.pop();
                                                        if (widget.id == null) {
                                                          await InjectionHelper
                                                              .equityInvestmentController
                                                              .onSubmitEquityInvestment(
                                                                  context:
                                                                      context,
                                                                  type: "1");
                                                        } else {
                                                          InjectionHelper
                                                              .equityInvestmentController
                                                              .onEditEquityInvestment(
                                                                  context:
                                                                      context,
                                                                  id: widget
                                                                      .id!,
                                                                  pagenumber:
                                                                      "1");
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
                                  )
                                : Icon(
                                    kIsWeb
                                        ? Icons.arrow_back
                                        : Platform.isAndroid
                                            ? Icons.arrow_back
                                            : Icons.arrow_back_ios,
                                    color: Colors.black,
                                  ),
                            action: [
                              const CustomCallCenter(),
                              const CustomCircleChart(
                                numberPage: 2,
                              ),
                              const SizedBox(
                                width: 20,
                              )
                            ],
                          ),
                    body: Obx(
                      () => InjectionHelper.memberController.isLoading.value ||
                              InjectionHelper.equityInvestmentController
                                  .isLoadingData.value
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
                                              .displayMedium,
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      CustomFormCard(
                                        padding: const EdgeInsets.only(
                                            top: 10, bottom: 20),
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

                                                        Navigator.pop(context);
                                                      },
                                                      isCompany: true,
                                                      isValidate: InjectionHelper
                                                          .equityInvestmentController
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
                                                            "Address":
                                                                e.value.address,
                                                            "Product": e.value
                                                                .companyProductAndService,
                                                            "Tax": e.value
                                                                .taxIdentificationNumber,
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
                                                                    null
                                                                ? e.value
                                                                    .numberOfStaff
                                                                    .toString()
                                                                : '',
                                                            "OwnerName": e.value
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
                                                            .equityInvestmentController
                                                            .companyName
                                                            .value = v["Name"];
                                                        InjectionHelper
                                                            .equityInvestmentController
                                                            .address
                                                            .value = v["Address"];

                                                        InjectionHelper
                                                            .equityInvestmentController
                                                            .addresscontroller
                                                            .text = v["Address"];

                                                        InjectionHelper
                                                            .equityInvestmentController
                                                            .yearOfEstablishment
                                                            .value = v['Year'];
                                                        InjectionHelper
                                                            .equityInvestmentController
                                                            .yearOfestabliscontroller
                                                            .text = v['Year'];
                                                        InjectionHelper
                                                            .equityInvestmentController
                                                            .ownerName
                                                            .value = v['OwnerName'];
                                                        InjectionHelper
                                                            .equityInvestmentController
                                                            .ownerNamecontroller
                                                            .text = v['OwnerName'];

                                                        v['NumberOfStaff'] ==
                                                                '0'
                                                            ? InjectionHelper
                                                                .equityInvestmentController
                                                                .numberOfStaff
                                                                .value = ''
                                                            : InjectionHelper
                                                                    .equityInvestmentController
                                                                    .numberOfStaff
                                                                    .value =
                                                                v['NumberOfStaff'];
                                                        var displaynumberstaff =
                                                            FormatNumber
                                                                .formatNumberDefualt(
                                                                    int.parse(v[
                                                                        'NumberOfStaff']));
                                                        v['NumberOfStaff'] ==
                                                                '0'
                                                            ? InjectionHelper
                                                                .equityInvestmentController
                                                                .numberofStaffcontroller
                                                                .text = ''
                                                            : InjectionHelper
                                                                    .equityInvestmentController
                                                                    .numberofStaffcontroller
                                                                    .text =
                                                                displaynumberstaff
                                                                    .toString();

                                                        ///
                                                        InjectionHelper
                                                                .equityInvestmentController
                                                                .typeOfOrganization
                                                                .value =
                                                            Optionmodel(
                                                                id: int.parse(v[
                                                                    'Typeid']),
                                                                display: v[
                                                                    'TypeDis']);
                                                        InjectionHelper
                                                                .equityInvestmentController
                                                                .industry
                                                                .value =
                                                            Optionmodel(
                                                                id: int.parse(v[
                                                                    'Industryid']),
                                                                display: v[
                                                                    'IndustryDis']);
                                                        InjectionHelper
                                                            .equityInvestmentController
                                                            .taxcontroller
                                                            .text = v['Tax'];
                                                        InjectionHelper
                                                            .equityInvestmentController
                                                            .taxIdentificationNumber
                                                            .value = v['Tax'];
                                                        InjectionHelper
                                                            .equityInvestmentController
                                                            .companyIndex
                                                            .value = v['Code'];

                                                        InjectionHelper
                                                            .equityInvestmentController
                                                            .productSevice
                                                            .value = v["Product"];
                                                        InjectionHelper
                                                            .equityInvestmentController
                                                            .productController
                                                            .text = v["Product"];
                                                        InjectionHelper
                                                            .equityInvestmentController
                                                            .isValProductService
                                                            .value = true;
                                                        InjectionHelper
                                                            .equityInvestmentController
                                                            .isValCompanyName
                                                            .value = true;
                                                        InjectionHelper
                                                            .equityInvestmentController
                                                            .isValAddress
                                                            .value = true;
                                                        InjectionHelper
                                                            .equityInvestmentController
                                                            .isValYearOfEstablishment
                                                            .value = true;
                                                        InjectionHelper
                                                            .equityInvestmentController
                                                            .isValTypeOfOrganization
                                                            .value = true;
                                                        InjectionHelper
                                                            .equityInvestmentController
                                                            .isValIndustry
                                                            .value = true;
                                                        InjectionHelper
                                                            .equityInvestmentController
                                                            .isValNumberOfStaff
                                                            .value = true;
                                                        InjectionHelper
                                                            .equityInvestmentController
                                                            .isValOwnerName
                                                            .value = true;
                                                      },
                                                      label: 'Company Name',
                                                      defaultValue: InjectionHelper
                                                                  .equityInvestmentController
                                                                  .companyName
                                                                  .value !=
                                                              ''
                                                          ? {
                                                              "Name": InjectionHelper
                                                                  .equityInvestmentController
                                                                  .companyName
                                                                  .value,
                                                              "Code": InjectionHelper
                                                                  .equityInvestmentController
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
                                                            .equityInvestmentController
                                                            .isValCompanyName
                                                            .value,
                                                        labelText:
                                                            'Company Name',
                                                        hintText:
                                                            'Company Name',
                                                        onChange: (value) {
                                                          InjectionHelper
                                                              .equityInvestmentController
                                                              .isValCompanyName
                                                              .value = true;
                                                          if (value.isEmpty) {
                                                            InjectionHelper
                                                                .equityInvestmentController
                                                                .companyName
                                                                .value = '';
                                                            tempData.companyName =
                                                                "";
                                                          } else {
                                                            InjectionHelper
                                                                .equityInvestmentController
                                                                .companyName
                                                                .value = value;
                                                            tempData.companyName =
                                                                InjectionHelper
                                                                    .equityInvestmentController
                                                                    .companyName
                                                                    .value;
                                                          }
                                                          setState(() {});
                                                        },
                                                        initialValue:
                                                            InjectionHelper
                                                                .equityInvestmentController
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
                                                            .equityInvestmentController
                                                            .isValCompanyName
                                                            .value,
                                                        labelText:
                                                            'Company Name',
                                                        hintText:
                                                            'Company Name',
                                                        onChange: (value) {
                                                          InjectionHelper
                                                              .equityInvestmentController
                                                              .isValCompanyName
                                                              .value = true;
                                                          if (value.isEmpty) {
                                                            InjectionHelper
                                                                .equityInvestmentController
                                                                .companyName
                                                                .value = '';
                                                            setState(() {
                                                              tempData.companyName =
                                                                  "";
                                                            });
                                                          } else {
                                                            InjectionHelper
                                                                .equityInvestmentController
                                                                .companyName
                                                                .value = value;
                                                            setState(() {
                                                              tempData.companyName =
                                                                  InjectionHelper
                                                                      .equityInvestmentController
                                                                      .companyName
                                                                      .value;
                                                            });
                                                          }
                                                        },
                                                        initialValue:
                                                            InjectionHelper
                                                                .equityInvestmentController
                                                                .companyName
                                                                .value,
                                                      ),
                                            CustomTextFieldNew(
                                              focusScope: addressFocus,
                                              onEditingComplete: () {
                                                FocusScope.of(context)
                                                    .requestFocus(yearofFocus);
                                              },
                                              controller: InjectionHelper
                                                  .equityInvestmentController
                                                  .addresscontroller,
                                              isRequired: true,
                                              isValidate: InjectionHelper
                                                  .equityInvestmentController
                                                  .isValAddress
                                                  .value,
                                              labelText: 'Address',
                                              hintText: 'Address',
                                              onChange: (value) {
                                                if (value.isEmpty) {
                                                  InjectionHelper
                                                      .equityInvestmentController
                                                      .address
                                                      .value = '';
                                                  InjectionHelper
                                                      .equityInvestmentController
                                                      .isValAddress
                                                      .value = false;
                                                } else {
                                                  InjectionHelper
                                                      .equityInvestmentController
                                                      .address
                                                      .value = value;
                                                  InjectionHelper
                                                      .equityInvestmentController
                                                      .isValAddress
                                                      .value = true;
                                                }
                                              },
                                              initialValue: InjectionHelper
                                                  .equityInvestmentController
                                                  .address
                                                  .value,
                                            ),
                                            CustomTextFieldNew(
                                              maxlenght: 4,
                                              controller: InjectionHelper
                                                  .equityInvestmentController
                                                  .yearOfestabliscontroller,
                                              inputFormatterList: [
                                                FilteringTextInputFormatter
                                                    .digitsOnly,
                                                FilteringTextInputFormatter
                                                    .deny(RegExp(r'^0+')),
                                              ],
                                              keyboardType:
                                                  TextInputType.number,
                                              focusScope: yearofFocus,
                                              onEditingComplete: () {
                                                FocusScope.of(context)
                                                    .requestFocus(taxFocus);
                                              },
                                              isRequired: true,
                                              isValidate: InjectionHelper
                                                  .equityInvestmentController
                                                  .isValYearOfEstablishment
                                                  .value,
                                              labelText:
                                                  'Year Of Establishment',
                                              hintText: 'Year Of Establishment',
                                              onChange: (value) {
                                                if (value.isEmpty) {
                                                  InjectionHelper
                                                      .equityInvestmentController
                                                      .yearOfEstablishment
                                                      .value = '';
                                                  InjectionHelper
                                                      .equityInvestmentController
                                                      .isValYearOfEstablishment
                                                      .value = false;
                                                } else {
                                                  InjectionHelper
                                                      .equityInvestmentController
                                                      .yearOfEstablishment
                                                      .value = value;
                                                  InjectionHelper
                                                      .equityInvestmentController
                                                      .isValYearOfEstablishment
                                                      .value = true;
                                                }
                                              },
                                              initialValue: InjectionHelper
                                                  .equityInvestmentController
                                                  .yearOfEstablishment
                                                  .value,
                                            ),
                                            CICDropdown(
                                              onCreateCompany: () {
                                                onShowAddOtherLabel(
                                                  title: "Add Other",
                                                  onBack: () {
                                                    Navigator.pop(context);
                                                  },
                                                  onCancel: () {
                                                    Navigator.pop(context);
                                                  },
                                                  onSave: () {
                                                    InjectionHelper
                                                            .equityInvestmentController
                                                            .typeOfOrganization
                                                            .value
                                                            .display =
                                                        addNewOtherType.text;

                                                    if (addNewOtherType.text !=
                                                        "") {
                                                      InjectionHelper
                                                          .equityInvestmentController
                                                          .typeOfOrganization
                                                          .value
                                                          .id = null;
                                                    }
                                                    setState(() {});
                                                    Navigator.pop(context);
                                                    Navigator.pop(context);
                                                  },
                                                  context: context,
                                                  textFieldHere:
                                                      CustomTextFieldNew(
                                                    autoFocus: true,
                                                    controller: addNewOtherType,
                                                    hintText:
                                                        'Type of organization',
                                                    labelText:
                                                        'Type of organization',
                                                  ),
                                                );
                                              },
                                              isCompany: true,
                                              otherLabel: "Add Other",
                                              colors: Colors.white,
                                              isValidate: InjectionHelper
                                                  .equityInvestmentController
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
                                                    .equityInvestmentController
                                                    .typeOfOrganization
                                                    .value = Optionmodel(
                                                  id: int.parse(v["Code"]),
                                                  display: v["Name"],
                                                );
                                                InjectionHelper
                                                    .equityInvestmentController
                                                    .isValTypeOfOrganization
                                                    .value = true;
                                              },
                                              label: 'Type Of Organization',
                                              defaultValue: InjectionHelper
                                                              .equityInvestmentController
                                                              .typeOfOrganization
                                                              .value
                                                              .display !=
                                                          null &&
                                                      InjectionHelper
                                                              .equityInvestmentController
                                                              .typeOfOrganization
                                                              .value
                                                              .display!
                                                              .toLowerCase() !=
                                                          'null' &&
                                                      InjectionHelper
                                                              .equityInvestmentController
                                                              .typeOfOrganization
                                                              .value
                                                              .display!
                                                              .toLowerCase() !=
                                                          ''
                                                  ? {
                                                      "Name": InjectionHelper
                                                          .equityInvestmentController
                                                          .typeOfOrganization
                                                          .value
                                                          .display,
                                                      "Code": InjectionHelper
                                                          .equityInvestmentController
                                                          .typeOfOrganization
                                                          .value
                                                          .id
                                                    }
                                                  : null,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            CustomTextFieldNew(
                                              controller: InjectionHelper
                                                  .equityInvestmentController
                                                  .taxcontroller,
                                              focusScope: taxFocus,
                                              onEditingComplete: () {
                                                FocusScope.of(context)
                                                    .requestFocus(
                                                        numberofFocus);
                                              },
                                              labelText:
                                                  'Tax Identification Number (TIN)',
                                              hintText:
                                                  'Tax Identification Number (TIN)',
                                              onChange: (value) {
                                                if (value.isEmpty) {
                                                  InjectionHelper
                                                      .equityInvestmentController
                                                      .taxIdentificationNumber
                                                      .value = '';
                                                } else {
                                                  InjectionHelper
                                                      .equityInvestmentController
                                                      .taxIdentificationNumber
                                                      .value = value;
                                                }
                                              },
                                              initialValue: InjectionHelper
                                                  .equityInvestmentController
                                                  .taxIdentificationNumber
                                                  .value,
                                            ),
                                            CICDropdown(
                                              onCreateCompany: () {
                                                onShowAddOtherLabel(
                                                  title: "Add Other",
                                                  onBack: () {
                                                    Navigator.pop(context);
                                                  },
                                                  onCancel: () {
                                                    Navigator.pop(context);
                                                  },
                                                  onSave: () {
                                                    InjectionHelper
                                                            .equityInvestmentController
                                                            .industry
                                                            .value
                                                            .display =
                                                        addNewOtherIndustry
                                                            .text;
                                                    if (addNewOtherIndustry
                                                            .text !=
                                                        "") {
                                                      InjectionHelper
                                                          .equityInvestmentController
                                                          .industry
                                                          .value
                                                          .id = null;
                                                    }
                                                    setState(() {});
                                                    Navigator.pop(context);
                                                    Navigator.pop(context);
                                                  },
                                                  context: context,
                                                  textFieldHere:
                                                      CustomTextFieldNew(
                                                    autoFocus: true,
                                                    controller:
                                                        addNewOtherIndustry,
                                                    hintText: 'Industry',
                                                    labelText: 'Industry',
                                                  ),
                                                );
                                              },
                                              isCompany: true,
                                              otherLabel: "Add Other",
                                              colors: Colors.white,
                                              defaultValue: InjectionHelper
                                                              .equityInvestmentController
                                                              .industry
                                                              .value
                                                              .display !=
                                                          null &&
                                                      InjectionHelper
                                                              .equityInvestmentController
                                                              .industry
                                                              .value
                                                              .display !=
                                                          "" &&
                                                      InjectionHelper
                                                              .equityInvestmentController
                                                              .industry
                                                              .value
                                                              .display!
                                                              .toLowerCase() !=
                                                          'null'
                                                  ? {
                                                      "Name": InjectionHelper
                                                          .equityInvestmentController
                                                          .industry
                                                          .value
                                                          .display,
                                                      "Code": InjectionHelper
                                                          .equityInvestmentController
                                                          .industry
                                                          .value
                                                          .id
                                                    }
                                                  : null,
                                              isValidate: InjectionHelper
                                                  .equityInvestmentController
                                                  .isValIndustry
                                                  .value,
                                              item: InjectionHelper
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
                                                    .equityInvestmentController
                                                    .industry
                                                    .value = Optionmodel(
                                                  display: v["Name"],
                                                  id: int.parse(v["Code"]),
                                                );
                                                InjectionHelper
                                                    .equityInvestmentController
                                                    .isValIndustry
                                                    .value = true;
                                              },
                                              label: 'Industry',
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            CustomTextFieldNew(
                                              inputFormatterList: [
                                                FilteringTextInputFormatter
                                                    .digitsOnly,
                                                FilteringTextInputFormatter
                                                    .deny(RegExp(r'^0+')),
                                                NumericTextFormatter()
                                              ],
                                              keyboardType:
                                                  TextInputType.number,
                                              controller: InjectionHelper
                                                  .equityInvestmentController
                                                  .numberofStaffcontroller,
                                              focusScope: numberofFocus,
                                              onEditingComplete: () {
                                                FocusScope.of(context)
                                                    .requestFocus(
                                                        ownernameFocus);
                                              },
                                              isRequired: true,
                                              isValidate: InjectionHelper
                                                  .equityInvestmentController
                                                  .isValNumberOfStaff
                                                  .value,
                                              labelText: 'Number Of Staff',
                                              hintText: 'Number Of Staff',
                                              onChange: (valueChanged) {
                                                var value = valueChanged
                                                    .replaceAll(',', '');
                                                if (value.isEmpty) {
                                                  InjectionHelper
                                                      .equityInvestmentController
                                                      .numberOfStaff
                                                      .value = '';
                                                  InjectionHelper
                                                      .equityInvestmentController
                                                      .isValNumberOfStaff
                                                      .value = false;
                                                } else {
                                                  InjectionHelper
                                                      .equityInvestmentController
                                                      .numberOfStaff
                                                      .value = value;
                                                  InjectionHelper
                                                      .equityInvestmentController
                                                      .isValNumberOfStaff
                                                      .value = true;
                                                }
                                              },
                                              initialValue: InjectionHelper
                                                          .equityInvestmentController
                                                          .numberOfStaff
                                                          .value ==
                                                      "0"
                                                  ? ""
                                                  : InjectionHelper
                                                      .equityInvestmentController
                                                      .numberOfStaff
                                                      .value,
                                            ),
                                            CustomTextFieldNew(
                                              controller: InjectionHelper
                                                  .equityInvestmentController
                                                  .ownerNamecontroller,
                                              focusScope: ownernameFocus,
                                              onEditingComplete: () {},
                                              isRequired: true,
                                              isValidate: InjectionHelper
                                                  .equityInvestmentController
                                                  .isValOwnerName
                                                  .value,
                                              labelText: 'Owner Name',
                                              hintText: 'Owner Name',
                                              onChange: (value) {
                                                if (value.isEmpty) {
                                                  InjectionHelper
                                                      .equityInvestmentController
                                                      .ownerName
                                                      .value = '';
                                                  InjectionHelper
                                                      .equityInvestmentController
                                                      .isValOwnerName
                                                      .value = false;
                                                } else {
                                                  InjectionHelper
                                                      .equityInvestmentController
                                                      .ownerName
                                                      .value = value;
                                                  InjectionHelper
                                                      .equityInvestmentController
                                                      .isValOwnerName
                                                      .value = true;
                                                }
                                              },
                                              initialValue: InjectionHelper
                                                  .equityInvestmentController
                                                  .ownerName
                                                  .value,
                                            ),
                                            CustomTextFieldNew(
                                              isRequired: true,
                                              controller: InjectionHelper
                                                  .equityInvestmentController
                                                  .productController,
                                              isValidate: InjectionHelper
                                                  .equityInvestmentController
                                                  .isValProductService
                                                  .value,
                                              labelText: 'Product / Service',
                                              hintText: 'Product / Service',
                                              onChange: (value) {
                                                if (value.isEmpty) {
                                                  InjectionHelper
                                                      .equityInvestmentController
                                                      .productSevice
                                                      .value = '';
                                                  InjectionHelper
                                                      .equityInvestmentController
                                                      .isValProductService
                                                      .value = false;
                                                } else {
                                                  InjectionHelper
                                                      .equityInvestmentController
                                                      .productSevice
                                                      .value = value;
                                                  InjectionHelper
                                                      .equityInvestmentController
                                                      .isValProductService
                                                      .value = true;
                                                }
                                              },
                                              initialValue: InjectionHelper
                                                  .equityInvestmentController
                                                  .productSevice
                                                  .value,
                                            ),
                                            const SizedBox(
                                              height: 20,
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
                                                    .bodyMedium!
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
                                                        .equityInvestmentController
                                                        .isPatentDoc
                                                        .value,
                                                    ontap: () {
                                                      InjectionHelper
                                                              .equityInvestmentController
                                                              .isPatentDoc
                                                              .value =
                                                          !InjectionHelper
                                                              .equityInvestmentController
                                                              .isPatentDoc
                                                              .value;

                                                      if (InjectionHelper
                                                          .equityInvestmentController
                                                          .isPatentDoc
                                                          .value) {
                                                        InjectionHelper
                                                            .equityInvestmentController
                                                            .patentDocument
                                                            .value = 1;
                                                      } else {
                                                        InjectionHelper
                                                            .equityInvestmentController
                                                            .patentDocument
                                                            .value = 0;
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
                                                        .equityInvestmentController
                                                        .isCertificate
                                                        .value,
                                                    ontap: () {
                                                      InjectionHelper
                                                              .equityInvestmentController
                                                              .isCertificate
                                                              .value =
                                                          !InjectionHelper
                                                              .equityInvestmentController
                                                              .isCertificate
                                                              .value;
                                                      if (InjectionHelper
                                                          .equityInvestmentController
                                                          .isCertificate
                                                          .value) {
                                                        InjectionHelper
                                                            .equityInvestmentController
                                                            .certificatioDoc
                                                            .value = 1;
                                                      } else {
                                                        InjectionHelper
                                                            .equityInvestmentController
                                                            .certificatioDoc
                                                            .value = 0;
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
                                                        .equityInvestmentController
                                                        .isLicense
                                                        .value,
                                                    ontap: () {
                                                      InjectionHelper
                                                              .equityInvestmentController
                                                              .isLicense
                                                              .value =
                                                          !InjectionHelper
                                                              .equityInvestmentController
                                                              .isLicense
                                                              .value;
                                                      if (InjectionHelper
                                                          .equityInvestmentController
                                                          .isLicense
                                                          .value) {
                                                        InjectionHelper
                                                            .equityInvestmentController
                                                            .licenseDoc
                                                            .value = 1;
                                                      } else {
                                                        InjectionHelper
                                                            .equityInvestmentController
                                                            .licenseDoc
                                                            .value = 0;
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
                                                        .equityInvestmentController
                                                        .isMemorandum
                                                        .value,
                                                    ontap: () {
                                                      InjectionHelper
                                                              .equityInvestmentController
                                                              .isMemorandum
                                                              .value =
                                                          !InjectionHelper
                                                              .equityInvestmentController
                                                              .isMemorandum
                                                              .value;
                                                      //check if else make sure value in ontap is ture when we have API
                                                      if (InjectionHelper
                                                          .equityInvestmentController
                                                          .isMemorandum
                                                          .value) {
                                                        InjectionHelper
                                                            .equityInvestmentController
                                                            .memorandumDoc
                                                            .value = 1;
                                                      } else {
                                                        InjectionHelper
                                                            .equityInvestmentController
                                                            .memorandumDoc
                                                            .value = 0;
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
                                )),
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 20, right: 20, bottom: 10, top: 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: CustomButton(
                                          isDisable: widget.id != null
                                              ? InjectionHelper.equityInvestmentController.companyName.value == "" &&
                                                      InjectionHelper.equityInvestmentController.address.value ==
                                                          "" &&
                                                      InjectionHelper.equityInvestmentController.yearOfEstablishment.value ==
                                                          "" &&
                                                      InjectionHelper
                                                              .equityInvestmentController
                                                              .typeOfOrganization
                                                              .value
                                                              .display ==
                                                          null &&
                                                      InjectionHelper.equityInvestmentController.taxIdentificationNumber.value ==
                                                          "" &&
                                                      InjectionHelper
                                                              .equityInvestmentController
                                                              .industry
                                                              .value
                                                              .display ==
                                                          null &&
                                                      InjectionHelper.equityInvestmentController.numberOfStaff.value ==
                                                          "" &&
                                                      InjectionHelper
                                                              .equityInvestmentController
                                                              .ownerName
                                                              .value ==
                                                          "" &&
                                                      InjectionHelper
                                                              .equityInvestmentController
                                                              .productSevice
                                                              .value ==
                                                          "" &&
                                                      !InjectionHelper
                                                          .equityInvestmentController
                                                          .isPatentDoc
                                                          .value &&
                                                      !InjectionHelper
                                                          .equityInvestmentController
                                                          .isCertificate
                                                          .value &&
                                                      !InjectionHelper
                                                          .equityInvestmentController
                                                          .isLicense
                                                          .value &&
                                                      !InjectionHelper
                                                          .equityInvestmentController
                                                          .isMemorandum
                                                          .value
                                                  ? true
                                                  : widget.id != null &&
                                                          checkdisablesavedraf() &&
                                                          addNewOtherIndustry.text ==
                                                              "" &&
                                                          addNewOtherType.text ==
                                                              ""
                                                      ? true
                                                      : false
                                              : InjectionHelper.equityInvestmentController.companyName.value == "" &&
                                                      InjectionHelper.equityInvestmentController.address.value == "" &&
                                                      InjectionHelper.equityInvestmentController.yearOfEstablishment.value == "" &&
                                                      InjectionHelper.equityInvestmentController.typeOfOrganization.value.display == null &&
                                                      InjectionHelper.equityInvestmentController.taxIdentificationNumber.value == "" &&
                                                      InjectionHelper.equityInvestmentController.industry.value.display == null &&
                                                      InjectionHelper.equityInvestmentController.numberOfStaff.value == "" &&
                                                      InjectionHelper.equityInvestmentController.ownerName.value == "" &&
                                                      InjectionHelper.equityInvestmentController.productSevice.value == ""
                                                  ? true
                                                  : false,
                                          isOutline: true,
                                          onPressed: widget.id != null
                                              ? () {
                                                  FirebaseAnalyticsHelper
                                                      .sendAnalyticsEvent(
                                                          "Equity Update Draft Step2");
                                                  InjectionHelper
                                                      .equityInvestmentController
                                                      .onEditEquityInvestment(
                                                          showSnackbar: false,
                                                          context: context,
                                                          id: widget.id!,
                                                          pagenumber: "2",
                                                          frompage: InjectionHelper
                                                              .equityInvestmentController
                                                              .applicationData
                                                              .value
                                                              .step!
                                                              .toInt());
                                                }
                                              : () {
                                                  FirebaseAnalyticsHelper
                                                      .sendAnalyticsEvent(
                                                          "Equity Save Draft Step2");
                                                  InjectionHelper
                                                      .equityInvestmentController
                                                      .onSubmitEquityInvestment(
                                                          showSnackbar: false,
                                                          context: context,
                                                          type: "2");
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
                    ),
                  ),
          ),
        ),
      ),
    ));
  }
}
