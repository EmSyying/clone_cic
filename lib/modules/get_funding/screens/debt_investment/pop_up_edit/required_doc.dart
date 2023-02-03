import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Utils/helper/firebase_analytics.dart';
import '../../../../../utils/form_builder/custom_button.dart';
import '../../../../../utils/form_builder/custom_form_card.dart';
import '../../../../../widgets/get_funding/custom_select_getfunding.dart';
import '../../../../../widgets/get_funding/custom_text_getfunding.dart';
import '../../../controller/debt_investment_controller.dart';
import '../../../models/equatable_debt_model.dart';

class RequiredDoc extends StatefulWidget {
  const RequiredDoc({Key? key}) : super(key: key);

  @override
  State<RequiredDoc> createState() => _RequiredDocState();
}

class _RequiredDocState extends State<RequiredDoc> {
  final DebtInvestmentController debtCon = Get.put(DebtInvestmentController());
  DebtStep4Model step4local = DebtStep4Model();
  DebtStep4Model step4Defual = DebtStep4Model();
  // int? incomeStatement;
  // int? balanceSheet;
  // int? cashFlowStatement;
  // int? businessPlan;
  // int? otherDoc;
  @override
  void initState() {
    // incomeStatement = debtCon.incomeStatement.value;
    // balanceSheet = debtCon.balanceSheet.value;
    // cashFlowStatement = debtCon.cashFlowStatement.value;
    // businessPlan = debtCon.businessPlan.value;
    // otherDoc = debtCon.otherDocuments.value;
    step4local = DebtStep4Model(
      incomeStatement: debtCon.incomeStatement.value,
      balanceSheet: debtCon.balanceSheet.value,
      cashFlowStatement: debtCon.cashFlowStatement.value,
      businessPlan: debtCon.businessPlan.value,
      otherDocuments: debtCon.otherDocuments.value,
    );

    step4Defual = DebtStep4Model(
      incomeStatement: debtCon.incomeStatement.value,
      balanceSheet: debtCon.balanceSheet.value,
      cashFlowStatement: debtCon.cashFlowStatement.value,
      businessPlan: debtCon.businessPlan.value,
      otherDocuments: debtCon.otherDocuments.value,
    );

    super.initState();
  }

  onpressRequiredDoc(
    context,
    int? incomeStatement,
    int? balanceSheet,
    int? cashFlowStatement,
    int? businessPlan,
    int? otherDoc,
  ) {
    setState(() {
      debtCon.incomeStatement.value = step4local.incomeStatement!;
      debtCon.balanceSheet.value = step4local.balanceSheet!;
      debtCon.cashFlowStatement.value = step4local.cashFlowStatement!;
      debtCon.businessPlan.value = step4local.businessPlan!;
      debtCon.otherDocuments.value = step4local.otherDocuments!;
    });

    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Required Documents',
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: CustomFormCard(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 6, bottom: 6),
                    child: CustomTextGetfunding(
                      isColorReView: true,
                      isrequire: false,
                      label1:
                          'Do you have Income Statement (Monthly and yearly statement during last 3 years)?',
                      label2: '',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        CustomSelectgetFunding(
                          onSelect: step4local.incomeStatement == 0,
                          title: 'No',
                          ontap: () {
                            setState(() {
                              step4local.incomeStatement = 0;
                            });
                          },
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        CustomSelectgetFunding(
                          title: 'Yes',
                          onSelect: step4local.incomeStatement == 1,
                          ontap: () {
                            setState(() {
                              step4local.incomeStatement = 1;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 6, bottom: 6),
                    child: CustomTextGetfunding(
                      isColorReView: true,
                      isrequire: false,
                      label1:
                          'Do you have Balance Sheet (Monthly and yearly statement during last 3 years)?',
                      label2: '',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        CustomSelectgetFunding(
                          onSelect: step4local.balanceSheet == 0,
                          title: 'No',
                          ontap: () {
                            setState(() {
                              step4local.balanceSheet = 0;
                            });
                          },
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        CustomSelectgetFunding(
                          title: 'Yes',
                          onSelect: step4local.balanceSheet == 1,
                          ontap: () {
                            setState(() {
                              step4local.balanceSheet = 1;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 6, bottom: 6),
                    child: CustomTextGetfunding(
                      isColorReView: true,
                      isrequire: false,
                      label1:
                          'Do you have Cash Flow Statement (Monthly and yearly statement during last 3 years)?',
                      label2: '',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        CustomSelectgetFunding(
                          onSelect: step4local.cashFlowStatement == 0,
                          title: 'No',
                          ontap: () {
                            setState(() {
                              step4local.cashFlowStatement = 0;
                            });
                          },
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        CustomSelectgetFunding(
                          title: 'Yes',
                          onSelect: step4local.cashFlowStatement == 1,
                          ontap: () {
                            setState(() {
                              step4local.cashFlowStatement = 1;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 6, bottom: 6),
                    child: CustomTextGetfunding(
                      isColorReView: true,
                      isrequire: true,
                      label1: 'Do you have Business Plan/Presentation?',
                      label2: '',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        CustomSelectgetFunding(
                          onSelect: step4local.businessPlan == 0,
                          title: 'No',
                          ontap: () {
                            setState(() {
                              step4local.businessPlan = 0;
                            });
                          },
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        CustomSelectgetFunding(
                          title: 'Yes',
                          onSelect: step4local.businessPlan == 1,
                          ontap: () {
                            setState(() {
                              step4local.businessPlan = 1;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 6, bottom: 6),
                    child: CustomTextGetfunding(
                      isColorReView: true,
                      isrequire: true,
                      label1:
                          'Do you have Other documents necessary for business and market understanding?',
                      label2: '',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        CustomSelectgetFunding(
                          onSelect: step4local.otherDocuments == 0,
                          title: 'No',
                          ontap: () {
                            setState(() {
                              step4local.otherDocuments = 0;
                            });
                          },
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        CustomSelectgetFunding(
                          title: 'Yes',
                          onSelect: step4local.otherDocuments == 1,
                          ontap: () {
                            setState(() {
                              step4local.otherDocuments = 1;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
                  isDisable: false,
                  isOutline: false,
                  onPressed: step4local == step4Defual
                      ? null
                      : () {
                          FirebaseAnalyticsHelper.sendAnalyticsEvent(
                              "Debt Edit RequiredDoc Preview Form");
                          onpressRequiredDoc(
                            context,
                            step4local.incomeStatement!,
                            step4local.balanceSheet!,
                            step4local.cashFlowStatement!,
                            step4local.businessPlan!,
                            step4local.otherDocuments!,
                          );
                        },
                  // onPressed: () {
                  //   debtCon.incomeStatement.value = incomeStatement!;
                  //   debtCon.balanceSheet.value = balanceSheet!;
                  //   debtCon.cashFlowStatement.value = cashFlowStatement!;
                  //   debtCon.businessPlan.value = businessPlan!;
                  //   debtCon.otherDocuments.value = otherDoc!;
                  //   Navigator.pop(context);
                  // },
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
