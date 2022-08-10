import 'package:cicgreenloan/Utils/helper/color.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/customer_controller.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/member_controller.dart';
import 'package:cicgreenloan/Utils/option_controller/option_controller.dart';
import 'package:cicgreenloan/modules/get_funding/models/equatable_debt_model.dart';
import 'package:cicgreenloan/Utils/helper/option_model/gender.dart';
import 'package:cicgreenloan/Utils/helper/option_model/option_model.dart';
import 'package:cicgreenloan/modules/get_funding/controller/debt_investment_controller.dart';
import 'package:cicgreenloan/modules/get_funding/models/appliication_card_model.dart';
import 'package:cicgreenloan/modules/get_funding/screens/debt_investment/step2_debt.dart';
import 'package:cicgreenloan/modules/member_directory/models/member_personal_profile.dart';
import 'package:cicgreenloan/utils/chart/custom_circle_chart_1_3.dart';
import 'package:cicgreenloan/utils/form_builder/address_select_modal_sheet.dart';
import 'package:cicgreenloan/utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/utils/form_builder/custom_drop_down.dart';
import 'package:cicgreenloan/utils/form_builder/custom_form_card.dart';
import 'package:cicgreenloan/utils/form_builder/custom_textformfield.dart';
import 'package:cicgreenloan/utils/pop_up_alert/show_alert_dialog.dart';
import 'package:cicgreenloan/utils/select_address/address_model/address.dart';
import 'package:cicgreenloan/utils/select_address/address_model/full_address_model.dart';
import 'package:cicgreenloan/utils/select_address/select_address_controller.dart';
import 'package:cicgreenloan/widgets/get_funding/address_picker.dart';
import 'package:cicgreenloan/widgets/get_funding/custom_chips.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../Utils/helper/container_partern.dart';
import '../../../../Utils/helper/custom_appbar_colorswhite.dart';
import '../../../../Utils/helper/firebase_analytics.dart';
import '../../../../widgets/get_funding/custom_call_center.dart';

class Step1Debt extends StatefulWidget {
  final String? isDraft;
  final ApplicationData? applicationDetail;
  const Step1Debt({Key? key, this.applicationDetail, this.isDraft})
      : super(key: key);

  @override
  State<Step1Debt> createState() => _Step1DebtState();
}

class _Step1DebtState extends State<Step1Debt> {
  final debtCon = Get.put(DebtInvestmentController());
  final cusCon = Get.put(CustomerController());
  final reqCon = Get.put(RequestLoanController());
  final option = Get.put(DocumentCategory());
  final _memberCon = Get.put(MemberController());
  final _formKey = GlobalKey<FormState>();
  List addressOption = ['Yes', 'No'];
  List<GenderOption> gender = [
    GenderOption(id: 01, display: 'Male'),
    GenderOption(id: 02, display: 'Female'),
  ];

  DebtStep1Model defualtData = DebtStep1Model();
  DebtStep1Model tempData = DebtStep1Model();

  // ignore: unused_element
  void _onValidate() {
    if (debtCon.fullName.value == '') {
      debtCon.isValidateFullName.value = false;
    } else {
      debtCon.isValidateFullName.value = true;
    }
    if (debtCon.dateOfBirth.value == "") {
      debtCon.isValidateDateOfBirth.value = false;
    } else {
      debtCon.isValidateDateOfBirth.value = true;
    }
    if (debtCon.gender.value.display != null) {
      debtCon.isValidateGender.value = true;
    } else {
      debtCon.isValidateGender.value = false;
    }
    if (debtCon.email.value == "") {
      debtCon.isValidateEmail.value = false;
    } else {
      debtCon.isValidateEmail.value = true;
    }
    if (debtCon.phoneNumber.value == "") {
      debtCon.isValidatePhone.value = false;
    } else {
      debtCon.isValidatePhone.value = true;
    }

    if (reqCon.selectedAddressOption.value == 0) {
      debtCon.fullResidentAddress.value = debtCon.fullCurrentAddress.value;
      debtCon.isValidatePermenantAddress.value = true;
    }
    if (debtCon.fullCurrentAddress.value.streetNo != "" &&
        debtCon.fullCurrentAddress.value.houseNo != "" &&
        debtCon.fullCurrentAddress.value.addressList![0].name != "" &&
        debtCon.fullCurrentAddress.value.addressList![1].name != "" &&
        debtCon.fullCurrentAddress.value.addressList![2].name != "") {
      debtCon.isValidateFullAddress.value = true;
    } else {
      if (_memberCon.personalProfile.value.currentAddress!.city!.code != '') {
        debtCon.isValidateFullAddress.value = true;
      } else {
        debtCon.isValidateFullAddress.value = false;
      }
    }
    if (debtCon.fullResidentAddress.value.streetNo != "" &&
        debtCon.fullResidentAddress.value.houseNo != "" &&
        debtCon.fullResidentAddress.value.addressList![0].name != "" &&
        debtCon.fullResidentAddress.value.addressList![1].name != "" &&
        debtCon.fullResidentAddress.value.addressList![2].name != "") {
      debtCon.isValidatePermenantAddress.value = true;
    } else {
      if (_memberCon.personalProfile.value.permanentAddress!.city!.code != '') {
        debtCon.isValidatePermenantAddress.value = true;
      } else {
        debtCon.isValidatePermenantAddress.value = false;
      }
    }
    if (debtCon.fullName.value != '' &&
        debtCon.dateOfBirth.value != "" &&
        debtCon.gender.value.display != null &&
        debtCon.email.value != "" &&
        debtCon.phoneNumber.value != "" &&
        debtCon.isValidatePermenantAddress.value == true &&
        debtCon.isValidateFullAddress.value == true) {
      FocusScope.of(context).unfocus();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Step2Debt(
            applicationDetail: widget.applicationDetail,
            numerOfStep: 1,
          ),
        ),
      );
    }
  }

  void onCheck() {
    defualtData = DebtStep1Model(
      fullName: debtCon.fullName.value,
      dateOfBirth: debtCon.dateOfBirth.value,
      email: debtCon.email.value,
      phoneNumber: debtCon.phoneNumber.value,
      addIndex: reqCon.selectedAddressOption.value,
      gender: debtCon.gender.value,
      city: _memberCon.personalProfile.value.currentAddress!.city!.name,
      dis: _memberCon.personalProfile.value.currentAddress!.district!.name,
      com: _memberCon.personalProfile.value.currentAddress!.commune!.name,
      vil: _memberCon.personalProfile.value.currentAddress!.village!.name,
      currHouseNo: _memberCon.personalProfile.value.houseNo,
      currStreetNo: _memberCon.personalProfile.value.streetNo,
      perCity: _memberCon.personalProfile.value.permanentAddress!.city!.name,
      perDis: _memberCon.personalProfile.value.permanentAddress!.district!.name,
      perCom: _memberCon.personalProfile.value.permanentAddress!.commune!.name,
      perVil: _memberCon.personalProfile.value.permanentAddress!.village!.name,
      perHouseNo: _memberCon.personalProfile.value.permanentHouseNo,
      perStreetNo: _memberCon.personalProfile.value.streetNo,
    );
    tempData = DebtStep1Model(
      fullName: debtCon.fullName.value,
      dateOfBirth: debtCon.dateOfBirth.value,
      email: debtCon.email.value,
      phoneNumber: debtCon.phoneNumber.value,
      addIndex: reqCon.selectedAddressOption.value,
      gender: debtCon.gender.value,
      city: _memberCon.personalProfile.value.currentAddress!.city!.name,
      dis: _memberCon.personalProfile.value.currentAddress!.district!.name,
      com: _memberCon.personalProfile.value.currentAddress!.commune!.name,
      vil: _memberCon.personalProfile.value.currentAddress!.village!.name,
      currHouseNo: _memberCon.personalProfile.value.houseNo,
      currStreetNo: _memberCon.personalProfile.value.streetNo,
      perCity: _memberCon.personalProfile.value.permanentAddress!.city!.name,
      perDis: _memberCon.personalProfile.value.permanentAddress!.district!.name,
      perCom: _memberCon.personalProfile.value.permanentAddress!.commune!.name,
      perVil: _memberCon.personalProfile.value.permanentAddress!.village!.name,
      perHouseNo: _memberCon.personalProfile.value.permanentHouseNo,
      perStreetNo: _memberCon.personalProfile.value.streetNo,
    );
  }

  @override
  void initState() {
    reqCon.getGender();
    reqCon.getPurposeList();

    debtCon.selectAddIndex.value = reqCon.selectedAddressOption.value;
    _memberCon.fetchMemberPersonProfile(cusCon.customer.value.customerId!).then(
      (customer) {
        // reqCon.purpose.value = Purpose();

        if (customer.customerName!.isNotEmpty) {
          debtCon.fullName.value = customer.customerLatinName!;
        }
        if (customer.customerDateOfBirth != '') {
          debtCon.dateOfBirth.value = customer.customerDateOfBirth!;
        }
        if (customer.customerGender!.display! != '') {
          debtCon.gender.value = Optionmodel(
              id: customer.customerGender!.id!,
              display: customer.customerGender!.display!);
          if (customer.customerGender!.display! == 'Male') {
            debtCon.selectedIndexGender.value = 0;
          } else {
            debtCon.selectedIndexGender.value = 1;
          }
        }
        if (customer.email! != '') debtCon.email.value = customer.email!;
        if (customer.phone! != '') debtCon.phoneNumber.value = customer.phone!;
        if (_memberCon.personalProfile.value.currentAddress != null) {
          debtCon.fullCurrentAddress.value = FullAddress(
            houseNo: _memberCon.personalProfile.value.houseNo ?? "",
            streetNo: _memberCon.personalProfile.value.streetNo ?? "",
            addressList: [
              Address(
                code:
                    _memberCon.personalProfile.value.currentAddress!.city!.code,
                name:
                    _memberCon.personalProfile.value.currentAddress!.city!.name,
              ),
              Address(
                code: _memberCon
                    .personalProfile.value.currentAddress!.district!.code,
                name: _memberCon
                    .personalProfile.value.currentAddress!.district!.name,
              ),
              Address(
                code: _memberCon
                    .personalProfile.value.currentAddress!.commune!.code,
                name: _memberCon
                    .personalProfile.value.currentAddress!.commune!.name,
              ),
              Address(
                code: _memberCon
                        .personalProfile.value.currentAddress!.village!.code ??
                    "",
                name: _memberCon
                        .personalProfile.value.currentAddress!.village!.name ??
                    "",
              ),
            ],
          );
          if (_memberCon.personalProfile.value.permanentAddress != null) {
            debtCon.fullResidentAddress.value = FullAddress(
              houseNo: _memberCon.personalProfile.value.permanentHouseNo ?? "",
              streetNo:
                  _memberCon.personalProfile.value.permanentStreetNo ?? "",
              addressList: [
                Address(
                  code: _memberCon
                      .personalProfile.value.permanentAddress!.city!.code,
                  name: _memberCon
                      .personalProfile.value.permanentAddress!.city!.name,
                ),
                Address(
                  code: _memberCon
                      .personalProfile.value.permanentAddress!.district!.code,
                  name: _memberCon
                      .personalProfile.value.permanentAddress!.district!.name,
                ),
                Address(
                  code: _memberCon
                      .personalProfile.value.permanentAddress!.commune!.code,
                  name: _memberCon
                      .personalProfile.value.permanentAddress!.commune!.name,
                ),
                Address(
                  code: _memberCon.personalProfile.value.permanentAddress!
                          .village!.code ??
                      "",
                  name: _memberCon.personalProfile.value.permanentAddress!
                          .village!.name ??
                      "",
                ),
              ],
            );
          }
        }
        onCheck();
      },
    );

    super.initState();
  }

  onResetValidate() {
    debtCon.isValidateFullName.value = true;
    debtCon.isValidateDateOfBirth.value = true;
    debtCon.isValidateGender.value = true;
    debtCon.isValidateEmail.value = true;
    debtCon.isValidatePhone.value = true;
    debtCon.isValidateFullAddress.value = true;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoScaffold(
      body: Builder(
        builder: (context) => CupertinoPageScaffold(
          child: WillPopScope(
            onWillPop: () async => false,
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
                                widget.isDraft == "true"
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
                      appBar: CustomAppBarWhiteColor(
                        context: context,
                        leading: IconButton(
                          onPressed: tempData == defualtData
                              ? () {
                                  Navigator.pop(context);
                                }
                              : () {
                                  FocusScope.of(context).unfocus();
                                  debtCon.currentAddressList.clear();
                                  debtCon.isValidateFullName.value = true;
                                  debtCon.isValidateDateOfBirth.value = true;
                                  debtCon.isValidateGender.value = true;
                                  debtCon.isValidateEmail.value = true;
                                  debtCon.isValidatePhone.value = true;
                                  debtCon.isValidateFullAddress.value = true;

                                  showSaveDraftDialog(
                                    context: context,
                                    onSaveTitle:
                                        widget.applicationDetail != null
                                            ? "Update Draft"
                                            : "Save Draft",
                                    content:
                                        'Changes made to this page haven’t been saved yet.',
                                    title:
                                        'Are you sure you want to leave this page?',
                                    onSave: () async {
                                      Navigator.pop(context);
                                      widget.applicationDetail != null
                                          ? await debtCon.onEditDebtInvestment(
                                              context: context,
                                              id: widget.applicationDetail!.id,
                                              step: 1,
                                              updateType: 'draft_to_draft',
                                            )
                                          : await debtCon
                                              .onSubmitDebtInvestment(
                                                  context: context, step: 1);

                                      onResetValidate();
                                      Future.delayed(Duration.zero).then((_) {
                                        FocusScope.of(context).unfocus();
                                        Navigator.of(context).pop();
                                      });
                                    },
                                    isCancel: true,
                                    onDiscard: () {
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                    },
                                  );
                                },
                          icon: const Icon(
                            Icons.clear,
                            color: Colors.black,
                          ),
                        ),
                        title: 'Debt Investment',
                        action: [
                          const CustomCallCenter(),
                          const CustomCircleChart(
                            isDebtInvestment: true,
                            numberPage: 1,
                          ),
                          const SizedBox(
                            width: 20,
                          )
                        ],
                      ),
                      body: Obx(
                        () => _memberCon.isLoadingProfile.value
                            ? const LinearProgressIndicator()
                            : Column(
                                children: [
                                  Expanded(
                                    child: SingleChildScrollView(
                                      child: Form(
                                        key: _formKey,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 20),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20),
                                              child: Text(
                                                'Personal Information',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline2,
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            CustomFormCard(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  CustomTextFieldNew(
                                                    textInputAction:
                                                        TextInputAction.next,
                                                    isRequired: true,
                                                    keyboardType:
                                                        TextInputType.name,
                                                    isValidate: debtCon
                                                        .isValidateFullName
                                                        .value,
                                                    labelText: 'Full Name ',
                                                    hintText: 'Enter full name',
                                                    onChange: (value) {
                                                      setState(() {
                                                        tempData.fullName =
                                                            value;
                                                      });
                                                      if (value.isEmpty) {
                                                        debtCon.fullName.value =
                                                            '';
                                                        debtCon
                                                            .isValidateFullName
                                                            .value = false;
                                                      } else {
                                                        debtCon.fullName.value =
                                                            value;
                                                        debtCon
                                                            .isValidateFullName
                                                            .value = true;
                                                      }
                                                    },
                                                    initialValue:
                                                        debtCon.fullName.value,
                                                    onSave: ((value) {
                                                      debtCon.fullName.value =
                                                          value!;
                                                    }),
                                                  ),
                                                  CICDropdown(
                                                    isValidate: debtCon
                                                        .isValidateDateOfBirth
                                                        .value,
                                                    label: 'Date of birth ',
                                                    onChange: (value) {
                                                      debtCon.dateOfBirth
                                                              .value =
                                                          value["Name"];
                                                      debtCon
                                                          .isValidateDateOfBirth
                                                          .value = true;
                                                      setState(() {
                                                        tempData.dateOfBirth =
                                                            debtCon.dateOfBirth
                                                                .value;
                                                      });
                                                    },
                                                    defaultValue: debtCon
                                                                .dateOfBirth
                                                                .value !=
                                                            ""
                                                        ? {
                                                            'Name': debtCon
                                                                .dateOfBirth
                                                                .value,
                                                            'Code': '02'
                                                          }
                                                        : null,
                                                    isDateTimePicker: true,
                                                  ),
                                                  const SizedBox(height: 20),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 20),
                                                    child: Text(
                                                      'Gender',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline2,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 20),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 20),
                                                    child:
                                                        SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(
                                                        children: option
                                                            .optionData
                                                            .value
                                                            .gender!
                                                            .asMap()
                                                            .entries
                                                            .map((e) {
                                                          return GestureDetector(
                                                            onTap: () {
                                                              debtCon.gender
                                                                      .value =
                                                                  Optionmodel(
                                                                      id: e
                                                                          .value
                                                                          .id,
                                                                      display: e
                                                                          .value
                                                                          .display);
                                                              setState(() {
                                                                tempData.gender =
                                                                    debtCon
                                                                        .gender
                                                                        .value;
                                                              });
                                                              debtCon
                                                                  .selectedIndexGender
                                                                  .value = e.key;
                                                              debtCon
                                                                  .isValidateGender
                                                                  .value = true;
                                                            },
                                                            child: CustomChips(
                                                              margin:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      right:
                                                                          20),
                                                              title: e.value
                                                                  .display!,
                                                              currentIndex: debtCon
                                                                          .gender
                                                                          .value
                                                                          .display ==
                                                                      null
                                                                  ? null
                                                                  : e.key,
                                                              selectIndex: debtCon
                                                                  .selectedIndexGender
                                                                  .value,
                                                            ),
                                                          );
                                                        }).toList(),
                                                      ),
                                                    ),
                                                  ),
                                                  if (debtCon.isValidateGender
                                                          .value ==
                                                      false)
                                                    Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              left: 20.0),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 8,
                                                                horizontal: 0),
                                                        child: Row(
                                                          children: const [
                                                            Icon(
                                                              Icons.error,
                                                              color: Colors.red,
                                                              size: 20,
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text(
                                                              "Please Select Gender",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .red,
                                                                  fontSize: 12,
                                                                  fontFamily:
                                                                      'DMSans'),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  const SizedBox(height: 10),
                                                  CustomTextFieldNew(
                                                    maxLine: 1,
                                                    isRequired: true,
                                                    isValidate: debtCon
                                                        .isValidateEmail.value,
                                                    labelText: 'Email',
                                                    hintText: 'Enter email',
                                                    onChange: (value) {
                                                      if (value.isEmpty) {
                                                        debtCon.email.value =
                                                            '';
                                                        debtCon.isValidateEmail
                                                            .value = false;
                                                      } else {
                                                        debtCon.email.value =
                                                            value;
                                                        debtCon.isValidateEmail
                                                            .value = true;
                                                      }
                                                      setState(() {
                                                        tempData.email =
                                                            debtCon.email.value;
                                                      });
                                                    },
                                                    onSave: ((value) {
                                                      debtCon.email.value =
                                                          value!;
                                                    }),
                                                    initialValue:
                                                        debtCon.email.value,
                                                    keyboardType: TextInputType
                                                        .emailAddress,
                                                  ),
                                                  CustomTextFieldNew(
                                                    maxLine: 1,
                                                    isReadOnly: true,
                                                    isRequired: true,
                                                    isValidate: debtCon
                                                        .isValidatePhone.value,
                                                    onSave: ((value) {
                                                      debtCon.phoneNumber
                                                          .value = value!;
                                                    }),
                                                    labelText: 'Phone',
                                                    hintText:
                                                        'Enter your phone number',
                                                    initialValue: debtCon
                                                        .phoneNumber.value,
                                                    keyboardType:
                                                        TextInputType.number,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20),
                                              child: Text(
                                                'Address',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline2,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            CustomFormCard(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 20),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "*",
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .bodyText1!
                                                              .copyWith(
                                                                  color: AppColor
                                                                      .mainColor),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 5.0),
                                                          child: Text(
                                                            'Is current address the same permanent address?',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyText1,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(height: 20),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 20),
                                                    child: Row(
                                                        children: addressOption
                                                            .asMap()
                                                            .entries
                                                            .map((e) {
                                                      return GestureDetector(
                                                        onTap: () {
                                                          if (reqCon
                                                                  .selectedAddressOption
                                                                  .value !=
                                                              e.key) {
                                                            reqCon
                                                                .selectedAddressOption
                                                                .value = e.key;
                                                          } else {
                                                            reqCon
                                                                .selectedAddressOption
                                                                .value = 1;
                                                          }
                                                          reqCon
                                                              .selectedAddressOption
                                                              .value;
                                                          setState(() {
                                                            tempData.addIndex =
                                                                e.key;
                                                          });
                                                        },
                                                        child: CustomChips(
                                                          margin:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 20),
                                                          title: e.value,
                                                          currentIndex: e.key,
                                                          selectIndex: reqCon
                                                              .selectedAddressOption
                                                              .value,
                                                        ),
                                                      );
                                                    }).toList()),
                                                  ),
                                                  const SizedBox(height: 30.0),
                                                  AddressPickerWidget(
                                                    isValidate: debtCon
                                                        .isValidateFullAddress
                                                        .value,
                                                    onTap: () async {
                                                      if (debtCon
                                                              .fullCurrentAddress
                                                              .value
                                                              .addressList![0]
                                                              .name ==
                                                          "") {
                                                        reqCon
                                                            .getProvince("en");
                                                      } else {
                                                        if (debtCon
                                                                .fullCurrentAddress
                                                                .value
                                                                .addressList![0]
                                                                .name !=
                                                            "") {
                                                          reqCon
                                                              .currentAddressList
                                                              .value = [];
                                                          reqCon.getProvince(
                                                              "en");

                                                          reqCon
                                                              .currentAddressList
                                                              .add(debtCon
                                                                  .fullCurrentAddress
                                                                  .value
                                                                  .addressList![0]);
                                                          reqCon.getDistrict(
                                                              debtCon
                                                                  .fullCurrentAddress
                                                                  .value
                                                                  .addressList![
                                                                      0]
                                                                  .code!,
                                                              'en');
                                                        }

                                                        if (debtCon
                                                                .fullCurrentAddress
                                                                .value
                                                                .addressList![1]
                                                                .name !=
                                                            "") {
                                                          reqCon
                                                              .currentAddressList
                                                              .add(debtCon
                                                                  .fullCurrentAddress
                                                                  .value
                                                                  .addressList![1]);
                                                          reqCon.getCommune(
                                                              debtCon
                                                                  .fullCurrentAddress
                                                                  .value
                                                                  .addressList![
                                                                      1]
                                                                  .code!,
                                                              'en');
                                                        }
                                                        if (debtCon
                                                                .fullCurrentAddress
                                                                .value
                                                                .addressList![2]
                                                                .name !=
                                                            "") {
                                                          reqCon
                                                              .currentAddressList
                                                              .add(debtCon
                                                                  .fullCurrentAddress
                                                                  .value
                                                                  .addressList![2]);

                                                          reqCon.getVillage(
                                                              debtCon
                                                                  .fullCurrentAddress
                                                                  .value
                                                                  .addressList![
                                                                      2]
                                                                  .code!,
                                                              'en');
                                                        }
                                                        if (debtCon
                                                                .fullCurrentAddress
                                                                .value
                                                                .addressList![3]
                                                                .name !=
                                                            "") {
                                                          reqCon
                                                              .currentAddressList
                                                              .add(debtCon
                                                                  .fullCurrentAddress
                                                                  .value
                                                                  .addressList![3]);
                                                        }
                                                      }

                                                      debtCon.currentAddress
                                                              .value =
                                                          (await onShowModalSheet(
                                                        currentAddress:
                                                            CurrentAddress(
                                                          city: debtCon
                                                              .fullCurrentAddress
                                                              .value
                                                              .addressList![0],
                                                          commune: debtCon
                                                              .fullCurrentAddress
                                                              .value
                                                              .addressList![1],
                                                          district: debtCon
                                                              .fullCurrentAddress
                                                              .value
                                                              .addressList![2],
                                                          village: debtCon
                                                              .fullCurrentAddress
                                                              .value
                                                              .addressList![3],
                                                        ),
                                                        context: context,
                                                        streetNo: debtCon
                                                            .fullCurrentAddress
                                                            .value
                                                            .streetNo,
                                                        houseNo: debtCon
                                                            .fullCurrentAddress
                                                            .value
                                                            .houseNo,
                                                        onCancel: () {
                                                          reqCon
                                                              .currentAddressList
                                                              .clear();
                                                          // Navigator.pop(context);
                                                        },
                                                        selectAddress: reqCon
                                                            .currentAddressList,
                                                        onSelectProvince:
                                                            (Address province) {
                                                          reqCon.districtList
                                                              .clear();
                                                          reqCon.getDistrict(
                                                              province.code!,
                                                              'en');
                                                          if (!reqCon
                                                              .currentAddressList
                                                              .contains(
                                                                  province)) {
                                                            reqCon
                                                                .currentAddressList
                                                                .add(province);
                                                          }
                                                        },
                                                        onSelectCommune:
                                                            (Address commune) {
                                                          reqCon.villageList
                                                              .clear();
                                                          reqCon.getVillage(
                                                              commune.code!,
                                                              'en');
                                                          if (!reqCon
                                                              .currentAddressList
                                                              .contains(
                                                                  commune)) {
                                                            reqCon
                                                                .currentAddressList
                                                                .add(commune);
                                                          }
                                                        },
                                                        onSelectDistrict:
                                                            (Address
                                                                disctrict) {
                                                          reqCon.communeList
                                                              .clear();
                                                          reqCon.getCommune(
                                                              disctrict.code!,
                                                              'en');
                                                          if (!reqCon
                                                              .currentAddressList
                                                              .contains(
                                                                  disctrict)) {
                                                            reqCon
                                                                .currentAddressList
                                                                .add(disctrict);
                                                          }
                                                        },
                                                        onSelectVillage:
                                                            (Address village) {
                                                          if (reqCon
                                                                  .currentAddressList
                                                                  .length !=
                                                              4) {
                                                            if (!reqCon
                                                                .currentAddressList
                                                                .contains(
                                                                    village)) {
                                                              reqCon
                                                                  .currentAddressList
                                                                  .add(village);
                                                            }
                                                          } else {
                                                            reqCon.currentAddressList[
                                                                3] = village;
                                                          }
                                                        },
                                                        onDelete:
                                                            (Address address) {
                                                          if (address.code!
                                                                  .length ==
                                                              6) {
                                                            reqCon.villageList
                                                                .clear();
                                                            reqCon.getVillage(
                                                                address.code!,
                                                                'en');
                                                          } else if (address
                                                                  .code!
                                                                  .length ==
                                                              4) {
                                                            reqCon.communeList
                                                                .clear();
                                                            reqCon.getCommune(
                                                                address.code!,
                                                                'en');
                                                          } else {
                                                            reqCon.districtList
                                                                .clear();
                                                            reqCon.getDistrict(
                                                                address.code!,
                                                                'en');
                                                          }
                                                        },
                                                        communeList:
                                                            reqCon.communeList,
                                                        provinceList:
                                                            reqCon.provinceList,
                                                        villageList:
                                                            reqCon.villageList,
                                                        districtList:
                                                            reqCon.districtList,
                                                      ))!;
                                                      debtCon
                                                              .fullCurrentAddress
                                                              .value
                                                              .addressList![0] =
                                                          debtCon
                                                              .currentAddress
                                                              .value
                                                              .addressList![0];
                                                      debtCon
                                                              .fullCurrentAddress
                                                              .value
                                                              .addressList![1] =
                                                          debtCon
                                                              .currentAddress
                                                              .value
                                                              .addressList![1];
                                                      debtCon
                                                              .fullCurrentAddress
                                                              .value
                                                              .addressList![2] =
                                                          debtCon
                                                              .currentAddress
                                                              .value
                                                              .addressList![2];
                                                      debtCon
                                                              .fullCurrentAddress
                                                              .value
                                                              .addressList![3] =
                                                          debtCon
                                                              .currentAddress
                                                              .value
                                                              .addressList![3];
                                                      debtCon.fullCurrentAddress
                                                              .value.streetNo =
                                                          debtCon.currentAddress
                                                              .value.streetNo;
                                                      debtCon.fullCurrentAddress
                                                              .value.houseNo =
                                                          debtCon.currentAddress
                                                              .value.houseNo;

                                                      if (debtCon
                                                              .fullCurrentAddress
                                                              .value
                                                              .addressList !=
                                                          null) {
                                                        debtCon
                                                            .isValidateFullAddress
                                                            .value = true;
                                                        debtCon
                                                            .fullCurrentAddress
                                                            .refresh();
                                                        debtCon.update();
                                                        setState(() {
                                                          tempData.currHouseNo =
                                                              debtCon
                                                                  .fullCurrentAddress
                                                                  .value
                                                                  .houseNo;
                                                          tempData.currStreetNo =
                                                              debtCon
                                                                  .fullCurrentAddress
                                                                  .value
                                                                  .streetNo;
                                                          tempData.city = debtCon
                                                              .fullCurrentAddress
                                                              .value
                                                              .addressList![0]
                                                              .name;
                                                          tempData.dis = debtCon
                                                              .fullCurrentAddress
                                                              .value
                                                              .addressList![1]
                                                              .name;
                                                          tempData.com = debtCon
                                                              .fullCurrentAddress
                                                              .value
                                                              .addressList![2]
                                                              .name;
                                                          tempData.vil = debtCon
                                                              .fullCurrentAddress
                                                              .value
                                                              .addressList![3]
                                                              .name;
                                                        });
                                                      }
                                                    },
                                                    selectAddress: debtCon
                                                                .fullCurrentAddress
                                                                .value
                                                                .addressList![0]
                                                                .name !=
                                                            ""
                                                        ? debtCon
                                                                    .fullCurrentAddress
                                                                    .value
                                                                    .addressList![
                                                                        3]
                                                                    .name ==
                                                                ""
                                                            ? '${debtCon.fullCurrentAddress.value.streetNo} ${debtCon.fullCurrentAddress.value.houseNo} ${debtCon.fullCurrentAddress.value.addressList![2].name} ${debtCon.fullCurrentAddress.value.addressList![1].name} ${debtCon.fullCurrentAddress.value.addressList![0].name}'
                                                            : '${debtCon.fullCurrentAddress.value.streetNo} ${debtCon.fullCurrentAddress.value.houseNo} ${debtCon.fullCurrentAddress.value.addressList![3].name} ${debtCon.fullCurrentAddress.value.addressList![2].name} ${debtCon.fullCurrentAddress.value.addressList![1].name} ${debtCon.fullCurrentAddress.value.addressList![0].name}'
                                                        : null,
                                                    title: 'Current Address',
                                                  ),
                                                  const SizedBox(height: 20.0),
                                                  if (reqCon
                                                          .selectedAddressOption
                                                          .value ==
                                                      1)
                                                    AddressPickerWidget(
                                                      isValidate: debtCon
                                                          .isValidatePermenantAddress
                                                          .value,
                                                      onTap: () async {
                                                        reqCon
                                                            .residentAddressList
                                                            .clear();
                                                        if (debtCon
                                                                .fullResidentAddress
                                                                .value
                                                                .addressList![0]
                                                                .name ==
                                                            "") {
                                                          reqCon.getProvince(
                                                              "en");
                                                        } else {
                                                          if (debtCon
                                                                  .fullResidentAddress
                                                                  .value
                                                                  .addressList![
                                                                      0]
                                                                  .name !=
                                                              "") {
                                                            reqCon
                                                                .residentAddressList
                                                                .value = [];
                                                            reqCon.getProvince(
                                                                "en");

                                                            reqCon
                                                                .residentAddressList
                                                                .add(debtCon
                                                                    .fullResidentAddress
                                                                    .value
                                                                    .addressList![0]);
                                                            reqCon.getDistrict(
                                                                debtCon
                                                                    .fullResidentAddress
                                                                    .value
                                                                    .addressList![
                                                                        0]
                                                                    .code!,
                                                                'en');
                                                          }

                                                          if (debtCon
                                                                  .fullResidentAddress
                                                                  .value
                                                                  .addressList![
                                                                      1]
                                                                  .name !=
                                                              "") {
                                                            reqCon
                                                                .residentAddressList
                                                                .add(debtCon
                                                                    .fullResidentAddress
                                                                    .value
                                                                    .addressList![1]);
                                                            reqCon.getCommune(
                                                                debtCon
                                                                    .fullResidentAddress
                                                                    .value
                                                                    .addressList![
                                                                        1]
                                                                    .code!,
                                                                'en');
                                                          }
                                                          if (debtCon
                                                                  .fullResidentAddress
                                                                  .value
                                                                  .addressList![
                                                                      2]
                                                                  .name !=
                                                              "") {
                                                            reqCon
                                                                .residentAddressList
                                                                .add(debtCon
                                                                    .fullResidentAddress
                                                                    .value
                                                                    .addressList![2]);

                                                            reqCon.getVillage(
                                                                debtCon
                                                                    .fullResidentAddress
                                                                    .value
                                                                    .addressList![
                                                                        2]
                                                                    .code!,
                                                                'en');
                                                          }
                                                          if (debtCon
                                                                  .fullResidentAddress
                                                                  .value
                                                                  .addressList![
                                                                      3]
                                                                  .name !=
                                                              "") {
                                                            reqCon
                                                                .residentAddressList
                                                                .add(debtCon
                                                                    .fullResidentAddress
                                                                    .value
                                                                    .addressList![3]);
                                                          }
                                                        }

                                                        debtCon.residentAddress
                                                                .value =
                                                            (await onShowModalSheet(
                                                          permanentAddress:
                                                              CurrentAddress(
                                                            city: debtCon
                                                                .fullResidentAddress
                                                                .value
                                                                .addressList![0],
                                                            commune: debtCon
                                                                .fullResidentAddress
                                                                .value
                                                                .addressList![1],
                                                            district: debtCon
                                                                .fullResidentAddress
                                                                .value
                                                                .addressList![2],
                                                            village: debtCon
                                                                .fullResidentAddress
                                                                .value
                                                                .addressList![3],
                                                          ),
                                                          context: context,
                                                          streetNo: debtCon
                                                              .fullResidentAddress
                                                              .value
                                                              .streetNo,
                                                          houseNo: debtCon
                                                              .fullResidentAddress
                                                              .value
                                                              .houseNo,
                                                          onCancel: () {
                                                            reqCon
                                                                .residentAddressList
                                                                .clear();
                                                          },
                                                          selectAddress: reqCon
                                                              .residentAddressList,
                                                          onSelectProvince:
                                                              (Address
                                                                  province) {
                                                            reqCon.districtList
                                                                .clear();
                                                            reqCon.getDistrict(
                                                                province.code!,
                                                                'en');
                                                            if (!reqCon
                                                                .residentAddressList
                                                                .contains(
                                                                    province)) {
                                                              reqCon
                                                                  .residentAddressList
                                                                  .add(
                                                                      province);
                                                            }
                                                          },
                                                          onSelectCommune:
                                                              (Address
                                                                  commune) {
                                                            reqCon.villageList
                                                                .clear();
                                                            reqCon.getVillage(
                                                                commune.code!,
                                                                'en');
                                                            if (!reqCon
                                                                .residentAddressList
                                                                .contains(
                                                                    commune)) {
                                                              reqCon
                                                                  .residentAddressList
                                                                  .add(commune);
                                                            }
                                                          },
                                                          onSelectDistrict:
                                                              (Address
                                                                  disctrict) {
                                                            reqCon.communeList
                                                                .clear();
                                                            reqCon.getCommune(
                                                                disctrict.code!,
                                                                'en');
                                                            if (!reqCon
                                                                .residentAddressList
                                                                .contains(
                                                                    disctrict)) {
                                                              reqCon
                                                                  .residentAddressList
                                                                  .add(
                                                                      disctrict);
                                                            }
                                                          },
                                                          onSelectVillage:
                                                              (Address
                                                                  village) {
                                                            if (reqCon
                                                                    .residentAddressList
                                                                    .length !=
                                                                4) {
                                                              if (!reqCon
                                                                  .residentAddressList
                                                                  .contains(
                                                                      village)) {
                                                                reqCon
                                                                    .residentAddressList
                                                                    .add(
                                                                        village);
                                                              }
                                                            } else {
                                                              reqCon.residentAddressList[
                                                                  3] = village;
                                                            }
                                                          },
                                                          onDelete: (Address
                                                              address) {
                                                            if (address.code!
                                                                    .length ==
                                                                6) {
                                                              reqCon.villageList
                                                                  .clear();
                                                              reqCon.getVillage(
                                                                  address.code!,
                                                                  'en');
                                                            } else if (address
                                                                    .code!
                                                                    .length ==
                                                                4) {
                                                              reqCon.communeList
                                                                  .clear();
                                                              reqCon.getCommune(
                                                                  address.code!,
                                                                  'en');
                                                            } else {
                                                              reqCon
                                                                  .districtList
                                                                  .clear();
                                                              reqCon.getDistrict(
                                                                  address.code!,
                                                                  'en');
                                                            }
                                                            if (debtCon
                                                                    .currentAddress
                                                                    .value
                                                                    .addressList !=
                                                                null) {}
                                                          },
                                                          communeList: reqCon
                                                              .communeList,
                                                          provinceList: reqCon
                                                              .provinceList,
                                                          villageList: reqCon
                                                              .villageList,
                                                          districtList: reqCon
                                                              .districtList,
                                                        ))!;
                                                        setState(() {
                                                          debtCon
                                                                  .fullResidentAddress
                                                                  .value
                                                                  .addressList![0] =
                                                              debtCon
                                                                  .residentAddress
                                                                  .value
                                                                  .addressList![0];
                                                          debtCon
                                                                  .fullResidentAddress
                                                                  .value
                                                                  .addressList![1] =
                                                              debtCon
                                                                  .residentAddress
                                                                  .value
                                                                  .addressList![1];
                                                          debtCon
                                                                  .fullResidentAddress
                                                                  .value
                                                                  .addressList![2] =
                                                              debtCon
                                                                  .residentAddress
                                                                  .value
                                                                  .addressList![2];
                                                          debtCon
                                                                  .fullResidentAddress
                                                                  .value
                                                                  .addressList![3] =
                                                              debtCon
                                                                  .residentAddress
                                                                  .value
                                                                  .addressList![3];
                                                          debtCon
                                                                  .fullResidentAddress
                                                                  .value
                                                                  .streetNo =
                                                              debtCon
                                                                  .residentAddress
                                                                  .value
                                                                  .streetNo;
                                                          debtCon
                                                                  .fullResidentAddress
                                                                  .value
                                                                  .houseNo =
                                                              debtCon
                                                                  .residentAddress
                                                                  .value
                                                                  .houseNo;
                                                        });
                                                        setState(() {
                                                          tempData.perHouseNo =
                                                              debtCon
                                                                  .residentAddress
                                                                  .value
                                                                  .houseNo;
                                                          tempData.perStreetNo =
                                                              debtCon
                                                                  .residentAddress
                                                                  .value
                                                                  .streetNo;
                                                          tempData.perCity =
                                                              debtCon
                                                                  .residentAddress
                                                                  .value
                                                                  .addressList![
                                                                      0]
                                                                  .name;
                                                          tempData.perDis =
                                                              debtCon
                                                                  .residentAddress
                                                                  .value
                                                                  .addressList![
                                                                      1]
                                                                  .name;
                                                          tempData.perCom =
                                                              debtCon
                                                                  .residentAddress
                                                                  .value
                                                                  .addressList![
                                                                      2]
                                                                  .name;
                                                          tempData.perVil =
                                                              debtCon
                                                                  .residentAddress
                                                                  .value
                                                                  .addressList![
                                                                      3]
                                                                  .name;
                                                        });
                                                      },
                                                      selectAddress: debtCon
                                                                  .fullResidentAddress
                                                                  .value
                                                                  .addressList![
                                                                      0]
                                                                  .name !=
                                                              ""
                                                          ? debtCon
                                                                      .fullResidentAddress
                                                                      .value
                                                                      .addressList![
                                                                          3]
                                                                      .name ==
                                                                  ""
                                                              ? '${debtCon.fullResidentAddress.value.streetNo} ${debtCon.fullResidentAddress.value.houseNo} ${debtCon.fullResidentAddress.value.addressList![2].name} ${debtCon.fullResidentAddress.value.addressList![1].name} ${debtCon.fullResidentAddress.value.addressList![0].name}'
                                                              : '${debtCon.fullResidentAddress.value.streetNo} ${debtCon.fullResidentAddress.value.houseNo} ${debtCon.fullResidentAddress.value.addressList![3].name} ${debtCon.fullResidentAddress.value.addressList![2].name} ${debtCon.fullResidentAddress.value.addressList![1].name} ${debtCon.fullResidentAddress.value.addressList![0].name} '
                                                          : null,
                                                      title:
                                                          'Permanent Address',
                                                    ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 20, right: 20, bottom: 30),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: CustomButton(
                                            isDisable: tempData == defualtData
                                                ? true
                                                : false,
                                            isOutline: true,
                                            onPressed: () async {
                                              if (widget.applicationDetail !=
                                                  null) {
                                                FirebaseAnalyticsHelper
                                                    .sendAnalyticsEvent(
                                                        "Debt Update Draft Step1");
                                              } else {
                                                FirebaseAnalyticsHelper
                                                    .sendAnalyticsEvent(
                                                        "Debt Save Draft Step1");
                                              }
                                              widget.applicationDetail != null
                                                  ? await debtCon
                                                      .onEditDebtInvestment(
                                                      context: context,
                                                      id: widget
                                                          .applicationDetail!
                                                          .id,
                                                      step: 1,
                                                      updateType:
                                                          'draft_to_draft',
                                                    )
                                                  : await debtCon
                                                      .onSubmitDebtInvestment(
                                                          context: context,
                                                          step: 1);
                                              debtCon.currentAddressList
                                                  .clear();
                                              debtCon.isValidateFullName.value =
                                                  true;
                                              debtCon.isValidateDateOfBirth
                                                  .value = true;
                                              debtCon.isValidateGender.value =
                                                  true;
                                              debtCon.isValidateEmail.value =
                                                  true;
                                              debtCon.isValidatePhone.value =
                                                  true;
                                              debtCon.isValidateFullAddress
                                                  .value = true;
                                              Future.delayed(Duration.zero)
                                                  .then((_) {
                                                FocusScope.of(context)
                                                    .unfocus();
                                                Navigator.of(context).pop();
                                              });
                                            },
                                            title: widget.isDraft == "true"
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
                                            onPressed: () {
                                              _onValidate();
                                            },
                                            title: 'Next',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
