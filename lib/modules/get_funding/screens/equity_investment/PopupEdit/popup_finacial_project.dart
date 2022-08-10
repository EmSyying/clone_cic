import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Utils/form_builder/custom_button.dart';
import '../../../../../Utils/helper/firebase_analytics.dart';
import '../../../../../widgets/get_funding/custom_select_getfunding.dart';
import '../../../../../widgets/get_funding/custom_text_getfunding.dart';
import '../../../controller/equity_investment_controller.dart';
import '../../../models/equat_equity_model.dart';

class FinancialProjectEdit extends StatefulWidget {
  const FinancialProjectEdit({Key? key}) : super(key: key);

  @override
  State<FinancialProjectEdit> createState() => _FinancialProjectEditState();
}

class _FinancialProjectEditState extends State<FinancialProjectEdit> {
  Step3EquityModel step3local = Step3EquityModel();
  Step3EquityModel step3defual = Step3EquityModel();
  final equityController = Get.put(EquityInvestmentController());

  @override
  void initState() {
    step3local = Step3EquityModel(
      incomeStatement: equityController.incomeStatement.value,
      balanceSheet: equityController.balanceSheet.value,
      cashFlowStatement: equityController.cashFlowStatement.value,
      havefinancial: equityController.havefinancial.value,
    );
    step3defual = Step3EquityModel(
      incomeStatement: equityController.incomeStatement.value,
      balanceSheet: equityController.balanceSheet.value,
      cashFlowStatement: equityController.cashFlowStatement.value,
      havefinancial: equityController.havefinancial.value,
    );

    super.initState();
  }

  _onpressFinancingDoc(
    context,
    incomestments,
    balancesheet,
    cashflow,
    havefinancing,
  ) {
    setState(() {
      equityController.havefinancial.value = step3local.havefinancial!.toInt();
      equityController.incomeStatement.value =
          step3local.incomeStatement!.toInt();
      equityController.balanceSheet.value = step3local.balanceSheet!.toInt();
      equityController.cashFlowStatement.value =
          step3local.cashFlowStatement!.toInt();
    });

    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20, left: 20),
                child: Text(
                  'Financial Performance and Projection',
                  style: TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 15,
                      color: Color(0xff0F50A4),
                      fontWeight: FontWeight.w700),
                ),
              ),
              const CustomTextGetfunding(
                isrequire: false,
                label1:
                    'Do you have Income Statement (Monthly and yearly statement during last 3 years)?',
                label2: '',
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, bottom: 20, right: 20, top: 20),
                child: Row(
                  children: [
                    CustomSelectgetFunding(
                      onSelect: step3local.incomeStatement == 0,
                      title: 'No',
                      ontap: () {
                        setState(() {
                          step3local.incomeStatement = 0;
                        });
                      },
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    CustomSelectgetFunding(
                      title: 'Yes',
                      onSelect: step3local.incomeStatement == 1,
                      ontap: () {
                        setState(() {
                          step3local.incomeStatement = 1;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const CustomTextGetfunding(
                isrequire: false,
                label1:
                    'Do you have Balance Sheet (Monthly and yearly statement during last 3 years)?',
                label2: '',
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, bottom: 20, right: 20, top: 20),
                child: Row(
                  children: [
                    CustomSelectgetFunding(
                      onSelect: step3local.balanceSheet == 0,
                      title: 'No',
                      ontap: () {
                        setState(() {
                          step3local.balanceSheet = 0;
                        });
                      },
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    CustomSelectgetFunding(
                      title: 'Yes',
                      onSelect: step3local.balanceSheet == 1,
                      ontap: () {
                        setState(() {
                          step3local.balanceSheet = 1;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const CustomTextGetfunding(
                isrequire: false,
                label1:
                    'Do you have Cash Flow Statement (Monthly and yearly statement during last 3 years)?',
                label2: '',
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, bottom: 20, right: 20, top: 20),
                child: Row(
                  children: [
                    CustomSelectgetFunding(
                      onSelect: step3local.cashFlowStatement == 0,
                      title: 'No',
                      ontap: () {
                        setState(() {
                          step3local.cashFlowStatement = 0;
                        });
                      },
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    CustomSelectgetFunding(
                      title: 'Yes',
                      onSelect: step3local.cashFlowStatement == 1,
                      ontap: () {
                        setState(() {
                          step3local.cashFlowStatement = 1;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const CustomTextGetfunding(
                isrequire: true,
                label1: 'Do you have the financial projection (3 to 5 years)?',
                label2: '',
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, bottom: 20, right: 20, top: 20),
                child: Row(
                  children: [
                    CustomSelectgetFunding(
                      onSelect: step3local.havefinancial == 0,
                      title: 'No',
                      ontap: () {
                        setState(() {
                          step3local.havefinancial = 0;
                        });
                      },
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    CustomSelectgetFunding(
                      title: 'Yes',
                      onSelect: step3local.havefinancial == 1,
                      ontap: () {
                        setState(() {
                          step3local.havefinancial = 1;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          margin:
              const EdgeInsets.only(left: 20, right: 20, bottom: 30, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                width: 16,
              ),
              Expanded(
                child: CustomButton(
                  isDisable: false,
                  isOutline: false,
                  onPressed: step3defual == step3local
                      ? null
                      : () {
                          FirebaseAnalyticsHelper.sendAnalyticsEvent(
                              "Equity Edit FinancingDoc Preview Form");
                          _onpressFinancingDoc(
                            context,
                            step3local.havefinancial,
                            step3local.incomeStatement,
                            step3local.balanceSheet,
                            step3local.cashFlowStatement,
                          );
                        },
                  title: 'Save',
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
