import 'package:cicgreenloan/Utils/function/format_date_time.dart';
import 'package:cicgreenloan/Utils/helper/format_number.dart';
import 'package:cicgreenloan/utils/form_builder/custom_drop_down.dart';
import 'package:cicgreenloan/modules/get_funding/models/equat_equity_model.dart';
import 'package:cicgreenloan/modules/get_funding/controller/equity_investment_controller.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../Utils/helper/color.dart';
import '../../../../../Utils/helper/firebase_analytics.dart';
import '../../../../../Utils/helper/numerice_format.dart';

class PopupFinancingEdit extends StatefulWidget {
  const PopupFinancingEdit({Key? key}) : super(key: key);

  @override
  State<PopupFinancingEdit> createState() => _PopupFinancingEditState();
}

class _PopupFinancingEditState extends State<PopupFinancingEdit> {
  _onpressFinancing(context, useOfFund, intendedDate, amount) {
    if (amount < equityController.equitySetting.value.minEquityAmount ||
        amount > equityController.equitySetting.value.maxEquityAmount) {
      equityController.isValidateFinancingAmount.value = false;
    } else {
      equityController.isValidateFinancingAmount.value = true;
    }
    if (step1local.useOfFund == '') {
      equityController.isValidateUseOfFund.value = false;
    } else {
      equityController.isValidateUseOfFund.value = true;
    }
    if (step1local.intendedDate == '') {
      equityController.isValidateIntendedDate.value = false;
    } else {
      equityController.isValidateIntendedDate.value = true;
    }
    if (amount < equityController.equitySetting.value.minEquityAmount ||
        amount > equityController.equitySetting.value.maxEquityAmount ||
        useOfFund == '' ||
        step1local.intendedDate == '') {
    } else {
      equityController.financingAmountcontroller.text = amount.toString();
      equityController.financingAmoung.value = amount;
      equityController.useOfFund.value = useOfFund;
      equityController.useOfFundcontroller.text = useOfFund.toString();
      equityController.intendedDate.value = step1local.intendedDate!;
      Navigator.pop(context);
    }
  }

  final equityController = Get.put(EquityInvestmentController());
  final userofFocus = FocusNode();
  Step1EquityModel step1local = Step1EquityModel();
  Step1EquityModel step1Defual = Step1EquityModel();

  @override
  void initState() {
    equityController.fetchEquitySetting();

    step1Defual = Step1EquityModel(
        financingAmount: equityController.financingAmoung.value,
        intendedDate: equityController.intendedDate.value,
        useOfFund: equityController.useOfFund.value);
    step1local = Step1EquityModel(
        financingAmount: equityController.financingAmoung.value,
        intendedDate: equityController.intendedDate.value,
        useOfFund: equityController.useOfFund.value);
    super.initState();
  }

//==
  DateTime dt1 = DateTime.parse(FormatDate.today().toString());
  String? whenOnchangeDate = "";

  @override
  void dispose() {
    equityController.isValidateFinancingAmount.value = true;
    equityController.isValidateIntendedDate.value = true;
    equityController.isValidateUseOfFund.value = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Obx(
          () => Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomTextFieldNew(
                    validateText: equityController.financingAmoung.value == 0
                        ? null
                        : "${equityController.equitySetting.value.message}",
                    // validateText: step1local.financingAmount == 0
                    //     ? null
                    //     : 'Financing Amount must between \$${equityController.equitySetting.value.minEquityAmount} - \$${equityController.equitySetting.value.maxEquityAmount}',
                    onEditingComplete: () {
                      FocusScope.of(context).requestFocus(userofFocus);
                    },
                    isRequired: true,
                    isValidate:
                        equityController.isValidateFinancingAmount.value,
                    labelText: 'Financing Amount (USD) ',
                    hintText: 'Financing Amount (USD) ',
                    onChange: (valueChanged) {
                      var value = valueChanged.replaceAll(',', '');

                      equityController.isValidateFinancingAmount.value = true;
                      if (value.isEmpty) {
                        equityController.isValidateFinancingAmount.value =
                            false;
                        step1local.financingAmount = 0;
                      } else {
                        setState(() {
                          step1local.financingAmount = int.parse(value);
                        });
                        if (step1local.financingAmount!.toInt() <
                                equityController
                                    .equitySetting.value.minEquityAmount! ||
                            step1local.financingAmount!.toInt() >
                                equityController
                                    .equitySetting.value.maxEquityAmount!) {
                          equityController.isValidateFinancingAmount.value =
                              false;
                        } else {
                          equityController.isValidateFinancingAmount.value =
                              true;
                        }
                      }
                    },
                    keyboardType: TextInputType.number,
                    inputFormatterList: [
                      FilteringTextInputFormatter.digitsOnly,
                      NumericTextFormatter(),
                      FilteringTextInputFormatter.deny(RegExp(r'^0+')),
                    ],
                    initialValue: step1local.financingAmount == 0
                        ? ''
                        : FormatNumber.formatNumberDefualt(
                                step1local.financingAmount!)
                            .toString(),
                  ),
                  CICDropdown(
                    currentDate: dt1.isAfter(DateFormat("dd-MM-yyyy")
                            .parse(equityController.intendedDate.value))
                        ? DateFormat("dd-MM-yyyy")
                            .parse(equityController.intendedDate.value)
                        : FormatDate.today(),
                    isValidate: equityController.isValidateIntendedDate.value,
                    label: 'Intended Date of Disbursement',
                    onChange: (value) {
                      setState(() {
                        equityController.whenOnchangeDate.value = value["Name"];
                        step1local.intendedDate = value["Name"];
                      });

                      equityController.isValidateIntendedDate.value = true;
                    },
                    defaultValue: step1local.intendedDate == ''
                        ? null
                        : {
                            'Name':
                                equityController.whenOnchangeDate.value == ""
                                    ? FormatDate.formatDateTimeGetfunding(
                                        step1local.intendedDate!)
                                    : step1local.intendedDate!,
                            'Code': '02'
                          },
                    isDateTimePicker: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldNew(
                      onEditingComplete: () {
                        _onpressFinancing(
                            context,
                            step1local.useOfFund,
                            step1local.intendedDate,
                            step1local.financingAmount);
                      },
                      focusScope: userofFocus,
                      isRequired: true,
                      isValidate: equityController.isValidateUseOfFund.value,
                      labelText: 'Use Of Fund',
                      hintText: 'Use Of Fund',
                      onChange: (value) {
                        setState(() {
                          if (value.isEmpty) {
                            step1local.useOfFund = '';
                            equityController.isValidateUseOfFund.value = false;
                          } else {
                            step1local.useOfFund = value;
                            equityController.isValidateUseOfFund.value = true;
                          }
                        });
                      },
                      initialValue: step1local.useOfFund),
                ],
              ),
            ),
          ),
        ),
        Container(
          color: AppColor.dividerBackground,
          height: 2,
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
                    Navigator.pop(context);
                  },
                  title: 'Cancel',
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: CustomButton(
                  isDisable: false,
                  isOutline: false,
                  onPressed: step1Defual == step1local
                      ? null
                      : () {
                          FirebaseAnalyticsHelper.sendAnalyticsEvent(
                              "Equity Edit Financing Preview Form");
                          _onpressFinancing(
                              context,
                              step1local.useOfFund,
                              step1local.intendedDate,
                              step1local.financingAmount);
                        },
                  title: 'Save',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
