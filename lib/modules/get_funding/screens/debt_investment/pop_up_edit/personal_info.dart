import 'package:cicgreenloan/Utils/form_builder/custom_drop_down.dart';
import 'package:cicgreenloan/Utils/option_controller/option_controller.dart';
import 'package:cicgreenloan/modules/get_funding/models/equatable_debt_model.dart';
import 'package:cicgreenloan/Utils/helper/option_model/gender.dart';
import 'package:cicgreenloan/Utils/helper/option_model/option_model.dart';
import 'package:cicgreenloan/modules/get_funding/controller/debt_investment_controller.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/widgets/get_funding/custom_chips.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Utils/helper/firebase_analytics.dart';

class EditPersonalInfo extends StatefulWidget {
  const EditPersonalInfo({Key? key}) : super(key: key);

  @override
  State<EditPersonalInfo> createState() => _EditPersonalInfoState();
}

class _EditPersonalInfoState extends State<EditPersonalInfo> {
  final DebtInvestmentController debtCon = Get.put(DebtInvestmentController());
  final optionCon = Get.put(DocumentCategory());

  String? fullName;
  String? dateOfBirth;
  GenderOption? gender;
  String? email;

  DebtStep1Model? debtData;
  DebtStep1Model? debtEdit;

  final _formKey = GlobalKey<FormState>();

  _onSavePersonalInfo({BuildContext? context, DebtStep1Model? debtData}) {
    if (debtData!.fullName == '') {
      debtCon.isValCompanyName.value = false;
    } else {
      debtCon.isValCompanyName.value = true;
    }
    if (debtData.dateOfBirth == '') {
      debtCon.isValidateDateOfBirth.value = false;
    } else {
      debtCon.isValidateDateOfBirth.value = true;
    }
    if (debtData.gender!.display != null) {
      debtCon.isValidateGender.value = false;
    } else {
      debtCon.isValidateGender.value = true;
    }
    if (debtData.email != "") {
      debtCon.isValidateEmail.value = true;
    } else {
      debtCon.isValidateEmail.value = false;
    }

    if (debtData.fullName != "" &&
        debtData.dateOfBirth != "" &&
        debtData.gender!.display != "" &&
        debtData.email != "") {
      debtCon.fullName.value = debtData.fullName!;
      debtCon.dateOfBirth.value = debtData.dateOfBirth!;
      debtCon.email.value = debtData.email!;
      debtCon.gender.value = debtData.gender!;
      debtCon.phoneNumber.value = debtData.phoneNumber!;
      Navigator.pop(context!);
    }
  }

  @override
  void initState() {
    debtData = DebtStep1Model(
      fullName: debtCon.fullName.value,
      dateOfBirth: debtCon.dateOfBirth.value,
      gender: debtCon.gender.value,
      email: debtCon.email.value,
      phoneNumber: debtCon.phoneNumber.value,
    );

    debtEdit = DebtStep1Model(
      fullName: debtCon.fullName.value,
      dateOfBirth: debtCon.dateOfBirth.value,
      gender: debtCon.gender.value,
      email: debtCon.email.value,
      phoneNumber: debtCon.phoneNumber.value,
    );
    // print("gender value: ${debtCon.gender.value.display}");
    if (debtCon.gender.value.display == "Male") {
      debtCon.selectedIndexGender.value = 0;
    } else {
      debtCon.selectedIndexGender.value = 1;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Expanded(
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextFieldNew(
                          textInputAction: TextInputAction.done,
                          isRequired: true,
                          keyboardType: TextInputType.name,
                          isValidate: debtCon.isValidateFullName.value,
                          labelText: 'Full Name ',
                          hintText: 'Enter full name',
                          onChange: (value) {
                            if (value.isEmpty) {
                              debtData!.fullName = '';
                              setState(() {
                                debtCon.isValidateFullName.value = false;
                              });
                            } else {
                              debtData!.fullName = value;
                              setState(() {
                                debtCon.isValidateFullName.value = true;
                              });
                            }
                          },
                          initialValue: debtData!.fullName,
                          onSave: ((value) {
                            // debtCon.fullName.value = value!;
                            debtData!.fullName = value;
                          }),
                        ),
                        CICDropdown(
                          isValidate: debtCon.isValidateDateOfBirth.value,
                          label: 'Date of birth *',
                          onChange: (value) {
                            setState(() {
                              debtData!.dateOfBirth = value["Name"];
                              debtCon.isValidateDateOfBirth.value = true;
                            });
                          },
                          defaultValue: {
                            'Name': debtData!.dateOfBirth,
                            'Code': '02'
                          },
                          isDateTimePicker: true,
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Gender',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: optionCon.optionData.value.gender!
                                  .asMap()
                                  .entries
                                  .map((e) {
                                return GestureDetector(
                                  onTap: () {
                                    debtData!.gender = Optionmodel(
                                        id: e.value.id,
                                        display: e.value.display);

                                    debtCon.selectedIndexGender.value = e.key;
                                  },
                                  child: CustomChips(
                                    margin: const EdgeInsets.only(right: 20),
                                    title: e.value.display!,
                                    currentIndex: e.key,
                                    selectIndex:
                                        debtCon.selectedIndexGender.value,
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextFieldNew(
                          isRequired: true,
                          isValidate: debtCon.isValidateEmail.value,
                          labelText: 'Email',
                          hintText: 'Enter your email',
                          onChange: (value) {
                            if (value.isEmpty) {
                              debtData!.email = "";

                              setState(() {
                                debtCon.isValidateEmail.value = false;
                              });
                            } else {
                              debtData!.email = value;
                              setState(() {
                                debtCon.isValidateEmail.value = true;
                              });
                            }
                          },
                          initialValue: debtData!.email,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        // CustomTextFieldNew(
                        //   isReadOnly: true,
                        //   isRequired: true,

                        //   maxLine: 1,
                        //   isValidate: debtCon.isValidatePhone.value,
                        //   onSave: ((value) {
                        //     debtCon.phoneNumber.value = value!;
                        //   }),
                        //   labelText: 'Phone',
                        //   hintText: 'Enter your phone number',
                        //   onChange: (value) {
                        //     if (value.isEmpty) {
                        //       debtCon.phoneNumber.value = '';
                        //       setState(() {
                        //         debtCon.isValidatePhone.value = false;
                        //       });
                        //     } else {
                        //       debtCon.phoneNumber.value = value;
                        //       setState(() {
                        //         debtCon.isValidatePhone.value = true;
                        //       });
                        //     }
                        //   },
                        //   initialValue: debtData!.phoneNumber,
                        //   // initialValue: debtCon.phoneNumber.value,
                        //   keyboardType: TextInputType.number,
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Row(
              children: [
                Expanded(
                  child: CustomButton(
                    isDisable: false,
                    isOutline: true,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    title: 'Close',
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: CustomButton(
                    isDisable: debtData == debtEdit ? true : false,
                    isOutline: false,
                    onPressed: () {
                      FirebaseAnalyticsHelper.sendAnalyticsEvent(
                          "Debt Edit PersonalInfo Preview Form");
                      _onSavePersonalInfo(
                          context: this.context, debtData: debtData);
                    },
                    title: 'Save',
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
