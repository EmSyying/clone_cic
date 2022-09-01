import 'dart:io';
import 'package:cicgreenloan/Utils/helper/format_number.dart';
import 'package:cicgreenloan/Utils/helper/numerice_format.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/customer_controller.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/member_controller.dart';
import 'package:cicgreenloan/Utils/option_controller/option_controller.dart';
import 'package:cicgreenloan/modules/get_funding/models/equat_equity_model.dart';
import 'package:cicgreenloan/Utils/helper/option_model/option_model.dart';
import 'package:cicgreenloan/modules/get_funding/controller/equity_investment_controller.dart';
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
import '../../../../Utils/pop_up_alert/show_alert_dialog.dart';
import '../../../../widgets/get_funding/custom_add_other_label.dart';
import '../../../../widgets/get_funding/custom_call_center.dart';
import '../../../../widgets/get_funding/custom_select_2_getfunding.dart';

class Step2Equity extends StatefulWidget {
  final int? id;

  final int? step;
  const Step2Equity(
      {Key? key, this.id, this.step})
      : super(key: key);
  @override
  State<Step2Equity> createState() => _Step2EquityState();
}

class _Step2EquityState extends State<Step2Equity> {
  final equityController = Get.put(EquityInvestmentController());
  final memberController = Get.put(MemberController());
  final customerController = Get.put(CustomerController());
  final optionController = Get.put(DocumentCategory());

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
    if (equityController.companyName.value == '') {
      equityController.isValCompanyName.value = false;
    } else {
      equityController.isValCompanyName.value = true;
    }

    if (equityController.address.value == '') {
      equityController.isValAddress.value = false;
    } else {
      equityController.isValAddress.value = true;
    }

    if (equityController.yearOfEstablishment.value == '') {
      equityController.isValYearOfEstablishment.value = false;
    } else {
      equityController.isValYearOfEstablishment.value = true;
    }

    if (equityController.typeOfOrganization.value.display == null) {
      equityController.isValTypeOfOrganization.value = false;
    } else {
      equityController.isValTypeOfOrganization.value = true;
    }

    if (equityController.industry.value.display == null) {
      equityController.isValIndustry.value = false;
    } else {
      equityController.isValIndustry.value = true;
    }

    if (equityController.numberOfStaff.value == '') {
      equityController.isValNumberOfStaff.value = false;
    } else {
      equityController.isValNumberOfStaff.value = true;
    }

    if (equityController.ownerName.value == '') {
      equityController.isValOwnerName.value = false;
    } else {
      equityController.isValOwnerName.value = true;
    }

    if (equityController.productSevice.value == '') {
      equityController.isValProductService.value = false;
    } else {
      equityController.isValProductService.value = true;
    }

    if (equityController.productSevice.value != '' &&
        equityController.ownerName.value != '' &&
        equityController.numberOfStaff.value != '' &&
        equityController.industry.value.display != null &&
        equityController.typeOfOrganization.value.display != null &&
        equityController.yearOfEstablishment.value != '' &&
        equityController.address.value != '' &&
        equityController.address.value != '' &&
        equityController.companyName.value != '') {
      if (equityController.purposeOfFund.value == 1) {
        equityController.purposeOfFund.value =
            optionController.optionData.value.riaseuseoffund![0].id!;
      }
      context.go(
          "/get-funding/equity-investment/equity-step3?id=${widget.id}&&step=${widget.step}");
    }
  }

  @override
  void initState() {
    memberController.fetchCompanyMember(
        id: customerController.customer.value.customerId);
    if (widget.id != null) {
      inistialdata();
    }

    if (memberController.companyDataList.isNotEmpty) {
      memberController.addCompany.value = false;
    }
    super.initState();
  }

  inistialdata() async {
    if (widget.id != null) {
      await equityController.fetchAppDetails(widget.id!);
    }

    equityController.financingAmountcontroller.text =
        equityController.applicationData.value.financialAmount.toString() == ""
            ? ""
            : equityController.applicationData.value.financialAmount!
                .toString();

    equityController.financingAmoung.value =
        equityController.applicationData.value.financialAmount != null
            ? equityController.applicationData.value.financialAmount!.toInt()
            : 0;

    equityController.intendedDate.value =
        equityController.applicationData.value.intendedDateDisbursement!;

    equityController.useOfFundcontroller.text =
        equityController.applicationData.value.useofFund!;
    equityController.useOfFund.value =
        equityController.applicationData.value.useofFund!;
    equityController.companyName.value =
        equityController.applicationData.value.company!.companyName!;
    equityController.address.value =
        equityController.applicationData.value.company!.address!;
    equityController.addresscontroller.text =
        equityController.applicationData.value.company!.address!;
    equityController.yearOfEstablishment.value =
        equityController.applicationData.value.company!.yearFounded!.toString();
    equityController.yearOfestabliscontroller.text =
        equityController.applicationData.value.company!.yearFounded!.toString();
    equityController.typeOfOrganization.value = equityController
                .applicationData.value.company!.typeOfOrganization !=
            null
        ? equityController.applicationData.value.company!.typeOfOrganization!
        : Optionmodel(id: 0, display: null);

    equityController.taxIdentificationNumber.value = equityController
        .applicationData.value.company!.taxIdentificationNumber!;
    equityController.taxcontroller.text = equityController
        .applicationData.value.company!.taxIdentificationNumber!;
    equityController.industry.value =
        equityController.applicationData.value.company!.industry != null
            ? equityController.applicationData.value.company!.industry!
            : Optionmodel(id: 0, display: null);

    ///
    var displayNumberofStaff = FormatNumber.formatNumberDefualt(
        equityController.applicationData.value.company!.numberOfStaff!);
    equityController.numberofStaffcontroller.text =
        equityController.applicationData.value.company!.numberOfStaff! == 0
            ? ""
            : displayNumberofStaff.toString();
    equityController.numberOfStaff.value = equityController
        .applicationData.value.company!.numberOfStaff!
        .toString();
    equityController.ownerNamecontroller.text =
        equityController.applicationData.value.company!.ownerName!;
    equityController.ownerName.value =
        equityController.applicationData.value.company!.ownerName!;
    equityController.productSevice.value = equityController
        .applicationData.value.company!.companyProductAndService!;
    equityController.productController.text = equityController
        .applicationData.value.company!.companyProductAndService!;
    equityController.patentDocument.value =
        equityController.applicationData.value.companyPatentDoc!;
    equityController.certificatioDoc.value =
        equityController.applicationData.value.companyMoCCertificate!;
    equityController.licenseDoc.value =
        equityController.applicationData.value.companyLicenceDoc!;
    equityController.memorandumDoc.value =
        equityController.applicationData.value.companyMAA!;
    debugPrint(
        "Patent doc:${equityController.applicationData.value.companyPatentDoc}");
    if (equityController.applicationData.value.companyPatentDoc == 1) {
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
  }

  onResetCompany() {
    equityController.companyName.value = "";
    equityController.address.value = "";
    equityController.yearOfEstablishment.value = "";
    equityController.typeOfOrganization.value =
        Optionmodel(display: null, id: 0);
    equityController.taxIdentificationNumber.value = "";
    equityController.industry.value = Optionmodel(
      display: null,
      id: 0,
    );
    equityController.numberOfStaff.value = "";
    equityController.ownerName.value = "";
    equityController.productSevice.value = "";
    equityController.addresscontroller.text = "";
    equityController.yearOfestabliscontroller.text = "";
    equityController.ownerNamecontroller.text = "";
    equityController.productController.text = "";
    equityController.numberofStaffcontroller.text = "";
    equityController.taxcontroller.text = "";

    equityController.isPatentDoc.value = false;
    equityController.isCertificate.value = false;
    equityController.isMemorandum.value = false;
    equityController.isLicense.value = false;

    equityController.patentDocument.value = 0;
    equityController.certificatioDoc.value = 0;
    equityController.memorandumDoc.value = 0;
    equityController.licenseDoc.value = 0;
  }

  bool checkdisablesavedraf() {
    return equityController.companyName.value ==
            equityController.applicationData.value.company!.companyName &&
        equityController.address.value ==
            equityController.applicationData.value.company!.address! &&
        equityController.yearOfEstablishment.value ==
            equityController.applicationData.value.company!.yearFounded &&
        equityController.typeOfOrganization.value ==
            equityController
                .applicationData.value.company!.typeOfOrganization &&
        equityController.taxIdentificationNumber.value ==
            equityController
                .applicationData.value.company!.taxIdentificationNumber &&
        equityController.industry.value ==
            equityController.applicationData.value.company!.industry &&
        equityController.numberOfStaff.value ==
            equityController.applicationData.value.company!.numberOfStaff
                .toString() &&
        equityController.ownerName.value ==
            equityController.applicationData.value.company!.ownerName &&
        equityController.patentDocument.value ==
            equityController.applicationData.value.companyPatentDoc! &&
        equityController.certificatioDoc.value ==
            equityController.applicationData.value.companyMoCCertificate! &&
        equityController.licenseDoc.value ==
            equityController.applicationData.value.companyLicenceDoc! &&
        equityController.memorandumDoc.value ==
            equityController.applicationData.value.companyMAA! &&
        equityController.typeOfOrganization.value.display ==
            equityController
                .applicationData.value.company!.typeOfOrganization!.display &&
        equityController.industry.value.display ==
            equityController.applicationData.value.company!.industry!.display &&
        equityController.productSevice.value ==
            equityController
                .applicationData.value.company!.companyProductAndService;
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
                            leading: !equityController.isLoadingData.value
                                ? Obx(
                                    () => IconButton(
                                      onPressed: widget.id != null &&
                                              checkdisablesavedraf()
                                          ? () {
                                              FocusScope.of(context).unfocus();
                                              Navigator.pop(context);
                                            }
                                          : equityController.companyName.value == "" &&
                                                  equityController.address.value ==
                                                      "" &&
                                                  equityController
                                                          .yearOfEstablishment
                                                          .value ==
                                                      "" &&
                                                  equityController
                                                          .typeOfOrganization
                                                          .value
                                                          .display ==
                                                      null &&
                                                  equityController
                                                          .taxIdentificationNumber
                                                          .value ==
                                                      "" &&
                                                  equityController.industry
                                                          .value.display ==
                                                      null &&
                                                  equityController.numberOfStaff
                                                          .value ==
                                                      "" &&
                                                  equityController
                                                          .ownerName.value ==
                                                      "" &&
                                                  equityController.productSevice
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
                                                        Navigator.pop(context);
                                                        if (widget.id == null) {
                                                          await equityController
                                                              .onSubmitEquityInvestment(
                                                                  context:
                                                                      context,
                                                                  type: "1");
                                                        } else {
                                                          equityController
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
                                                        equityController
                                                            .resetData();
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
                      () => memberController.isLoading.value ||
                              equityController.isLoadingData.value
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
                                            top: 10, bottom: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            memberController.companyDataList
                                                        .isNotEmpty &&
                                                    memberController
                                                            .addCompany.value ==
                                                        false
                                                ? Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 5),
                                                    child: CICDropdown(
                                                      colors: Colors.white,
                                                      onCreateCompany: () {
                                                        onResetCompany();
                                                        memberController
                                                            .addCompany
                                                            .value = true;
                                                        memberController
                                                            .addCompany
                                                            .refresh();
                                                        memberController
                                                            .update();

                                                        Navigator.pop(context);
                                                      },
                                                      isCompany: true,
                                                      isValidate:
                                                          equityController
                                                              .isValCompanyName
                                                              .value,
                                                      item: memberController
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
                                                        equityController
                                                            .companyName
                                                            .value = v["Name"];
                                                        equityController
                                                                .address.value =
                                                            v["Address"];

                                                        equityController
                                                            .addresscontroller
                                                            .text = v["Address"];

                                                        equityController
                                                            .yearOfEstablishment
                                                            .value = v['Year'];
                                                        equityController
                                                            .yearOfestabliscontroller
                                                            .text = v['Year'];
                                                        equityController
                                                                .ownerName
                                                                .value =
                                                            v['OwnerName'];
                                                        equityController
                                                            .ownerNamecontroller
                                                            .text = v['OwnerName'];

                                                        v['NumberOfStaff'] ==
                                                                '0'
                                                            ? equityController
                                                                .numberOfStaff
                                                                .value = ''
                                                            : equityController
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
                                                            ? equityController
                                                                .numberofStaffcontroller
                                                                .text = ''
                                                            : equityController
                                                                    .numberofStaffcontroller
                                                                    .text =
                                                                displaynumberstaff
                                                                    .toString();

                                                        ///
                                                        equityController
                                                                .typeOfOrganization
                                                                .value =
                                                            Optionmodel(
                                                                id: int.parse(v[
                                                                    'Typeid']),
                                                                display: v[
                                                                    'TypeDis']);
                                                        equityController
                                                                .industry
                                                                .value =
                                                            Optionmodel(
                                                                id: int.parse(v[
                                                                    'Industryid']),
                                                                display: v[
                                                                    'IndustryDis']);
                                                        equityController
                                                            .taxcontroller
                                                            .text = v['Tax'];
                                                        equityController
                                                            .taxIdentificationNumber
                                                            .value = v['Tax'];
                                                        equityController
                                                            .companyIndex
                                                            .value = v['Code'];

                                                        equityController
                                                                .productSevice
                                                                .value =
                                                            v["Product"];
                                                        equityController
                                                            .productController
                                                            .text = v["Product"];
                                                        equityController
                                                            .isValProductService
                                                            .value = true;
                                                        equityController
                                                            .isValCompanyName
                                                            .value = true;
                                                        equityController
                                                            .isValAddress
                                                            .value = true;
                                                        equityController
                                                            .isValYearOfEstablishment
                                                            .value = true;
                                                        equityController
                                                            .isValTypeOfOrganization
                                                            .value = true;
                                                        equityController
                                                            .isValIndustry
                                                            .value = true;
                                                        equityController
                                                            .isValNumberOfStaff
                                                            .value = true;
                                                        equityController
                                                            .isValOwnerName
                                                            .value = true;
                                                      },
                                                      label: 'Company Name',
                                                      defaultValue:
                                                          equityController
                                                                      .companyName
                                                                      .value !=
                                                                  ''
                                                              ? {
                                                                  "Name": equityController
                                                                      .companyName
                                                                      .value,
                                                                  "Code": equityController
                                                                      .companyIndex
                                                                      .value
                                                                }
                                                              : null,
                                                    ),
                                                  )
                                                : memberController
                                                            .addCompany.value ==
                                                        true
                                                    ? CustomTextFieldNew(
                                                        autoFocus:
                                                            memberController
                                                                .addCompany
                                                                .value,
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                        maxLine: 1,
                                                        isRequired: true,
                                                        isValidate:
                                                            equityController
                                                                .isValCompanyName
                                                                .value,
                                                        labelText:
                                                            'Company Name',
                                                        hintText:
                                                            'Company Name',
                                                        onChange: (value) {
                                                          equityController
                                                              .isValCompanyName
                                                              .value = true;
                                                          if (value.isEmpty) {
                                                            equityController
                                                                .companyName
                                                                .value = '';
                                                            tempData.companyName =
                                                                "";
                                                          } else {
                                                            equityController
                                                                .companyName
                                                                .value = value;
                                                            tempData.companyName =
                                                                equityController
                                                                    .companyName
                                                                    .value;
                                                          }
                                                          setState(() {});
                                                        },
                                                        initialValue:
                                                            equityController
                                                                .companyName
                                                                .value,
                                                      )
                                                    : CustomTextFieldNew(
                                                        autoFocus:
                                                            memberController
                                                                .addCompany
                                                                .value,
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                        maxLine: 1,
                                                        isRequired: true,
                                                        isValidate:
                                                            equityController
                                                                .isValCompanyName
                                                                .value,
                                                        labelText:
                                                            'Company Name',
                                                        hintText:
                                                            'Company Name',
                                                        onChange: (value) {
                                                          equityController
                                                              .isValCompanyName
                                                              .value = true;
                                                          if (value.isEmpty) {
                                                            equityController
                                                                .companyName
                                                                .value = '';
                                                            setState(() {
                                                              tempData.companyName =
                                                                  "";
                                                            });
                                                          } else {
                                                            equityController
                                                                .companyName
                                                                .value = value;
                                                            setState(() {
                                                              tempData.companyName =
                                                                  equityController
                                                                      .companyName
                                                                      .value;
                                                            });
                                                          }
                                                        },
                                                        initialValue:
                                                            equityController
                                                                .companyName
                                                                .value,
                                                      ),
                                            CustomTextFieldNew(
                                              focusScope: addressFocus,
                                              onEditingComplete: () {
                                                FocusScope.of(context)
                                                    .requestFocus(yearofFocus);
                                              },
                                              controller: equityController
                                                  .addresscontroller,
                                              isRequired: true,
                                              isValidate: equityController
                                                  .isValAddress.value,
                                              labelText: 'Address',
                                              hintText: 'Address',
                                              onChange: (value) {
                                                if (value.isEmpty) {
                                                  equityController
                                                      .address.value = '';
                                                  equityController.isValAddress
                                                      .value = false;
                                                } else {
                                                  equityController
                                                      .address.value = value;
                                                  equityController.isValAddress
                                                      .value = true;
                                                }
                                              },
                                              initialValue: equityController
                                                  .address.value,
                                            ),
                                            CustomTextFieldNew(
                                              maxlenght: 4,
                                              controller: equityController
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
                                              isValidate: equityController
                                                  .isValYearOfEstablishment
                                                  .value,
                                              labelText:
                                                  'Year Of Establishment',
                                              hintText: 'Year Of Establishment',
                                              onChange: (value) {
                                                if (value.isEmpty) {
                                                  equityController
                                                      .yearOfEstablishment
                                                      .value = '';
                                                  equityController
                                                      .isValYearOfEstablishment
                                                      .value = false;
                                                } else {
                                                  equityController
                                                      .yearOfEstablishment
                                                      .value = value;
                                                  equityController
                                                      .isValYearOfEstablishment
                                                      .value = true;
                                                }
                                              },
                                              initialValue: equityController
                                                  .yearOfEstablishment.value,
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
                                                    equityController
                                                            .typeOfOrganization
                                                            .value
                                                            .display =
                                                        addNewOtherType.text;

                                                    if (addNewOtherType.text !=
                                                        "") {
                                                      equityController
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
                                              isValidate: equityController
                                                  .isValTypeOfOrganization
                                                  .value,
                                              item: optionController.optionData
                                                  .value.organization!
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
                                                equityController
                                                    .typeOfOrganization
                                                    .value = Optionmodel(
                                                  id: int.parse(v["Code"]),
                                                  display: v["Name"],
                                                );
                                                equityController
                                                    .isValTypeOfOrganization
                                                    .value = true;
                                              },
                                              label: 'Type Of Organization',
                                              defaultValue: equityController
                                                              .typeOfOrganization
                                                              .value
                                                              .display !=
                                                          null &&
                                                      equityController
                                                              .typeOfOrganization
                                                              .value
                                                              .display!
                                                              .toLowerCase() !=
                                                          'null'
                                                  ? {
                                                      "Name": equityController
                                                          .typeOfOrganization
                                                          .value
                                                          .display,
                                                      "Code": equityController
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
                                              controller: equityController
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
                                                  equityController
                                                      .taxIdentificationNumber
                                                      .value = '';
                                                } else {
                                                  equityController
                                                      .taxIdentificationNumber
                                                      .value = value;
                                                }
                                              },
                                              initialValue: equityController
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
                                                    equityController.industry
                                                            .value.display =
                                                        addNewOtherIndustry
                                                            .text;
                                                    if (addNewOtherIndustry
                                                            .text !=
                                                        "") {
                                                      equityController.industry
                                                          .value.id = null;
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
                                              defaultValue: equityController
                                                              .industry
                                                              .value
                                                              .display !=
                                                          null &&
                                                      equityController.industry
                                                              .value.display!
                                                              .toLowerCase() !=
                                                          'null'
                                                  ? {
                                                      "Name": equityController
                                                          .industry
                                                          .value
                                                          .display,
                                                      "Code": equityController
                                                          .industry.value.id
                                                    }
                                                  : null,
                                              isValidate: equityController
                                                  .isValIndustry.value,
                                              item: optionController
                                                  .optionData.value.industry!
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
                                                equityController.industry
                                                    .value = Optionmodel(
                                                  display: v["Name"],
                                                  id: int.parse(v["Code"]),
                                                );
                                                equityController
                                                    .isValIndustry.value = true;
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
                                              controller: equityController
                                                  .numberofStaffcontroller,
                                              focusScope: numberofFocus,
                                              onEditingComplete: () {
                                                FocusScope.of(context)
                                                    .requestFocus(
                                                        ownernameFocus);
                                              },
                                              isRequired: true,
                                              isValidate: equityController
                                                  .isValNumberOfStaff.value,
                                              labelText: 'Number Of Staff',
                                              hintText: 'Number Of Staff',
                                              onChange: (valueChanged) {
                                                var value = valueChanged
                                                    .replaceAll(',', '');
                                                if (value.isEmpty) {
                                                  equityController
                                                      .numberOfStaff.value = '';
                                                  equityController
                                                      .isValNumberOfStaff
                                                      .value = false;
                                                } else {
                                                  equityController.numberOfStaff
                                                      .value = value;
                                                  equityController
                                                      .isValNumberOfStaff
                                                      .value = true;
                                                }
                                              },
                                              initialValue: equityController
                                                          .numberOfStaff
                                                          .value ==
                                                      "0"
                                                  ? ""
                                                  : equityController
                                                      .numberOfStaff.value,
                                            ),
                                            CustomTextFieldNew(
                                              controller: equityController
                                                  .ownerNamecontroller,
                                              focusScope: ownernameFocus,
                                              onEditingComplete: () {},
                                              isRequired: true,
                                              isValidate: equityController
                                                  .isValOwnerName.value,
                                              labelText: 'Owner Name',
                                              hintText: 'Owner Name',
                                              onChange: (value) {
                                                if (value.isEmpty) {
                                                  equityController
                                                      .ownerName.value = '';
                                                  equityController
                                                      .isValOwnerName
                                                      .value = false;
                                                } else {
                                                  equityController
                                                      .ownerName.value = value;
                                                  equityController
                                                      .isValOwnerName
                                                      .value = true;
                                                }
                                              },
                                              initialValue: equityController
                                                  .ownerName.value,
                                            ),
                                            CustomTextFieldNew(
                                              isRequired: true,
                                              controller: equityController
                                                  .productController,
                                              isValidate: equityController
                                                  .isValProductService.value,
                                              labelText: 'Product / Service',
                                              hintText: 'Product / Service',
                                              onChange: (value) {
                                                if (value.isEmpty) {
                                                  equityController
                                                      .productSevice.value = '';
                                                  equityController
                                                      .isValProductService
                                                      .value = false;
                                                } else {
                                                  equityController.productSevice
                                                      .value = value;
                                                  equityController
                                                      .isValProductService
                                                      .value = true;
                                                }
                                              },
                                              initialValue: equityController
                                                  .productSevice.value,
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
                                                    isSelect: equityController
                                                        .isPatentDoc.value,
                                                    ontap: () {
                                                      equityController
                                                              .isPatentDoc
                                                              .value =
                                                          !equityController
                                                              .isPatentDoc
                                                              .value;

                                                      if (equityController
                                                          .isPatentDoc.value) {
                                                        equityController
                                                            .patentDocument
                                                            .value = 1;
                                                      } else {
                                                        equityController
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
                                                    isSelect: equityController
                                                        .isCertificate.value,
                                                    ontap: () {
                                                      equityController
                                                              .isCertificate
                                                              .value =
                                                          !equityController
                                                              .isCertificate
                                                              .value;
                                                      if (equityController
                                                          .isCertificate
                                                          .value) {
                                                        equityController
                                                            .certificatioDoc
                                                            .value = 1;
                                                      } else {
                                                        equityController
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
                                                    isSelect: equityController
                                                        .isLicense.value,
                                                    ontap: () {
                                                      equityController
                                                              .isLicense.value =
                                                          !equityController
                                                              .isLicense.value;
                                                      if (equityController
                                                          .isLicense.value) {
                                                        equityController
                                                            .licenseDoc
                                                            .value = 1;
                                                      } else {
                                                        equityController
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
                                                    isSelect: equityController
                                                        .isMemorandum.value,
                                                    ontap: () {
                                                      equityController
                                                              .isMemorandum
                                                              .value =
                                                          !equityController
                                                              .isMemorandum
                                                              .value;
                                                      //check if else make sure value in ontap is ture when we have API
                                                      if (equityController
                                                          .isMemorandum.value) {
                                                        equityController
                                                            .memorandumDoc
                                                            .value = 1;
                                                      } else {
                                                        equityController
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
                                      left: 20, right: 20, bottom: 35, top: 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: CustomButton(
                                          isDisable: widget.id != null
                                              ? equityController.companyName.value == "" &&
                                                      equityController.address.value ==
                                                          "" &&
                                                      equityController.yearOfEstablishment
                                                              .value ==
                                                          "" &&
                                                      equityController
                                                              .typeOfOrganization
                                                              .value
                                                              .display ==
                                                          null &&
                                                      equityController
                                                              .taxIdentificationNumber
                                                              .value ==
                                                          "" &&
                                                      equityController.industry
                                                              .value.display ==
                                                          null &&
                                                      equityController
                                                              .numberOfStaff
                                                              .value ==
                                                          "" &&
                                                      equityController
                                                              .ownerName.value ==
                                                          "" &&
                                                      equityController
                                                              .productSevice.value ==
                                                          "" &&
                                                      !equityController
                                                          .isPatentDoc.value &&
                                                      !equityController
                                                          .isCertificate.value &&
                                                      !equityController
                                                          .isLicense.value &&
                                                      !equityController.isMemorandum
                                                          .value
                                                  ? true
                                                  : widget
                                                                  .id !=
                                                              null &&
                                                          checkdisablesavedraf() &&
                                                          addNewOtherIndustry.text ==
                                                              "" &&
                                                          addNewOtherType
                                                                  .text ==
                                                              ""
                                                      ? true
                                                      : false
                                              : equityController
                                                              .companyName.value ==
                                                          "" &&
                                                      equityController.address.value ==
                                                          "" &&
                                                      equityController
                                                              .yearOfEstablishment
                                                              .value ==
                                                          "" &&
                                                      equityController
                                                              .typeOfOrganization
                                                              .value
                                                              .display ==
                                                          null &&
                                                      equityController
                                                              .taxIdentificationNumber
                                                              .value ==
                                                          "" &&
                                                      equityController.industry
                                                              .value.display ==
                                                          null &&
                                                      equityController
                                                              .numberOfStaff
                                                              .value ==
                                                          "" &&
                                                      equityController.ownerName
                                                              .value ==
                                                          "" &&
                                                      equityController
                                                              .productSevice
                                                              .value ==
                                                          ""
                                                  ? true
                                                  : false,
                                          isOutline: true,
                                          onPressed: widget.id != null
                                              ? () {
                                                  FirebaseAnalyticsHelper
                                                      .sendAnalyticsEvent(
                                                          "Equity Update Draft Step2");
                                                  equityController
                                                      .onEditEquityInvestment(
                                                          showSnackbar: false,
                                                          context: context,
                                                          id: widget.id!,
                                                          pagenumber: "2",
                                                          frompage:
                                                              equityController
                                                                  .applicationData
                                                                  .value
                                                                  .step!
                                                                  .toInt());
                                                }
                                              : () {
                                                  FirebaseAnalyticsHelper
                                                      .sendAnalyticsEvent(
                                                          "Equity Save Draft Step2");
                                                  equityController
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
