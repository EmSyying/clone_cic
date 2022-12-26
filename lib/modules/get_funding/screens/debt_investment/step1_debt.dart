import 'package:cicgreenloan/Utils/helper/color.dart';
import 'package:cicgreenloan/modules/get_funding/models/equatable_debt_model.dart';
import 'package:cicgreenloan/Utils/helper/option_model/gender.dart';
import 'package:cicgreenloan/Utils/helper/option_model/option_model.dart';
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
import 'package:cicgreenloan/widgets/get_funding/address_picker.dart';
import 'package:cicgreenloan/widgets/get_funding/custom_chips.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../Utils/helper/container_partern.dart';
import '../../../../Utils/helper/custom_appbar_colorswhite.dart';
import '../../../../Utils/helper/firebase_analytics.dart';
import '../../../../Utils/helper/injection_helper/injection_helper.dart';
import '../../../../widgets/get_funding/custom_call_center.dart';

class Step1Debt extends StatefulWidget {
  final int? id;
  final int? step;
  const Step1Debt({Key? key, this.id, this.step}) : super(key: key);

  @override
  State<Step1Debt> createState() => _Step1DebtState();
}

class _Step1DebtState extends State<Step1Debt> {
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
    if (InjectionHelper.debtInvestmentController.fullName.value == '') {
      InjectionHelper.debtInvestmentController.isValidateFullName.value = false;
    } else {
      InjectionHelper.debtInvestmentController.isValidateFullName.value = true;
    }
    if (InjectionHelper.debtInvestmentController.dateOfBirth.value == "") {
      InjectionHelper.debtInvestmentController.isValidateDateOfBirth.value =
          false;
    } else {
      InjectionHelper.debtInvestmentController.isValidateDateOfBirth.value =
          true;
    }
    if (InjectionHelper.debtInvestmentController.gender.value.display != null) {
      InjectionHelper.debtInvestmentController.isValidateGender.value = true;
    } else {
      InjectionHelper.debtInvestmentController.isValidateGender.value = false;
    }
    if (InjectionHelper.debtInvestmentController.email.value == "") {
      InjectionHelper.debtInvestmentController.isValidateEmail.value = false;
    } else {
      InjectionHelper.debtInvestmentController.isValidateEmail.value = true;
    }
    if (InjectionHelper.debtInvestmentController.phoneNumber.value == "") {
      InjectionHelper.debtInvestmentController.isValidatePhone.value = false;
    } else {
      InjectionHelper.debtInvestmentController.isValidatePhone.value = true;
    }

    if (InjectionHelper.requestLoanController.selectedAddressOption.value ==
        0) {
      InjectionHelper.debtInvestmentController.fullResidentAddress.value =
          InjectionHelper.debtInvestmentController.fullCurrentAddress.value;
      InjectionHelper
          .debtInvestmentController.isValidatePermenantAddress.value = true;
    }
    if (InjectionHelper
                .debtInvestmentController.fullCurrentAddress.value.streetNo !=
            "" &&
        InjectionHelper
                .debtInvestmentController.fullCurrentAddress.value.houseNo !=
            "" &&
        InjectionHelper.debtInvestmentController.fullCurrentAddress.value
                .addressList![0].name !=
            "" &&
        InjectionHelper.debtInvestmentController.fullCurrentAddress.value
                .addressList![1].name !=
            "" &&
        InjectionHelper.debtInvestmentController.fullCurrentAddress.value
                .addressList![2].name !=
            "") {
      InjectionHelper.debtInvestmentController.isValidateFullAddress.value =
          true;
    } else {
      if (InjectionHelper.memberController.personalProfile.value.currentAddress!
              .city!.code !=
          '') {
        InjectionHelper.debtInvestmentController.isValidateFullAddress.value =
            true;
      } else {
        InjectionHelper.debtInvestmentController.isValidateFullAddress.value =
            false;
      }
    }
    if (InjectionHelper.debtInvestmentController.fullResidentAddress.value.streetNo != "" &&
        InjectionHelper
                .debtInvestmentController.fullResidentAddress.value.houseNo !=
            "" &&
        InjectionHelper.debtInvestmentController.fullResidentAddress.value
                .addressList![0].name !=
            "" &&
        InjectionHelper.debtInvestmentController.fullResidentAddress.value
                .addressList![1].name !=
            "" &&
        InjectionHelper.debtInvestmentController.fullResidentAddress.value
                .addressList![2].name !=
            "") {
      InjectionHelper
          .debtInvestmentController.isValidatePermenantAddress.value = true;
    } else {
      if (InjectionHelper.memberController.personalProfile.value
              .permanentAddress!.city!.code !=
          '') {
        InjectionHelper
            .debtInvestmentController.isValidatePermenantAddress.value = true;
      } else {
        InjectionHelper
            .debtInvestmentController.isValidatePermenantAddress.value = false;
      }
    }
    if (InjectionHelper.debtInvestmentController.fullName.value != '' &&
        InjectionHelper.debtInvestmentController.dateOfBirth.value != "" &&
        InjectionHelper.debtInvestmentController.gender.value.display != null &&
        InjectionHelper.debtInvestmentController.email.value != "" &&
        InjectionHelper.debtInvestmentController.phoneNumber.value != "" &&
        InjectionHelper
                .debtInvestmentController.isValidatePermenantAddress.value ==
            true &&
        InjectionHelper.debtInvestmentController.isValidateFullAddress.value ==
            true) {
      FocusScope.of(context).unfocus();
      context
          .push("/get_funding/debt-step2?id=${widget.id}&&step=${widget.step}");
    }
  }

  void onCheck() {
    defualtData = DebtStep1Model(
      fullName: InjectionHelper.debtInvestmentController.fullName.value,
      dateOfBirth: InjectionHelper.debtInvestmentController.dateOfBirth.value,
      email: InjectionHelper.debtInvestmentController.email.value,
      phoneNumber: InjectionHelper.debtInvestmentController.phoneNumber.value,
      addIndex:
          InjectionHelper.requestLoanController.selectedAddressOption.value,
      gender: InjectionHelper.debtInvestmentController.gender.value,
      city: InjectionHelper
          .memberController.personalProfile.value.currentAddress!.city!.name,
      dis: InjectionHelper.memberController.personalProfile.value
          .currentAddress!.district!.name,
      com: InjectionHelper
          .memberController.personalProfile.value.currentAddress!.commune!.name,
      vil: InjectionHelper
          .memberController.personalProfile.value.currentAddress!.village!.name,
      currHouseNo:
          InjectionHelper.memberController.personalProfile.value.houseNo,
      currStreetNo:
          InjectionHelper.memberController.personalProfile.value.streetNo,
      perCity: InjectionHelper
          .memberController.personalProfile.value.permanentAddress!.city!.name,
      perDis: InjectionHelper.memberController.personalProfile.value
          .permanentAddress!.district!.name,
      perCom: InjectionHelper.memberController.personalProfile.value
          .permanentAddress!.commune!.name,
      perVil: InjectionHelper.memberController.personalProfile.value
          .permanentAddress!.village!.name,
      perHouseNo: InjectionHelper
          .memberController.personalProfile.value.permanentHouseNo,
      perStreetNo:
          InjectionHelper.memberController.personalProfile.value.streetNo,
    );
    tempData = DebtStep1Model(
      fullName: InjectionHelper.debtInvestmentController.fullName.value,
      dateOfBirth: InjectionHelper.debtInvestmentController.dateOfBirth.value,
      email: InjectionHelper.debtInvestmentController.email.value,
      phoneNumber: InjectionHelper.debtInvestmentController.phoneNumber.value,
      addIndex:
          InjectionHelper.requestLoanController.selectedAddressOption.value,
      gender: InjectionHelper.debtInvestmentController.gender.value,
      city: InjectionHelper
          .memberController.personalProfile.value.currentAddress!.city!.name,
      dis: InjectionHelper.memberController.personalProfile.value
          .currentAddress!.district!.name,
      com: InjectionHelper
          .memberController.personalProfile.value.currentAddress!.commune!.name,
      vil: InjectionHelper
          .memberController.personalProfile.value.currentAddress!.village!.name,
      currHouseNo:
          InjectionHelper.memberController.personalProfile.value.houseNo,
      currStreetNo:
          InjectionHelper.memberController.personalProfile.value.streetNo,
      perCity: InjectionHelper
          .memberController.personalProfile.value.permanentAddress!.city!.name,
      perDis: InjectionHelper.memberController.personalProfile.value
          .permanentAddress!.district!.name,
      perCom: InjectionHelper.memberController.personalProfile.value
          .permanentAddress!.commune!.name,
      perVil: InjectionHelper.memberController.personalProfile.value
          .permanentAddress!.village!.name,
      perHouseNo: InjectionHelper
          .memberController.personalProfile.value.permanentHouseNo,
      perStreetNo:
          InjectionHelper.memberController.personalProfile.value.streetNo,
    );
  }

  @override
  void initState() {
    InjectionHelper.requestLoanController.getGender();
    InjectionHelper.requestLoanController.getPurposeList();

    InjectionHelper.debtInvestmentController.selectAddIndex.value =
        InjectionHelper.requestLoanController.selectedAddressOption.value;

    InjectionHelper.memberController
        .fetchMemberPersonProfile(
            id: InjectionHelper.customerController.customer.value.customerId!)
        .then(
      (customer) {
        // InjectionHelper.requestLoanController.purpose.value = Purpose();

        if (customer.name!.isNotEmpty) {
          InjectionHelper.debtInvestmentController.fullName.value =
              InjectionHelper.customerController.customer.value.fullName!;
        }
        if (customer.customerDateOfBirth != '') {
          InjectionHelper.debtInvestmentController.dateOfBirth.value =
              customer.customerDateOfBirth!;
        }
        if (customer.customerGender!.display! != '') {
          InjectionHelper.debtInvestmentController.gender.value = Optionmodel(
              id: customer.customerGender!.id!,
              display: customer.customerGender!.display!);
          if (customer.customerGender!.display! == 'Male') {
            InjectionHelper.debtInvestmentController.selectedIndexGender.value =
                0;
          } else {
            InjectionHelper.debtInvestmentController.selectedIndexGender.value =
                1;
          }
        }
        if (customer.email! != '') {
          InjectionHelper.debtInvestmentController.email.value =
              customer.email!;
        }
        if (customer.phone! != '') {
          InjectionHelper.debtInvestmentController.phoneNumber.value =
              customer.phone!;
        }
        if (InjectionHelper
                .memberController.personalProfile.value.currentAddress !=
            null) {
          InjectionHelper.debtInvestmentController.fullCurrentAddress.value =
              FullAddress(
            houseNo: InjectionHelper
                    .memberController.personalProfile.value.houseNo ??
                "",
            streetNo: InjectionHelper
                    .memberController.personalProfile.value.streetNo ??
                "",
            addressList: [
              Address(
                code: InjectionHelper.memberController.personalProfile.value
                    .currentAddress!.city!.code,
                name: InjectionHelper.memberController.personalProfile.value
                    .currentAddress!.city!.name,
              ),
              Address(
                code: InjectionHelper.memberController.personalProfile.value
                    .currentAddress!.district!.code,
                name: InjectionHelper.memberController.personalProfile.value
                    .currentAddress!.district!.name,
              ),
              Address(
                code: InjectionHelper.memberController.personalProfile.value
                    .currentAddress!.commune!.code,
                name: InjectionHelper.memberController.personalProfile.value
                    .currentAddress!.commune!.name,
              ),
              Address(
                code: InjectionHelper.memberController.personalProfile.value
                        .currentAddress!.village!.code ??
                    "",
                name: InjectionHelper.memberController.personalProfile.value
                        .currentAddress!.village!.name ??
                    "",
              ),
            ],
          );
          if (InjectionHelper
                  .memberController.personalProfile.value.permanentAddress !=
              null) {
            InjectionHelper.debtInvestmentController.fullResidentAddress.value =
                FullAddress(
              houseNo: InjectionHelper.memberController.personalProfile.value
                      .permanentHouseNo ??
                  "",
              streetNo: InjectionHelper.memberController.personalProfile.value
                      .permanentStreetNo ??
                  "",
              addressList: [
                Address(
                  code: InjectionHelper.memberController.personalProfile.value
                      .permanentAddress!.city!.code,
                  name: InjectionHelper.memberController.personalProfile.value
                      .permanentAddress!.city!.name,
                ),
                Address(
                  code: InjectionHelper.memberController.personalProfile.value
                      .permanentAddress!.district!.code,
                  name: InjectionHelper.memberController.personalProfile.value
                      .permanentAddress!.district!.name,
                ),
                Address(
                  code: InjectionHelper.memberController.personalProfile.value
                      .permanentAddress!.commune!.code,
                  name: InjectionHelper.memberController.personalProfile.value
                      .permanentAddress!.commune!.name,
                ),
                Address(
                  code: InjectionHelper.memberController.personalProfile.value
                          .permanentAddress!.village!.code ??
                      "",
                  name: InjectionHelper.memberController.personalProfile.value
                          .permanentAddress!.village!.name ??
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
    InjectionHelper.debtInvestmentController.isValidateFullName.value = true;
    InjectionHelper.debtInvestmentController.isValidateDateOfBirth.value = true;
    InjectionHelper.debtInvestmentController.isValidateGender.value = true;
    InjectionHelper.debtInvestmentController.isValidateEmail.value = true;
    InjectionHelper.debtInvestmentController.isValidatePhone.value = true;
    InjectionHelper.debtInvestmentController.isValidateFullAddress.value = true;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoScaffold(
      body: Builder(
        builder: (context) => CupertinoPageScaffold(
          child: WillPopScope(
            onWillPop: () async => false,
            child: Obx(
              () => InjectionHelper
                      .debtInvestmentController.isLoadingSubmit.value
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
                      appBar: CustomAppBarWhiteColor(
                        context: context,
                        leading: IconButton(
                          onPressed: tempData == defualtData
                              ? () {
                                  Navigator.pop(context);
                                }
                              : () {
                                  FocusScope.of(context).unfocus();
                                  InjectionHelper.debtInvestmentController
                                      .currentAddressList
                                      .clear();
                                  InjectionHelper.debtInvestmentController
                                      .isValidateFullName.value = true;
                                  InjectionHelper.debtInvestmentController
                                      .isValidateDateOfBirth.value = true;
                                  InjectionHelper.debtInvestmentController
                                      .isValidateGender.value = true;
                                  InjectionHelper.debtInvestmentController
                                      .isValidateEmail.value = true;
                                  InjectionHelper.debtInvestmentController
                                      .isValidatePhone.value = true;
                                  InjectionHelper.debtInvestmentController
                                      .isValidateFullAddress.value = true;

                                  showSaveDraftDialog(
                                    context: context,
                                    onSaveTitle: widget.id != null
                                        ? "Update Draft"
                                        : "Save Draft",
                                    content:
                                        'Changes made to this page haven’t been saved yet.',
                                    title:
                                        'Are you sure you want to leave this page?',
                                    onSave: () async {
                                      context.pop();
                                      widget.id != null
                                          ? await InjectionHelper
                                              .debtInvestmentController
                                              .onEditDebtInvestment(
                                              context: context,
                                              id: widget.id,
                                              step: 1,
                                            )
                                          : await InjectionHelper
                                              .debtInvestmentController
                                              .onSubmitDebtInvestment(
                                                  context: context, step: 1);

                                      onResetValidate();
                                      Future.delayed(Duration.zero).then((_) {
                                        FocusScope.of(context).unfocus();
                                        context.pop();
                                      });
                                    },
                                    isCancel: true,
                                    onDiscard: () {
                                      context.pop();
                                      context.push("/get_funding");
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
                        () => InjectionHelper
                                .memberController.isLoadingProfile.value
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
                                                    isValidate: InjectionHelper
                                                        .debtInvestmentController
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
                                                        InjectionHelper
                                                            .debtInvestmentController
                                                            .fullName
                                                            .value = '';
                                                        InjectionHelper
                                                            .debtInvestmentController
                                                            .isValidateFullName
                                                            .value = false;
                                                      } else {
                                                        InjectionHelper
                                                            .debtInvestmentController
                                                            .fullName
                                                            .value = value;
                                                        InjectionHelper
                                                            .debtInvestmentController
                                                            .isValidateFullName
                                                            .value = true;
                                                      }
                                                    },
                                                    initialValue: InjectionHelper
                                                        .debtInvestmentController
                                                        .fullName
                                                        .value,
                                                    onSave: ((value) {
                                                      InjectionHelper
                                                          .debtInvestmentController
                                                          .fullName
                                                          .value = value!;
                                                    }),
                                                  ),
                                                  CICDropdown(
                                                    isValidate: InjectionHelper
                                                        .debtInvestmentController
                                                        .isValidateDateOfBirth
                                                        .value,
                                                    label: 'Date of birth ',
                                                    onChange: (value) {
                                                      InjectionHelper
                                                          .debtInvestmentController
                                                          .dateOfBirth
                                                          .value = value["Name"];
                                                      InjectionHelper
                                                          .debtInvestmentController
                                                          .isValidateDateOfBirth
                                                          .value = true;
                                                      setState(() {
                                                        tempData.dateOfBirth =
                                                            InjectionHelper
                                                                .debtInvestmentController
                                                                .dateOfBirth
                                                                .value;
                                                      });
                                                    },
                                                    defaultValue: InjectionHelper
                                                                .debtInvestmentController
                                                                .dateOfBirth
                                                                .value !=
                                                            ""
                                                        ? {
                                                            'Name': InjectionHelper
                                                                .debtInvestmentController
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
                                                        children: InjectionHelper
                                                            .optionController
                                                            .optionData
                                                            .value
                                                            .gender!
                                                            .asMap()
                                                            .entries
                                                            .map((e) {
                                                          return GestureDetector(
                                                            onTap: () {
                                                              InjectionHelper
                                                                      .debtInvestmentController
                                                                      .gender
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
                                                                    InjectionHelper
                                                                        .debtInvestmentController
                                                                        .gender
                                                                        .value;
                                                              });
                                                              InjectionHelper
                                                                  .debtInvestmentController
                                                                  .selectedIndexGender
                                                                  .value = e.key;
                                                              InjectionHelper
                                                                  .debtInvestmentController
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
                                                              currentIndex: InjectionHelper
                                                                          .debtInvestmentController
                                                                          .gender
                                                                          .value
                                                                          .display ==
                                                                      null
                                                                  ? null
                                                                  : e.key,
                                                              selectIndex:
                                                                  InjectionHelper
                                                                      .debtInvestmentController
                                                                      .selectedIndexGender
                                                                      .value,
                                                            ),
                                                          );
                                                        }).toList(),
                                                      ),
                                                    ),
                                                  ),
                                                  if (InjectionHelper
                                                          .debtInvestmentController
                                                          .isValidateGender
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
                                                    isValidate: InjectionHelper
                                                        .debtInvestmentController
                                                        .isValidateEmail
                                                        .value,
                                                    labelText: 'Email',
                                                    hintText: 'Enter email',
                                                    onChange: (value) {
                                                      if (value.isEmpty) {
                                                        InjectionHelper
                                                            .debtInvestmentController
                                                            .email
                                                            .value = '';
                                                        InjectionHelper
                                                            .debtInvestmentController
                                                            .isValidateEmail
                                                            .value = false;
                                                      } else {
                                                        InjectionHelper
                                                            .debtInvestmentController
                                                            .email
                                                            .value = value;
                                                        InjectionHelper
                                                            .debtInvestmentController
                                                            .isValidateEmail
                                                            .value = true;
                                                      }
                                                      setState(() {
                                                        tempData.email =
                                                            InjectionHelper
                                                                .debtInvestmentController
                                                                .email
                                                                .value;
                                                      });
                                                    },
                                                    onSave: ((value) {
                                                      InjectionHelper
                                                          .debtInvestmentController
                                                          .email
                                                          .value = value!;
                                                    }),
                                                    initialValue: InjectionHelper
                                                        .debtInvestmentController
                                                        .email
                                                        .value,
                                                    keyboardType: TextInputType
                                                        .emailAddress,
                                                  ),
                                                  CustomTextFieldNew(
                                                    maxLine: 1,
                                                    isReadOnly: true,
                                                    isRequired: true,
                                                    isValidate: InjectionHelper
                                                        .debtInvestmentController
                                                        .isValidatePhone
                                                        .value,
                                                    onSave: ((value) {
                                                      InjectionHelper
                                                          .debtInvestmentController
                                                          .phoneNumber
                                                          .value = value!;
                                                    }),
                                                    labelText: 'Phone',
                                                    hintText:
                                                        'Enter your phone number',
                                                    initialValue: InjectionHelper
                                                        .debtInvestmentController
                                                        .phoneNumber
                                                        .value,
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
                                                          if (InjectionHelper
                                                                  .requestLoanController
                                                                  .selectedAddressOption
                                                                  .value !=
                                                              e.key) {
                                                            InjectionHelper
                                                                .requestLoanController
                                                                .selectedAddressOption
                                                                .value = e.key;
                                                          } else {
                                                            InjectionHelper
                                                                .requestLoanController
                                                                .selectedAddressOption
                                                                .value = 1;
                                                          }
                                                          InjectionHelper
                                                              .requestLoanController
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
                                                          selectIndex: InjectionHelper
                                                              .requestLoanController
                                                              .selectedAddressOption
                                                              .value,
                                                        ),
                                                      );
                                                    }).toList()),
                                                  ),
                                                  const SizedBox(height: 30.0),
                                                  AddressPickerWidget(
                                                    isValidate: InjectionHelper
                                                        .debtInvestmentController
                                                        .isValidateFullAddress
                                                        .value,
                                                    onTap: () async {
                                                      if (InjectionHelper
                                                              .debtInvestmentController
                                                              .fullCurrentAddress
                                                              .value
                                                              .addressList![0]
                                                              .name ==
                                                          "") {
                                                        InjectionHelper
                                                            .requestLoanController
                                                            .getProvince("en");
                                                      } else {
                                                        if (InjectionHelper
                                                                .debtInvestmentController
                                                                .fullCurrentAddress
                                                                .value
                                                                .addressList![0]
                                                                .name !=
                                                            "") {
                                                          InjectionHelper
                                                              .requestLoanController
                                                              .currentAddressList
                                                              .value = [];
                                                          InjectionHelper
                                                              .requestLoanController
                                                              .getProvince(
                                                                  "en");

                                                          InjectionHelper
                                                              .requestLoanController
                                                              .currentAddressList
                                                              .add(InjectionHelper
                                                                  .debtInvestmentController
                                                                  .fullCurrentAddress
                                                                  .value
                                                                  .addressList![0]);
                                                          InjectionHelper
                                                              .requestLoanController
                                                              .getDistrict(
                                                                  InjectionHelper
                                                                      .debtInvestmentController
                                                                      .fullCurrentAddress
                                                                      .value
                                                                      .addressList![
                                                                          0]
                                                                      .code!,
                                                                  'en');
                                                        }

                                                        if (InjectionHelper
                                                                .debtInvestmentController
                                                                .fullCurrentAddress
                                                                .value
                                                                .addressList![1]
                                                                .name !=
                                                            "") {
                                                          InjectionHelper
                                                              .requestLoanController
                                                              .currentAddressList
                                                              .add(InjectionHelper
                                                                  .debtInvestmentController
                                                                  .fullCurrentAddress
                                                                  .value
                                                                  .addressList![1]);
                                                          InjectionHelper
                                                              .requestLoanController
                                                              .getCommune(
                                                                  InjectionHelper
                                                                      .debtInvestmentController
                                                                      .fullCurrentAddress
                                                                      .value
                                                                      .addressList![
                                                                          1]
                                                                      .code!,
                                                                  'en');
                                                        }
                                                        if (InjectionHelper
                                                                .debtInvestmentController
                                                                .fullCurrentAddress
                                                                .value
                                                                .addressList![2]
                                                                .name !=
                                                            "") {
                                                          InjectionHelper
                                                              .requestLoanController
                                                              .currentAddressList
                                                              .add(InjectionHelper
                                                                  .debtInvestmentController
                                                                  .fullCurrentAddress
                                                                  .value
                                                                  .addressList![2]);

                                                          InjectionHelper
                                                              .requestLoanController
                                                              .getVillage(
                                                                  InjectionHelper
                                                                      .debtInvestmentController
                                                                      .fullCurrentAddress
                                                                      .value
                                                                      .addressList![
                                                                          2]
                                                                      .code!,
                                                                  'en');
                                                        }
                                                        if (InjectionHelper
                                                                .debtInvestmentController
                                                                .fullCurrentAddress
                                                                .value
                                                                .addressList![3]
                                                                .name !=
                                                            "") {
                                                          InjectionHelper
                                                              .requestLoanController
                                                              .currentAddressList
                                                              .add(InjectionHelper
                                                                  .debtInvestmentController
                                                                  .fullCurrentAddress
                                                                  .value
                                                                  .addressList![3]);
                                                        }
                                                      }

                                                      InjectionHelper
                                                              .debtInvestmentController
                                                              .currentAddress
                                                              .value =
                                                          (await onShowModalSheet(
                                                        currentAddress:
                                                            CurrentAddress(
                                                          city: InjectionHelper
                                                              .debtInvestmentController
                                                              .fullCurrentAddress
                                                              .value
                                                              .addressList![0],
                                                          commune: InjectionHelper
                                                              .debtInvestmentController
                                                              .fullCurrentAddress
                                                              .value
                                                              .addressList![1],
                                                          district: InjectionHelper
                                                              .debtInvestmentController
                                                              .fullCurrentAddress
                                                              .value
                                                              .addressList![2],
                                                          village: InjectionHelper
                                                              .debtInvestmentController
                                                              .fullCurrentAddress
                                                              .value
                                                              .addressList![3],
                                                        ),
                                                        context: context,
                                                        streetNo: InjectionHelper
                                                            .debtInvestmentController
                                                            .fullCurrentAddress
                                                            .value
                                                            .streetNo,
                                                        houseNo: InjectionHelper
                                                            .debtInvestmentController
                                                            .fullCurrentAddress
                                                            .value
                                                            .houseNo,
                                                        onCancel: () {
                                                          InjectionHelper
                                                              .requestLoanController
                                                              .currentAddressList
                                                              .clear();
                                                          // Navigator.pop(context);
                                                        },
                                                        selectAddress: InjectionHelper
                                                            .requestLoanController
                                                            .currentAddressList,
                                                        onSelectProvince:
                                                            (Address province) {
                                                          InjectionHelper
                                                              .requestLoanController
                                                              .districtList
                                                              .clear();
                                                          InjectionHelper
                                                              .requestLoanController
                                                              .getDistrict(
                                                                  province
                                                                      .code!,
                                                                  'en');
                                                          if (!InjectionHelper
                                                              .requestLoanController
                                                              .currentAddressList
                                                              .contains(
                                                                  province)) {
                                                            InjectionHelper
                                                                .requestLoanController
                                                                .currentAddressList
                                                                .add(province);
                                                          }
                                                        },
                                                        onSelectCommune:
                                                            (Address commune) {
                                                          InjectionHelper
                                                              .requestLoanController
                                                              .villageList
                                                              .clear();
                                                          InjectionHelper
                                                              .requestLoanController
                                                              .getVillage(
                                                                  commune.code!,
                                                                  'en');
                                                          if (!InjectionHelper
                                                              .requestLoanController
                                                              .currentAddressList
                                                              .contains(
                                                                  commune)) {
                                                            InjectionHelper
                                                                .requestLoanController
                                                                .currentAddressList
                                                                .add(commune);
                                                          }
                                                        },
                                                        onSelectDistrict:
                                                            (Address
                                                                disctrict) {
                                                          InjectionHelper
                                                              .requestLoanController
                                                              .communeList
                                                              .clear();
                                                          InjectionHelper
                                                              .requestLoanController
                                                              .getCommune(
                                                                  disctrict
                                                                      .code!,
                                                                  'en');
                                                          if (!InjectionHelper
                                                              .requestLoanController
                                                              .currentAddressList
                                                              .contains(
                                                                  disctrict)) {
                                                            InjectionHelper
                                                                .requestLoanController
                                                                .currentAddressList
                                                                .add(disctrict);
                                                          }
                                                        },
                                                        onSelectVillage:
                                                            (Address village) {
                                                          if (InjectionHelper
                                                                  .requestLoanController
                                                                  .currentAddressList
                                                                  .length !=
                                                              4) {
                                                            if (!InjectionHelper
                                                                .requestLoanController
                                                                .currentAddressList
                                                                .contains(
                                                                    village)) {
                                                              InjectionHelper
                                                                  .requestLoanController
                                                                  .currentAddressList
                                                                  .add(village);
                                                            }
                                                          } else {
                                                            InjectionHelper
                                                                    .requestLoanController
                                                                    .currentAddressList[
                                                                3] = village;
                                                          }
                                                        },
                                                        onDelete:
                                                            (Address address) {
                                                          if (address.code!
                                                                  .length ==
                                                              6) {
                                                            InjectionHelper
                                                                .requestLoanController
                                                                .villageList
                                                                .clear();
                                                            InjectionHelper
                                                                .requestLoanController
                                                                .getVillage(
                                                                    address
                                                                        .code!,
                                                                    'en');
                                                          } else if (address
                                                                  .code!
                                                                  .length ==
                                                              4) {
                                                            InjectionHelper
                                                                .requestLoanController
                                                                .communeList
                                                                .clear();
                                                            InjectionHelper
                                                                .requestLoanController
                                                                .getCommune(
                                                                    address
                                                                        .code!,
                                                                    'en');
                                                          } else {
                                                            InjectionHelper
                                                                .requestLoanController
                                                                .districtList
                                                                .clear();
                                                            InjectionHelper
                                                                .requestLoanController
                                                                .getDistrict(
                                                                    address
                                                                        .code!,
                                                                    'en');
                                                          }
                                                        },
                                                        communeList: InjectionHelper
                                                            .requestLoanController
                                                            .communeList,
                                                        provinceList:
                                                            InjectionHelper
                                                                .requestLoanController
                                                                .provinceList,
                                                        villageList: InjectionHelper
                                                            .requestLoanController
                                                            .villageList,
                                                        districtList:
                                                            InjectionHelper
                                                                .requestLoanController
                                                                .districtList,
                                                      ))!;
                                                      InjectionHelper
                                                              .debtInvestmentController
                                                              .fullCurrentAddress
                                                              .value
                                                              .addressList![0] =
                                                          InjectionHelper
                                                              .debtInvestmentController
                                                              .currentAddress
                                                              .value
                                                              .addressList![0];
                                                      InjectionHelper
                                                              .debtInvestmentController
                                                              .fullCurrentAddress
                                                              .value
                                                              .addressList![1] =
                                                          InjectionHelper
                                                              .debtInvestmentController
                                                              .currentAddress
                                                              .value
                                                              .addressList![1];
                                                      InjectionHelper
                                                              .debtInvestmentController
                                                              .fullCurrentAddress
                                                              .value
                                                              .addressList![2] =
                                                          InjectionHelper
                                                              .debtInvestmentController
                                                              .currentAddress
                                                              .value
                                                              .addressList![2];
                                                      InjectionHelper
                                                              .debtInvestmentController
                                                              .fullCurrentAddress
                                                              .value
                                                              .addressList![3] =
                                                          InjectionHelper
                                                              .debtInvestmentController
                                                              .currentAddress
                                                              .value
                                                              .addressList![3];
                                                      InjectionHelper
                                                              .debtInvestmentController
                                                              .fullCurrentAddress
                                                              .value
                                                              .streetNo =
                                                          InjectionHelper
                                                              .debtInvestmentController
                                                              .currentAddress
                                                              .value
                                                              .streetNo;
                                                      InjectionHelper
                                                              .debtInvestmentController
                                                              .fullCurrentAddress
                                                              .value
                                                              .houseNo =
                                                          InjectionHelper
                                                              .debtInvestmentController
                                                              .currentAddress
                                                              .value
                                                              .houseNo;

                                                      if (InjectionHelper
                                                              .debtInvestmentController
                                                              .fullCurrentAddress
                                                              .value
                                                              .addressList !=
                                                          null) {
                                                        InjectionHelper
                                                            .debtInvestmentController
                                                            .isValidateFullAddress
                                                            .value = true;
                                                        InjectionHelper
                                                            .debtInvestmentController
                                                            .fullCurrentAddress
                                                            .refresh();
                                                        InjectionHelper
                                                            .debtInvestmentController
                                                            .update();
                                                        setState(() {
                                                          tempData.currHouseNo =
                                                              InjectionHelper
                                                                  .debtInvestmentController
                                                                  .fullCurrentAddress
                                                                  .value
                                                                  .houseNo;
                                                          tempData.currStreetNo =
                                                              InjectionHelper
                                                                  .debtInvestmentController
                                                                  .fullCurrentAddress
                                                                  .value
                                                                  .streetNo;
                                                          tempData.city =
                                                              InjectionHelper
                                                                  .debtInvestmentController
                                                                  .fullCurrentAddress
                                                                  .value
                                                                  .addressList![
                                                                      0]
                                                                  .name;
                                                          tempData.dis = InjectionHelper
                                                              .debtInvestmentController
                                                              .fullCurrentAddress
                                                              .value
                                                              .addressList![1]
                                                              .name;
                                                          tempData.com = InjectionHelper
                                                              .debtInvestmentController
                                                              .fullCurrentAddress
                                                              .value
                                                              .addressList![2]
                                                              .name;
                                                          tempData.vil = InjectionHelper
                                                              .debtInvestmentController
                                                              .fullCurrentAddress
                                                              .value
                                                              .addressList![3]
                                                              .name;
                                                        });
                                                      }
                                                    },
                                                    selectAddress: InjectionHelper
                                                                .debtInvestmentController
                                                                .fullCurrentAddress
                                                                .value
                                                                .addressList![0]
                                                                .name !=
                                                            ""
                                                        ? InjectionHelper
                                                                    .debtInvestmentController
                                                                    .fullCurrentAddress
                                                                    .value
                                                                    .addressList![
                                                                        3]
                                                                    .name ==
                                                                ""
                                                            ? '${InjectionHelper.debtInvestmentController.fullCurrentAddress.value.streetNo} ${InjectionHelper.debtInvestmentController.fullCurrentAddress.value.houseNo} ${InjectionHelper.debtInvestmentController.fullCurrentAddress.value.addressList![2].name} ${InjectionHelper.debtInvestmentController.fullCurrentAddress.value.addressList![1].name} ${InjectionHelper.debtInvestmentController.fullCurrentAddress.value.addressList![0].name}'
                                                            : '${InjectionHelper.debtInvestmentController.fullCurrentAddress.value.streetNo} ${InjectionHelper.debtInvestmentController.fullCurrentAddress.value.houseNo} ${InjectionHelper.debtInvestmentController.fullCurrentAddress.value.addressList![3].name} ${InjectionHelper.debtInvestmentController.fullCurrentAddress.value.addressList![2].name} ${InjectionHelper.debtInvestmentController.fullCurrentAddress.value.addressList![1].name} ${InjectionHelper.debtInvestmentController.fullCurrentAddress.value.addressList![0].name}'
                                                        : null,
                                                    title: 'Current Address',
                                                  ),
                                                  const SizedBox(height: 20.0),
                                                  if (InjectionHelper
                                                          .requestLoanController
                                                          .selectedAddressOption
                                                          .value ==
                                                      1)
                                                    AddressPickerWidget(
                                                      isValidate: InjectionHelper
                                                          .debtInvestmentController
                                                          .isValidatePermenantAddress
                                                          .value,
                                                      onTap: () async {
                                                        InjectionHelper
                                                            .requestLoanController
                                                            .residentAddressList
                                                            .clear();
                                                        if (InjectionHelper
                                                                .debtInvestmentController
                                                                .fullResidentAddress
                                                                .value
                                                                .addressList![0]
                                                                .name ==
                                                            "") {
                                                          InjectionHelper
                                                              .requestLoanController
                                                              .getProvince(
                                                                  "en");
                                                        } else {
                                                          if (InjectionHelper
                                                                  .debtInvestmentController
                                                                  .fullResidentAddress
                                                                  .value
                                                                  .addressList![
                                                                      0]
                                                                  .name !=
                                                              "") {
                                                            InjectionHelper
                                                                .requestLoanController
                                                                .residentAddressList
                                                                .value = [];
                                                            InjectionHelper
                                                                .requestLoanController
                                                                .getProvince(
                                                                    "en");

                                                            InjectionHelper
                                                                .requestLoanController
                                                                .residentAddressList
                                                                .add(InjectionHelper
                                                                    .debtInvestmentController
                                                                    .fullResidentAddress
                                                                    .value
                                                                    .addressList![0]);
                                                            InjectionHelper
                                                                .requestLoanController
                                                                .getDistrict(
                                                                    InjectionHelper
                                                                        .debtInvestmentController
                                                                        .fullResidentAddress
                                                                        .value
                                                                        .addressList![
                                                                            0]
                                                                        .code!,
                                                                    'en');
                                                          }

                                                          if (InjectionHelper
                                                                  .debtInvestmentController
                                                                  .fullResidentAddress
                                                                  .value
                                                                  .addressList![
                                                                      1]
                                                                  .name !=
                                                              "") {
                                                            InjectionHelper
                                                                .requestLoanController
                                                                .residentAddressList
                                                                .add(InjectionHelper
                                                                    .debtInvestmentController
                                                                    .fullResidentAddress
                                                                    .value
                                                                    .addressList![1]);
                                                            InjectionHelper
                                                                .requestLoanController
                                                                .getCommune(
                                                                    InjectionHelper
                                                                        .debtInvestmentController
                                                                        .fullResidentAddress
                                                                        .value
                                                                        .addressList![
                                                                            1]
                                                                        .code!,
                                                                    'en');
                                                          }
                                                          if (InjectionHelper
                                                                  .debtInvestmentController
                                                                  .fullResidentAddress
                                                                  .value
                                                                  .addressList![
                                                                      2]
                                                                  .name !=
                                                              "") {
                                                            InjectionHelper
                                                                .requestLoanController
                                                                .residentAddressList
                                                                .add(InjectionHelper
                                                                    .debtInvestmentController
                                                                    .fullResidentAddress
                                                                    .value
                                                                    .addressList![2]);

                                                            InjectionHelper
                                                                .requestLoanController
                                                                .getVillage(
                                                                    InjectionHelper
                                                                        .debtInvestmentController
                                                                        .fullResidentAddress
                                                                        .value
                                                                        .addressList![
                                                                            2]
                                                                        .code!,
                                                                    'en');
                                                          }
                                                          if (InjectionHelper
                                                                  .debtInvestmentController
                                                                  .fullResidentAddress
                                                                  .value
                                                                  .addressList![
                                                                      3]
                                                                  .name !=
                                                              "") {
                                                            InjectionHelper
                                                                .requestLoanController
                                                                .residentAddressList
                                                                .add(InjectionHelper
                                                                    .debtInvestmentController
                                                                    .fullResidentAddress
                                                                    .value
                                                                    .addressList![3]);
                                                          }
                                                        }

                                                        InjectionHelper
                                                                .debtInvestmentController
                                                                .residentAddress
                                                                .value =
                                                            (await onShowModalSheet(
                                                          permanentAddress:
                                                              CurrentAddress(
                                                            city: InjectionHelper
                                                                .debtInvestmentController
                                                                .fullResidentAddress
                                                                .value
                                                                .addressList![0],
                                                            commune: InjectionHelper
                                                                .debtInvestmentController
                                                                .fullResidentAddress
                                                                .value
                                                                .addressList![1],
                                                            district: InjectionHelper
                                                                .debtInvestmentController
                                                                .fullResidentAddress
                                                                .value
                                                                .addressList![2],
                                                            village: InjectionHelper
                                                                .debtInvestmentController
                                                                .fullResidentAddress
                                                                .value
                                                                .addressList![3],
                                                          ),
                                                          context: context,
                                                          streetNo: InjectionHelper
                                                              .debtInvestmentController
                                                              .fullResidentAddress
                                                              .value
                                                              .streetNo,
                                                          houseNo: InjectionHelper
                                                              .debtInvestmentController
                                                              .fullResidentAddress
                                                              .value
                                                              .houseNo,
                                                          onCancel: () {
                                                            InjectionHelper
                                                                .requestLoanController
                                                                .residentAddressList
                                                                .clear();
                                                          },
                                                          selectAddress: InjectionHelper
                                                              .requestLoanController
                                                              .residentAddressList,
                                                          onSelectProvince:
                                                              (Address
                                                                  province) {
                                                            InjectionHelper
                                                                .requestLoanController
                                                                .districtList
                                                                .clear();
                                                            InjectionHelper
                                                                .requestLoanController
                                                                .getDistrict(
                                                                    province
                                                                        .code!,
                                                                    'en');
                                                            if (!InjectionHelper
                                                                .requestLoanController
                                                                .residentAddressList
                                                                .contains(
                                                                    province)) {
                                                              InjectionHelper
                                                                  .requestLoanController
                                                                  .residentAddressList
                                                                  .add(
                                                                      province);
                                                            }
                                                          },
                                                          onSelectCommune:
                                                              (Address
                                                                  commune) {
                                                            InjectionHelper
                                                                .requestLoanController
                                                                .villageList
                                                                .clear();
                                                            InjectionHelper
                                                                .requestLoanController
                                                                .getVillage(
                                                                    commune
                                                                        .code!,
                                                                    'en');
                                                            if (!InjectionHelper
                                                                .requestLoanController
                                                                .residentAddressList
                                                                .contains(
                                                                    commune)) {
                                                              InjectionHelper
                                                                  .requestLoanController
                                                                  .residentAddressList
                                                                  .add(commune);
                                                            }
                                                          },
                                                          onSelectDistrict:
                                                              (Address
                                                                  disctrict) {
                                                            InjectionHelper
                                                                .requestLoanController
                                                                .communeList
                                                                .clear();
                                                            InjectionHelper
                                                                .requestLoanController
                                                                .getCommune(
                                                                    disctrict
                                                                        .code!,
                                                                    'en');
                                                            if (!InjectionHelper
                                                                .requestLoanController
                                                                .residentAddressList
                                                                .contains(
                                                                    disctrict)) {
                                                              InjectionHelper
                                                                  .requestLoanController
                                                                  .residentAddressList
                                                                  .add(
                                                                      disctrict);
                                                            }
                                                          },
                                                          onSelectVillage:
                                                              (Address
                                                                  village) {
                                                            if (InjectionHelper
                                                                    .requestLoanController
                                                                    .residentAddressList
                                                                    .length !=
                                                                4) {
                                                              if (!InjectionHelper
                                                                  .requestLoanController
                                                                  .residentAddressList
                                                                  .contains(
                                                                      village)) {
                                                                InjectionHelper
                                                                    .requestLoanController
                                                                    .residentAddressList
                                                                    .add(
                                                                        village);
                                                              }
                                                            } else {
                                                              InjectionHelper
                                                                      .requestLoanController
                                                                      .residentAddressList[
                                                                  3] = village;
                                                            }
                                                          },
                                                          onDelete: (Address
                                                              address) {
                                                            if (address.code!
                                                                    .length ==
                                                                6) {
                                                              InjectionHelper
                                                                  .requestLoanController
                                                                  .villageList
                                                                  .clear();
                                                              InjectionHelper
                                                                  .requestLoanController
                                                                  .getVillage(
                                                                      address
                                                                          .code!,
                                                                      'en');
                                                            } else if (address
                                                                    .code!
                                                                    .length ==
                                                                4) {
                                                              InjectionHelper
                                                                  .requestLoanController
                                                                  .communeList
                                                                  .clear();
                                                              InjectionHelper
                                                                  .requestLoanController
                                                                  .getCommune(
                                                                      address
                                                                          .code!,
                                                                      'en');
                                                            } else {
                                                              InjectionHelper
                                                                  .requestLoanController
                                                                  .districtList
                                                                  .clear();
                                                              InjectionHelper
                                                                  .requestLoanController
                                                                  .getDistrict(
                                                                      address
                                                                          .code!,
                                                                      'en');
                                                            }
                                                            if (InjectionHelper
                                                                    .debtInvestmentController
                                                                    .currentAddress
                                                                    .value
                                                                    .addressList !=
                                                                null) {}
                                                          },
                                                          communeList:
                                                              InjectionHelper
                                                                  .requestLoanController
                                                                  .communeList,
                                                          provinceList:
                                                              InjectionHelper
                                                                  .requestLoanController
                                                                  .provinceList,
                                                          villageList:
                                                              InjectionHelper
                                                                  .requestLoanController
                                                                  .villageList,
                                                          districtList:
                                                              InjectionHelper
                                                                  .requestLoanController
                                                                  .districtList,
                                                        ))!;
                                                        setState(() {
                                                          InjectionHelper
                                                                  .debtInvestmentController
                                                                  .fullResidentAddress
                                                                  .value
                                                                  .addressList![0] =
                                                              InjectionHelper
                                                                  .debtInvestmentController
                                                                  .residentAddress
                                                                  .value
                                                                  .addressList![0];
                                                          InjectionHelper
                                                                  .debtInvestmentController
                                                                  .fullResidentAddress
                                                                  .value
                                                                  .addressList![1] =
                                                              InjectionHelper
                                                                  .debtInvestmentController
                                                                  .residentAddress
                                                                  .value
                                                                  .addressList![1];
                                                          InjectionHelper
                                                                  .debtInvestmentController
                                                                  .fullResidentAddress
                                                                  .value
                                                                  .addressList![2] =
                                                              InjectionHelper
                                                                  .debtInvestmentController
                                                                  .residentAddress
                                                                  .value
                                                                  .addressList![2];
                                                          InjectionHelper
                                                                  .debtInvestmentController
                                                                  .fullResidentAddress
                                                                  .value
                                                                  .addressList![3] =
                                                              InjectionHelper
                                                                  .debtInvestmentController
                                                                  .residentAddress
                                                                  .value
                                                                  .addressList![3];
                                                          InjectionHelper
                                                                  .debtInvestmentController
                                                                  .fullResidentAddress
                                                                  .value
                                                                  .streetNo =
                                                              InjectionHelper
                                                                  .debtInvestmentController
                                                                  .residentAddress
                                                                  .value
                                                                  .streetNo;
                                                          InjectionHelper
                                                                  .debtInvestmentController
                                                                  .fullResidentAddress
                                                                  .value
                                                                  .houseNo =
                                                              InjectionHelper
                                                                  .debtInvestmentController
                                                                  .residentAddress
                                                                  .value
                                                                  .houseNo;
                                                        });
                                                        setState(() {
                                                          tempData.perHouseNo =
                                                              InjectionHelper
                                                                  .debtInvestmentController
                                                                  .residentAddress
                                                                  .value
                                                                  .houseNo;
                                                          tempData.perStreetNo =
                                                              InjectionHelper
                                                                  .debtInvestmentController
                                                                  .residentAddress
                                                                  .value
                                                                  .streetNo;
                                                          tempData.perCity =
                                                              InjectionHelper
                                                                  .debtInvestmentController
                                                                  .residentAddress
                                                                  .value
                                                                  .addressList![
                                                                      0]
                                                                  .name;
                                                          tempData.perDis =
                                                              InjectionHelper
                                                                  .debtInvestmentController
                                                                  .residentAddress
                                                                  .value
                                                                  .addressList![
                                                                      1]
                                                                  .name;
                                                          tempData.perCom =
                                                              InjectionHelper
                                                                  .debtInvestmentController
                                                                  .residentAddress
                                                                  .value
                                                                  .addressList![
                                                                      2]
                                                                  .name;
                                                          tempData.perVil =
                                                              InjectionHelper
                                                                  .debtInvestmentController
                                                                  .residentAddress
                                                                  .value
                                                                  .addressList![
                                                                      3]
                                                                  .name;
                                                        });
                                                      },
                                                      selectAddress: InjectionHelper
                                                                  .debtInvestmentController
                                                                  .fullResidentAddress
                                                                  .value
                                                                  .addressList![
                                                                      0]
                                                                  .name !=
                                                              ""
                                                          ? InjectionHelper
                                                                      .debtInvestmentController
                                                                      .fullResidentAddress
                                                                      .value
                                                                      .addressList![
                                                                          3]
                                                                      .name ==
                                                                  ""
                                                              ? '${InjectionHelper.debtInvestmentController.fullResidentAddress.value.streetNo} ${InjectionHelper.debtInvestmentController.fullResidentAddress.value.houseNo} ${InjectionHelper.debtInvestmentController.fullResidentAddress.value.addressList![2].name} ${InjectionHelper.debtInvestmentController.fullResidentAddress.value.addressList![1].name} ${InjectionHelper.debtInvestmentController.fullResidentAddress.value.addressList![0].name}'
                                                              : '${InjectionHelper.debtInvestmentController.fullResidentAddress.value.streetNo} ${InjectionHelper.debtInvestmentController.fullResidentAddress.value.houseNo} ${InjectionHelper.debtInvestmentController.fullResidentAddress.value.addressList![3].name} ${InjectionHelper.debtInvestmentController.fullResidentAddress.value.addressList![2].name} ${InjectionHelper.debtInvestmentController.fullResidentAddress.value.addressList![1].name} ${InjectionHelper.debtInvestmentController.fullResidentAddress.value.addressList![0].name} '
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
                                        left: 20, right: 20, bottom: 10),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: CustomButton(
                                            isDisable: tempData == defualtData
                                                ? true
                                                : false,
                                            isOutline: true,
                                            onPressed: () async {
                                              if (widget.id != null) {
                                                FirebaseAnalyticsHelper
                                                    .sendAnalyticsEvent(
                                                        "Debt Update Draft Step1");
                                              } else {
                                                FirebaseAnalyticsHelper
                                                    .sendAnalyticsEvent(
                                                        "Debt Save Draft Step1");
                                              }
                                              widget.id != null
                                                  ? await InjectionHelper
                                                      .debtInvestmentController
                                                      .onEditDebtInvestment(
                                                      context: context,
                                                      id: widget.id,
                                                      step: 1,
                                                    )
                                                  : await InjectionHelper
                                                      .debtInvestmentController
                                                      .onSubmitDebtInvestment(
                                                          context: context,
                                                          step: 1);
                                              InjectionHelper
                                                  .debtInvestmentController
                                                  .currentAddressList
                                                  .clear();
                                              InjectionHelper
                                                  .debtInvestmentController
                                                  .isValidateFullName
                                                  .value = true;
                                              InjectionHelper
                                                  .debtInvestmentController
                                                  .isValidateDateOfBirth
                                                  .value = true;
                                              InjectionHelper
                                                  .debtInvestmentController
                                                  .isValidateGender
                                                  .value = true;
                                              InjectionHelper
                                                  .debtInvestmentController
                                                  .isValidateEmail
                                                  .value = true;
                                              InjectionHelper
                                                  .debtInvestmentController
                                                  .isValidatePhone
                                                  .value = true;
                                              InjectionHelper
                                                  .debtInvestmentController
                                                  .isValidateFullAddress
                                                  .value = true;
                                              Future.delayed(Duration.zero)
                                                  .then((_) {
                                                FocusScope.of(context)
                                                    .unfocus();
                                                context.pop();
                                              });
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
