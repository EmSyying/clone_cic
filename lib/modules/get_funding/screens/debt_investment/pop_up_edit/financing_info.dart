import 'package:cicgreenloan/Utils/function/format_date_time.dart';
import 'package:cicgreenloan/Utils/helper/format_number.dart';
import 'package:cicgreenloan/Utils/option_controller/option_controller.dart';
import 'package:cicgreenloan/modules/get_funding/models/equatable_debt_model.dart';
import 'package:cicgreenloan/Utils/helper/option_model/option_model.dart';
import 'package:cicgreenloan/modules/get_funding/controller/debt_investment_controller.dart';
import 'package:cicgreenloan/utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/utils/form_builder/custom_drop_down.dart';
import 'package:cicgreenloan/utils/form_builder/custom_textformfield.dart';
import 'package:cicgreenloan/utils/form_builder/dropdow_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../Utils/helper/firebase_analytics.dart';
import '../../../../../Utils/helper/numerice_format.dart';
import '../../../../../widgets/get_funding/custom_add_other_label.dart';
import '../step2_debt.dart';

class EditFinancingInfo extends StatefulWidget {
  final int? productTypeId;
  const EditFinancingInfo({Key? key, this.productTypeId}) : super(key: key);

  @override
  State<EditFinancingInfo> createState() => _EditFinancingInfoState();
}

class _EditFinancingInfoState extends State<EditFinancingInfo> {
  final DebtInvestmentController debtCon = Get.put(DebtInvestmentController());

  final optionCon = Get.put(DocumentCategory());
  DebtStep2Model debt2Data = DebtStep2Model();
  DebtStep2Model debt2Edit = DebtStep2Model();

  String validateText = '';

  _onSaveFinancingInfo({BuildContext? context, DebtStep2Model? debt2Data}) {
    if (debt2Data!.financingPurpose == null) {
      debtCon.isValidateFnancingPurpose.value = false;
    } else {
      debtCon.isValidateFnancingPurpose.value = true;
    }
    // if (debt2Data.financingAmount! > 100000.0) {
    //   debtCon.isValidateFinancingAmount.value = false;
    //   validateText = "Financing amount must between \$500-\$100,000";
    // }
    // if (debt2Data.financingAmount! > 0 &&
    //     debtCon.financingAmount.value < 500.0) {
    //   debtCon.isValidateFinancingAmount.value = false;
    //   validateText = "Financing amount must between \$500-\$100,000";
    // }

    if (debt2Data.financingAmount! == 0.0) {
      debtCon.isValidateFinancingAmount.value = false;
      validateText = "Please enter Financing Amount (USD)";
    }
    if (debt2Data.term == 0) {
      debtCon.isValidateTerm.value = false;
    } else {
      debtCon.isValidateTerm.value = true;
    }
    if (debt2Data.intendedDate == "") {
      debtCon.isValidateIntendedDate.value = false;
    } else {
      debtCon.isValidateIntendedDate.value = true;
    }

    if (debt2Data.financingAmount! >=
        debtCon.optionData.value.financingAmount!.minimum!) {
      if (debt2Data.financingPurpose != null &&
          debt2Data.financingAmount != 0.0 &&
          debt2Data.term != 0 &&
          debt2Data.intendedDate != "") {
        debtCon.financingPurpose.value = debt2Data.financingPurpose!;
        debtCon.financingAmount.value = debt2Data.financingAmount!.toDouble();
        debtCon.term.value = debt2Data.term!.toInt();
        debtCon.intendedDate.value = debt2Data.intendedDate!;
        Navigator.pop(context!);
      }
    }
  }

  bool isEnable = false;

  @override
  void initState() {
    super.initState();
    debtCon.fetchLoanOption();
    debtCon.fetchOptionData(id: 1);
    isEnable = true;
    debt2Data = DebtStep2Model(
      financingAmount: debtCon.financingAmount.value,
      financingPurpose: debtCon.financingPurpose.value,
      intendedDate: debtCon.intendedDate.value,
      term: debtCon.term.value,
    );
    debt2Edit = DebtStep2Model(
      financingAmount: debtCon.financingAmount.value,
      financingPurpose: debtCon.financingPurpose.value,
      intendedDate: debtCon.intendedDate.value,
      term: debtCon.term.value,
    );
  }

  DateTime dt1 = DateTime.parse(FormatDate.today().toString());
  TextEditingController addNewFinancingPurpose = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Financing Information',
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // CICDropdown(
                  //   validate: true,
                  //   isValidate: debtCon.isValidateProductType.value,
                  //   item: debtCon.optionList.asMap().entries.map((e) {
                  //     return DropDownItem(
                  //       itemList: {
                  //         "Name": e.value.productName!,
                  //         "Code": e.value.id.toString()
                  //       },
                  //     );
                  //   }).toList(),
                  //   onChange: (value) {
                  //     isEnable = true;
                  //     debtCon.productType.value = Option(
                  //       id: int.parse(value["Code"]),
                  //       productName: value["Name"],
                  //     );
                  //     debtCon.term.value = 0;
                  //     debtCon.termController.text = "";
                  //     debtCon.fetchOptionData(id: debtCon.productType.value.id);
                  //     debtCon.isValidateProductType.value = true;
                  //   },
                  //   label: 'Product Type *',
                  //   defaultValue: debtCon.productType.value.productName != null
                  //       ? {
                  //           "Name": debtCon.productType.value.productName,
                  //           "Code": debtCon.productType.value.id
                  //         }
                  //       : null,
                  // ),
                  CICDropdown(
                    // isEnable: !isEnable,
                    onCreateCompany: () {
                      addNewFinancingPurpose.text = "";
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
                            // debt2Data.financingPurpose!.display =
                            //     addNewFinancingPurpose.text;
                            debt2Data.financingPurpose = Optionmodel(
                                display: addNewFinancingPurpose.text, id: null);
                          });
                          if (addNewFinancingPurpose.text != "") {
                            debt2Data.financingPurpose!.id = null;
                          }
                          Navigator.pop(context);
                        },
                        context: context,
                        textFieldHere: CustomTextFieldNew(
                          controller: addNewFinancingPurpose,
                          hintText: 'Financing Purpose',
                          labelText: 'Financing Purpose',
                        ),
                      );
                    },
                    colors: Colors.white,
                    isCompany: true,
                    otherLabel: "Add Other",
                    isValidate: debtCon.isValidateFnancingPurpose.value,
                    item: optionCon.optionData.value.purpose!
                        .asMap()
                        .entries
                        .map((e) {
                      return DropDownItem(
                        itemList: {
                          "Name": e.value.display!,
                          "Code": e.value.id.toString()
                        },
                      );
                    }).toList(),
                    onChange: (v) {
                      setState(() {
                        debt2Data.financingPurpose = Optionmodel(
                          display: v["Name"],
                          id: int.parse(v["Code"]),
                        );
                      });
                      debtCon.isValidateFnancingPurpose.value = true;
                    },
                    label: 'Financing Purpose',
                    defaultValue: debt2Data.financingPurpose!.display != null
                        ? {
                            "Name": debt2Data.financingPurpose!.display,
                            "Code": debt2Data.financingPurpose!.id
                          }
                        : null,
                  ),
                  const SizedBox(height: 10),
                  CustomTextFieldNew(
                    // enable: isEnable == true ? true : false,
                    validateText: validateText,
                    textInputAction: TextInputAction.next,
                    isRequired: true,
                    isValidate: debtCon.isValidateFinancingAmount.value,
                    labelText: 'Financing Amount (USD) ',
                    hintText: 'Financing Amount (USD) ',
                    onChange: (valueChnaged) {
                      var value = valueChnaged.replaceAll(',', '');
                      if (value.isNotEmpty) {
                        int val = int.parse(value);
                        if (val <
                            debtCon
                                .optionData.value.financingAmount!.minimum!) {
                          setState(() {
                            debtCon.isValidateFinancingAmount.value = false;
                            validateText =
                                "Financing amount is starting from \$${debtCon.optionData.value.financingAmount!.minimum!}";
                          });
                        } else {
                          setState(() {
                            debtCon.isValidateFinancingAmount.value = true;
                            debt2Data.financingAmount = double.parse(value);
                          });
                        }
                        // if (val
                        //     debtCon
                        //         .optionData.value.financingAmount!.maximum!) {
                        //   setState(() {
                        //     debtCon.isValidateFinancingAmount.value = false;
                        //     debt2Data.financingAmount = 0.0;
                        //     validateText =
                        //         "Financing amount is starting from \$${debtCon.optionData.value.financingAmount!.minimum!}";
                        //   });
                        // } else {
                        //   setState(() {
                        //     debt2Data.financingAmount = double.parse(value);
                        //   });
                        // }
                      } else {
                        debt2Data.financingAmount = 0.0;
                        setState(
                          () {
                            debtCon.isValidateFinancingAmount.value = false;
                            validateText =
                                "Please enter Financing Amount (USD)";
                          },
                        );
                      }
                    },

                    inputFormatterList: [
                      FilteringTextInputFormatter.digitsOnly,
                      NumericTextFormatter(),
                      FilteringTextInputFormatter.deny(RegExp(r'^0+')),
                    ],
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    initialValue: debtCon.financingAmount.value == 0.0
                        ? ''
                        : FormatNumber.formatNumberDefualt(
                                debtCon.financingAmount.value)
                            .toString(),
                  ),
                  CustomTextFieldNew(
                    // enable: isEnable == true ? true : false,
                    isRequired: true,
                    isValidate: debtCon.isValidateTerm.value,
                    textInputAction: TextInputAction.next,
                    labelText: 'Term (Months) ',
                    hintText: 'Term (Months) ',
                    onChange: (value) {
                      if (value.isNotEmpty) {
                        debtCon.isValidateTerm.value = true;
                        setState(() {
                          debt2Data.term = int.parse(value);
                        });
                        setState(() {
                          debtCon.isValidateTerm.value = true;
                          debtCon.term.value = int.parse(value);
                          if (debtCon.term.value <
                                  debtCon.optionData.value.duration!.minimum! ||
                              debtCon.term.value >
                                  debtCon.optionData.value.duration!.maximum!) {
                            debtCon.isValidateTermAmount.value = true;
                          } else {
                            debtCon.isValidateTermAmount.value = false;
                          }
                        });
                      } else {
                        debtCon.isValidateTerm.value = false;
                        setState(() {
                          debt2Data.term = 0;
                        });
                      }
                    },
                    keyboardType: TextInputType.number,

                    inputFormatterList: [
                      FilteringTextInputFormatter.digitsOnly,
                      FilteringTextInputFormatter.deny(RegExp(r'^0+')),
                    ],
                    initialValue:
                        debt2Data.term == 0 ? '' : debt2Data.term.toString(),
                  ),
                  if (debtCon.isValidateTermAmount.value &&
                      debtCon.isValidateTerm.value == true)
                    Container(
                      padding: const EdgeInsets.only(
                        left: 20,
                      ),
                      child: CustomValidateError(
                        validateTitle:
                            'Term amount must be between ${debtCon.optionData.value.duration!.minimum!} and ${debtCon.optionData.value.duration!.maximum!}',
                      ),
                    ),
                  CICDropdown(
                    // isEnable: !isEnable,
                    currentDate: dt1.isAfter(DateFormat("dd-MM-yyyy")
                            .parse(debtCon.intendedDate.value))
                        ? DateFormat("dd-MM-yyyy")
                            .parse(debtCon.intendedDate.value)
                        : FormatDate.today(),
                    isValidate: debtCon.isValidateIntendedDate.value,
                    label: 'Intended Date of Disbursement​',
                    onChange: (value) {
                      setState(() {
                        debtCon.intendedDate.value = value["Name"];
                        debt2Data.intendedDate = value["Name"];
                      });
                      debtCon.isValidateIntendedDate.value = true;
                    },
                    defaultValue: debt2Data.intendedDate == ''
                        ? null
                        : {
                            'Name': debtCon.intendedDate.value == ""
                                ? FormatDate.formatDateTimeGetfunding(
                                    debt2Data.intendedDate!)
                                : debt2Data.intendedDate!,
                            'Code': '02'
                          },
                    isDateTimePicker: true,
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin:
                const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
            child: Row(
              children: [
                Expanded(
                  child: CustomButton(
                    isDisable: false,
                    isOutline: true,
                    onPressed: () {
                      debtCon.isValidateFinancingAmount.value = true;
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
                    isDisable: debt2Data == debt2Edit ||
                            debtCon.isValidateTerm.value == false ||
                            (debt2Data.financingAmount! <
                                debtCon
                                    .optionData.value.financingAmount!.minimum!)
                        ? true
                        : false,
                    isOutline: false,
                    onPressed: () {
                      FirebaseAnalyticsHelper.sendAnalyticsEvent(
                          "Debt Edit FinancingInfo Preview Form");
                      _onSaveFinancingInfo(
                          context: this.context, debt2Data: debt2Data);
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
