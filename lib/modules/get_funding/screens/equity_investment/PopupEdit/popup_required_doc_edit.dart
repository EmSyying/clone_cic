import 'package:cicgreenloan/Utils/helper/format_number.dart';
import 'package:cicgreenloan/Utils/helper/numerice_format.dart';
import 'package:cicgreenloan/Utils/option_controller/option_controller.dart';
import 'package:cicgreenloan/modules/get_funding/models/equat_equity_model.dart';
import 'package:cicgreenloan/modules/get_funding/controller/equity_investment_controller.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/widgets/get_funding/custom_select_2_getfunding.dart';
import 'package:cicgreenloan/widgets/get_funding/custom_select_getfunding.dart';
import 'package:cicgreenloan/widgets/get_funding/custom_text_getfunding.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../../Utils/helper/firebase_analytics.dart';

class PopupRequiredDoc extends StatefulWidget {
  const PopupRequiredDoc({Key? key}) : super(key: key);

  @override
  State<PopupRequiredDoc> createState() => _PopupRequiredDocState();
}

class _PopupRequiredDocState extends State<PopupRequiredDoc> {
  final equityController = Get.put(EquityInvestmentController());
  final optionController = Get.put(DocumentCategory());
  Step3EquityModel step3local = Step3EquityModel();
  Step3EquityModel step3defual = Step3EquityModel();

  @override
  void initState() {
    // equityController.businessPlan.map((e) => businessList.add(e)).toList();
    // equityController.articleOfIncorporation
    //     .map((e) => articleList.add(e))
    //     .toList();
    // equityController.incomeStatement
    //     .map((e) => incomstatementList.add(e))
    //     .toList();
    // equityController.cashFlowStatement.map((e) => cashFlowList.add(e)).toList();
    // equityController.marketStudy.map((e) => marketStudyList.add(e)).toList();
    // equityController.otherDocuments.map((e) => otherDocList.add(e)).toList();
    // equityController.balanceSheet.map((e) => balanceSheetList.add(e)).toList();
    step3local = Step3EquityModel(
      purposeOfFund: equityController.purposeOfFund.value,
      areYouTheMajorityShareholder:
          equityController.areYouTheMajorityShareholder.value,
      havefinancial: equityController.havefinancial.value,
      haveTheConsenus: equityController.haveTheConsenus.value,
      numberOfShareHolders: equityController.numberOfShareHolders.value,
      numberOfBoardMembers: equityController.numberOfBoardMembers.value,
      articleOfIncorporation: equityController.articleOfIncorporation.value,
      balanceSheet: equityController.balanceSheet.value,
      businessPlan: equityController.businessPlan.value,
      cashFlowStatement: equityController.cashFlowStatement.value,
      incomeStatement: equityController.incomeStatement.value,
      marketStudy: equityController.marketStudy.value,
      otherDocuments: equityController.otherDocuments.value,
    );
    step3defual = Step3EquityModel(
      purposeOfFund: equityController.purposeOfFund.value,
      areYouTheMajorityShareholder:
          equityController.areYouTheMajorityShareholder.value,
      havefinancial: equityController.havefinancial.value,
      haveTheConsenus: equityController.haveTheConsenus.value,
      numberOfShareHolders: equityController.numberOfShareHolders.value,
      numberOfBoardMembers: equityController.numberOfBoardMembers.value,
      articleOfIncorporation: equityController.articleOfIncorporation.value,
      balanceSheet: equityController.balanceSheet.value,
      businessPlan: equityController.businessPlan.value,
      cashFlowStatement: equityController.cashFlowStatement.value,
      incomeStatement: equityController.incomeStatement.value,
      marketStudy: equityController.marketStudy.value,
      otherDocuments: equityController.otherDocuments.value,
    );

    super.initState();
  }

  _onpressRequiredDoc(
    context,
    numberofShare,
    numberofboard,
    haveTheConsenus,
    purposeOfFund,
    areYouTheMajorityShareholder,
    havefinancing,
    incomestments,
    balancesheet,
    business,
    article,
    cashflow,
    marketystudy,
    otherdoc,
  ) {
    if (numberofShare == 0) {
      equityController.isValNumberOfShareHolders.value = false;
    } else {
      equityController.isValNumberOfShareHolders.value = true;
    }
    if (numberofboard == 0) {
      equityController.isValNumberOfBoardMembers.value = false;
    } else {
      equityController.isValNumberOfBoardMembers.value = true;
    }
    // if (incomestments == 0) {
    //   setState(() {
    //     equityController.isValincomeStatement.value = true;
    //   });
    // } else {
    //   equityController.isValincomeStatement.value = false;
    // }
    // if (balancesheet == 0) {
    //   setState(() {
    //     equityController.isValBanlanceSheet.value = true;
    //   });
    // } else {
    //   equityController.isValBanlanceSheet.value = false;
    // }
    if (numberofboard != 0 && numberofShare != 0) {
      equityController.numberOfShareHolders.value = numberofShare;
      equityController.numberofSharecontroller.text = numberofShare.toString();
      equityController.numberOfBoardMembers.value = numberofboard;
      equityController.numberofBoardcontroller.text = numberofboard.toString();
      equityController.haveTheConsenus.value = haveTheConsenus;
      equityController.purposeOfFund.value = purposeOfFund;
      equityController.areYouTheMajorityShareholder.value =
          areYouTheMajorityShareholder;
      equityController.havefinancial.value = havefinancing;
      equityController.businessPlan.value = business;
      equityController.articleOfIncorporation.value = article;
      equityController.incomeStatement.value = incomestments;
      equityController.balanceSheet.value = balancesheet;
      equityController.cashFlowStatement.value = cashflow;
      equityController.marketStudy.value = marketystudy;
      equityController.otherDocuments.value = otherdoc;
      Navigator.pop(context, true);
    }
  }

  final numberofboardFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Material(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Listener(
                onPointerDown: (PointerDownEvent event) =>
                    FocusManager.instance.primaryFocus?.unfocus(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextFieldNew(
                          keyboardType: TextInputType.number,
                          inputFormatterList: [
                            FilteringTextInputFormatter.digitsOnly,
                            FilteringTextInputFormatter.deny(RegExp(r'^0+')),
                            NumericTextFormatter()
                          ],
                          isRequired: true,
                          isValidate:
                              equityController.isValNumberOfShareHolders.value,
                          onEditingComplete: () {
                            FocusScope.of(context)
                                .requestFocus(numberofboardFocus);
                          },
                          labelText: 'Number of Shareholders',
                          hintText: 'Number of Shareholders',
                          onChange: (valueChanged) {
                            var value = valueChanged.replaceAll(',', '');
                            equityController.isValNumberOfShareHolders.value =
                                true;
                            setState(() {
                              if (value.isEmpty) {
                                step3local.numberOfShareHolders = 0;
                              } else {
                                step3local.numberOfShareHolders =
                                    int.parse(value);
                              }
                            });
                          },
                          initialValue: step3local.numberOfShareHolders == 0
                              ? ''
                              : FormatNumber.formatNumberDefualt(
                                      step3local.numberOfShareHolders!)
                                  .toString(),
                        ),
                        CustomTextFieldNew(
                          keyboardType: TextInputType.number,
                          inputFormatterList: [
                            FilteringTextInputFormatter.digitsOnly,
                            FilteringTextInputFormatter.deny(RegExp(r'^0+')),
                            NumericTextFormatter()
                          ],
                          isRequired: true,
                          focusScope: numberofboardFocus,
                          isValidate:
                              equityController.isValNumberOfBoardMembers.value,
                          labelText: 'Number of Board Member',
                          hintText: 'Number of Board Member',
                          onChange: (valueChanged) {
                            var value = valueChanged.replaceAll(',', '');
                            equityController.isValNumberOfBoardMembers.value =
                                true;
                            setState(() {
                              if (value.isEmpty) {
                                step3local.numberOfBoardMembers = 0;
                              } else {
                                step3local.numberOfBoardMembers =
                                    int.parse(value);
                              }
                            });
                          },
                          initialValue: step3local.numberOfBoardMembers == 0
                              ? ''
                              : FormatNumber.formatNumberDefualt(
                                      step3local.numberOfBoardMembers!)
                                  .toString(),
                        ),

                        const Padding(
                          padding: EdgeInsets.only(
                            bottom: 20,
                            right: 20,
                          ),
                          child: CustomTextGetfunding(
                            isrequire: true,
                            label1:
                                'Do you have the consensus of all shareholders to raise new fund?',
                            label2: '',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, bottom: 10),
                          child: Row(
                            children: [
                              CustomSelectgetFunding(
                                onSelect: step3local.haveTheConsenus == 0,
                                title: 'No',
                                ontap: () {
                                  setState(() {
                                    step3local.haveTheConsenus = 0;
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              CustomSelectgetFunding(
                                title: 'Yes',
                                onSelect: step3local.haveTheConsenus == 1,
                                ontap: () {
                                  setState(() {
                                    step3local.haveTheConsenus = 1;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        const Padding(
                          padding: EdgeInsets.only(
                            bottom: 20,
                            right: 20,
                          ),
                          child: CustomTextGetfunding(
                            isrequire: true,
                            label1:
                                'Will the new fund raised be injected into business or used to buy share from existing shareholders?',
                            label2: '',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, bottom: 20, right: 20),
                          child: Row(
                            children: optionController
                                .optionData.value.riaseuseoffund!
                                .map(
                                  (e) => CustomSelect2GetFunding(
                                    title: e.display,
                                    isSelect: step3local.purposeOfFund == e.id,
                                    ontap: () {
                                      setState(() {
                                        step3local.purposeOfFund = e.id;
                                      });
                                    },
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                        const CustomTextGetfunding(
                          isrequire: true,
                          label1:
                              'As key sponsor of the business, you are the majority shareholders?',
                          label2: '',
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, bottom: 20, right: 20, top: 20),
                          child: Row(
                            children: [
                              CustomSelectgetFunding(
                                onSelect:
                                    step3local.areYouTheMajorityShareholder ==
                                        0,
                                title: 'No',
                                ontap: () {
                                  setState(() {
                                    step3local.areYouTheMajorityShareholder = 0;
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              CustomSelectgetFunding(
                                title: 'Yes',
                                onSelect:
                                    step3local.areYouTheMajorityShareholder ==
                                        1,
                                ontap: () {
                                  setState(() {
                                    step3local.areYouTheMajorityShareholder = 1;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        const CustomTextGetfunding(
                          isrequire: true,
                          label1: 'Do you have Business Plan or Presentation?',
                          label2: '',
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, bottom: 20, right: 20, top: 20),
                          child: Row(
                            children: [
                              CustomSelectgetFunding(
                                onSelect: step3local.businessPlan == 0,
                                title: 'No',
                                ontap: () {
                                  setState(() {
                                    step3local.businessPlan = 0;
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              CustomSelectgetFunding(
                                title: 'Yes',
                                onSelect: step3local.businessPlan == 1,
                                ontap: () {
                                  setState(() {
                                    step3local.businessPlan = 1;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),

                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 20),
                        //   child: Text(
                        //     '*Do you have Article of Incorporation?',
                        //     style: Theme.of(context).textTheme.bodyMedium,
                        //   ),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.only(
                        //       left: 20, bottom: 20, right: 20, top: 20),
                        //   child: Row(
                        //     children: [
                        //       CustomSelect2GetFunding(
                        //         title: 'Don\'t Have',
                        //         isSelect:
                        //             step3local.articleOfIncorporation == 0,
                        //         ontap: () {
                        //           setState(() {
                        //             step3local.articleOfIncorporation = 0;
                        //           });
                        //         },
                        //       ),
                        //       const SizedBox(
                        //         width: 20,
                        //       ),
                        //       CustomSelect2GetFunding(
                        //         title: 'Have',
                        //         isSelect:
                        //             step3local.articleOfIncorporation == 1,
                        //         ontap: () {
                        //           setState(() {
                        //             step3local.articleOfIncorporation = 1;
                        //           });
                        //         },
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        const CustomTextGetfunding(
                          isrequire: true,
                          label1: 'Do you have Article of Incorporation?',
                          label2: '',
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, bottom: 20, right: 20, top: 20),
                          child: Row(
                            children: [
                              CustomSelectgetFunding(
                                onSelect:
                                    step3local.articleOfIncorporation == 0,
                                title: 'No',
                                ontap: () {
                                  setState(() {
                                    step3local.articleOfIncorporation = 0;
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              CustomSelectgetFunding(
                                title: 'Yes',
                                onSelect:
                                    step3local.articleOfIncorporation == 1,
                                ontap: () {
                                  setState(() {
                                    step3local.articleOfIncorporation = 1;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        // CustomFilePicker(
                        //   fileList: step3local.businessPlan,
                        //   haveFile: step3local.businessPlan!.length != 0,
                        //   onTap: (file) {
                        //     setState(() {
                        //       step3local.businessPlan!.add(file);
                        //     });
                        //   },
                        // ),
                        // if (step3local.businessPlan!.length != 0)
                        //   CustomShowImageFile(
                        //     listfile: step3local.businessPlan,
                        //     ontap: (file, index) {
                        //       setState(() {
                        //         step3local.businessPlan![index] = file;
                        //       });
                        //     },
                        //     onRemove: (file) {
                        //       setState(() {
                        //         step3local.businessPlan!.remove(file);
                        //       });
                        //     },
                        //   ),
                        // SizedBox(
                        //   height: 20,
                        // ),
                        // const CustomTextGetfunding(
                        //   label1: 'Article of Incorporation ',
                        //   label2: '(File Attachment)',
                        // ),
                        // const SizedBox(
                        //   height: 20,
                        // ),
                        // CustomFilePicker(
                        //   fileList: step3local.articleOfIncorporation,
                        //   haveFile:
                        //       step3local.articleOfIncorporation!.length != 0,
                        //   onTap: (file) {
                        //     setState(() {
                        //       step3local.articleOfIncorporation!.add(file);
                        //     });
                        //   },
                        // ),
                        // if (step3local.articleOfIncorporation!.length != 0)
                        //   CustomShowImageFile(
                        //     listfile: step3local.articleOfIncorporation,
                        //     ontap: (file, index) {
                        //       setState(() {
                        //         step3local.articleOfIncorporation![index] =
                        //             file;
                        //       });
                        //     },
                        //     onRemove: (file) {
                        //       setState(() {
                        //         step3local.articleOfIncorporation!.remove(file);
                        //       });
                        //     },
                        //   ),
                        // const SizedBox(
                        //   height: 20,
                        // ),
                        // Container(
                        //   color: AppColor.dividerBackground,
                        //   height: 5,
                        // ),

                        // const Padding(
                        //   padding: EdgeInsets.symmetric(
                        //       horizontal: 20, vertical: 20),
                        //   child: Text(
                        //     'Financial Performance and Projection',
                        //     style: TextStyle(
                        //         fontFamily: 'DMSans',
                        //         fontSize: 15,
                        //         color: Color(0xff0F50A4),
                        //         fontWeight: FontWeight.w700),
                        //   ),
                        // ),

                        // const CustomTextGetfunding(
                        //   isrequire: true,
                        //   label1:
                        //       'Do you have Income statment (Monthly and yearly statments during the last 3)?',
                        //   label2: '',
                        // ),

                        // Padding(
                        //   padding: const EdgeInsets.only(
                        //       left: 20, bottom: 20, right: 20, top: 20),
                        //   child: Row(
                        //     children: [
                        //       CustomSelectgetFunding(
                        //         onSelect: step3local.incomeStatement == 0,
                        //         title: 'No',
                        //         ontap: () {
                        //           step3local.incomeStatement = 0;
                        //         },
                        //       ),
                        //       const SizedBox(
                        //         width: 20,
                        //       ),
                        //       CustomSelectgetFunding(
                        //         title: 'Yes',
                        //         onSelect: step3local.incomeStatement == 1,
                        //         ontap: () {
                        //           step3local.incomeStatement = 1;
                        //         },
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // CustomFilePicker(
                        //   fileList: step3local.incomeStatement,
                        //   validate: equityController.isValincomeStatement.value,
                        //   haveFile: step3local.incomeStatement!.length != 0,
                        //   onTap: (file) {
                        //     setState(() {
                        //       step3local.incomeStatement!.add(file);
                        //     });
                        //   },
                        // ),
                        // if (step3local.incomeStatement!.length != 0)
                        //   CustomShowImageFile(
                        //     listfile: step3local.incomeStatement,
                        //     ontap: (file, index) {
                        //       setState(() {
                        //         step3local.incomeStatement![index] = file;
                        //       });
                        //     },
                        //     onRemove: (file) {
                        //       setState(() {
                        //         step3local.incomeStatement!.remove(file);
                        //       });
                        //     },
                        //   ),
                        // const SizedBox(
                        //   height: 20,
                        // ),
                        // const CustomTextGetfunding(
                        //   isrequire: true,
                        //   label1:
                        //       'Balance sheet (Monthly and yearly statements during the last 3) ',
                        //   label2: 'File Attachment',
                        // ),
                        // const SizedBox(
                        //   height: 20,
                        // ),
                        // CustomFilePicker(
                        //   fileList: step3local.balanceSheet,
                        //   validate: equityController.isValBanlanceSheet.value,
                        //   haveFile: step3local.balanceSheet!.length != 0,
                        //   onTap: (file) {
                        //     setState(() {
                        //       step3local.balanceSheet!.add(file);
                        //     });
                        //   },
                        // ),
                        // if (step3local.balanceSheet!.length != 0)
                        //   CustomShowImageFile(
                        //     listfile: step3local.balanceSheet,
                        //     ontap: (file, index) {
                        //       setState(() {
                        //         step3local.balanceSheet![index] = file;
                        //       });
                        //     },
                        //     onRemove: (file) {
                        //       setState(() {
                        //         step3local.balanceSheet!.remove(file);
                        //       });
                        //     },
                        //   ),
                        // const SizedBox(
                        //   height: 20,
                        // ),
                        // const CustomTextGetfunding(
                        //   label1:
                        //       'Cash flow statement (Monthly and yearly statements during the last 3)',
                        //   label2: 'File Attachment',
                        // ),
                        // const SizedBox(
                        //   height: 20,
                        // ),
                        // CustomFilePicker(
                        //   fileList: step3local.cashFlowStatement,
                        //   haveFile: step3local.cashFlowStatement!.length != 0,
                        //   onTap: (file) {
                        //     setState(() {
                        //       step3local.cashFlowStatement!.add(file);
                        //     });
                        //   },
                        // ),
                        // if (step3local.cashFlowStatement!.length != 0)
                        //   CustomShowImageFile(
                        //     listfile: step3local.cashFlowStatement,
                        //     ontap: (file, index) {
                        //       setState(() {
                        //         step3local.cashFlowStatement![index] = file;
                        //       });
                        //     },
                        //     onRemove: (file) {
                        //       setState(() {
                        //         step3local.cashFlowStatement!.remove(file);
                        //       });
                        //     },
                        //   ),
                        // const SizedBox(
                        //   height: 20,
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 20),
                        //   child: Text(
                        //     '*Do you have balance Sheet (Monthly and yearly statement during last 3 years?',
                        //     style: Theme.of(context).textTheme.bodyMedium,
                        //   ),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.only(
                        //       left: 20, bottom: 20, right: 20, top: 20),
                        //   child: Row(
                        //     children: [
                        //       CustomSelect2GetFunding(
                        //         title: 'Don\'t Have',
                        //         isSelect: step3local.balanceSheet == 0,
                        //         ontap: () {
                        //           setState(() {
                        //             step3local.balanceSheet = 0;
                        //           });
                        //         },
                        //       ),
                        //       const SizedBox(
                        //         width: 20,
                        //       ),
                        //       CustomSelect2GetFunding(
                        //         title: 'Have',
                        //         isSelect: step3local.balanceSheet == 1,
                        //         ontap: () {
                        //           setState(() {
                        //             step3local.balanceSheet = 1;
                        //           });
                        //         },
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 20),
                        //   child: Text(
                        //     '*Do you have Cash Flow Statement (Monthly and yearly statement during last 3 years)?',
                        //     style: Theme.of(context).textTheme.bodyMedium,
                        //   ),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.only(
                        //       left: 20, bottom: 20, right: 20, top: 20),
                        //   child: Row(
                        //     children: [
                        //       CustomSelect2GetFunding(
                        //         title: 'Don\'t Have',
                        //         isSelect: step3local.cashFlowStatement == 0,
                        //         ontap: () {
                        //           setState(() {
                        //             step3local.cashFlowStatement = 0;
                        //           });
                        //         },
                        //       ),
                        //       const SizedBox(
                        //         width: 20,
                        //       ),
                        //       CustomSelect2GetFunding(
                        //         title: 'Have',
                        //         isSelect: step3local.cashFlowStatement == 1,
                        //         ontap: () {
                        //           setState(() {
                        //             step3local.cashFlowStatement = 1;
                        //           });
                        //         },
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 20),
                        //   child: Text(
                        //     '*Do you have the financial projection (3 to 5 year)?',
                        //     style: Theme.of(context).textTheme.bodyMedium,
                        //   ),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.only(
                        //       left: 20, bottom: 20, right: 20, top: 20),
                        //   child: Row(
                        //     children: [
                        //       CustomSelect2GetFunding(
                        //         title: 'Don\'t Have',
                        //         isSelect: step3local.havefinancial == 0,
                        //         ontap: () {
                        //           setState(() {
                        //             step3local.havefinancial = 0;
                        //           });
                        //         },
                        //       ),
                        //       const SizedBox(
                        //         width: 20,
                        //       ),
                        //       CustomSelect2GetFunding(
                        //         title: 'Have',
                        //         isSelect: step3local.havefinancial == 1,
                        //         ontap: () {
                        //           setState(() {
                        //             step3local.havefinancial = 1;
                        //           });
                        //         },
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // Container(
                        //   color: AppColor.dividerBackground,
                        //   height: 5,
                        // ),
                        // const Padding(
                        //   padding: EdgeInsets.symmetric(
                        //       horizontal: 20, vertical: 20),
                        //   child: Text(
                        //     'Other',
                        //     style: TextStyle(
                        //         fontFamily: 'DMSans',
                        //         fontSize: 17,
                        //         color: AppColor.darkColor,
                        //         fontWeight: FontWeight.bold),
                        //   ),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 20),
                        //   child: Text(
                        //     '*Do you have market study documents?',
                        //     style: Theme.of(context).textTheme.bodyMedium,
                        //   ),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.only(
                        //       left: 20, bottom: 20, right: 20, top: 20),
                        //   child: Row(
                        //     children: [
                        //       CustomSelect2GetFunding(
                        //         title: 'Don\'t Have',
                        //         isSelect: step3local.marketStudy == 0,
                        //         ontap: () {
                        //           setState(() {
                        //             step3local.marketStudy = 0;
                        //           });
                        //         },
                        //       ),
                        //       const SizedBox(
                        //         width: 20,
                        //       ),
                        //       CustomSelect2GetFunding(
                        //         title: 'Have',
                        //         isSelect: step3local.marketStudy == 1,
                        //         ontap: () {
                        //           setState(() {
                        //             step3local.marketStudy = 1;
                        //           });
                        //         },
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 20),
                        //   child: Text(
                        //     '*Do you have other documets necessary for business and market understanding?',
                        //     style: Theme.of(context).textTheme.bodyMedium,
                        //   ),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.only(
                        //       left: 20, bottom: 20, right: 20, top: 20),
                        //   child: Row(
                        //     children: [
                        //       CustomSelect2GetFunding(
                        //         title: 'Don\'t Have',
                        //         isSelect: step3local.otherDocuments == 0,
                        //         ontap: () {
                        //           setState(() {
                        //             step3local.otherDocuments = 0;
                        //           });
                        //         },
                        //       ),
                        //       const SizedBox(
                        //         width: 20,
                        //       ),
                        //       CustomSelect2GetFunding(
                        //         title: 'Have',
                        //         isSelect: step3local.otherDocuments == 1,
                        //         ontap: () {
                        //           setState(() {
                        //             step3local.otherDocuments = 1;
                        //           });
                        //         },
                        //       ),
                        //     ],
                        //   ),
                        // ),

                        // const SizedBox(
                        //   height: 10,
                        // ),
                        // Container(
                        //   color: AppColor.dividerBackground,
                        //   height: 2,
                        // ),
                      ],
                    ),

                    // equityController.patentDoc != null
                    //     ? Text(equityController.patentDoc!.path)
                    //     : Container(),
                  ],
                ),
              ),
            )),
            Container(
              margin: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 20, top: 10),
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
                      onPressed: step3defual == step3local
                          ? null
                          : () {
                              FirebaseAnalyticsHelper.sendAnalyticsEvent(
                                  "Equity Edit RequiredDoc Preview Form");
                              _onpressRequiredDoc(
                                context,
                                step3local.numberOfShareHolders,
                                step3local.numberOfBoardMembers,
                                step3local.haveTheConsenus,
                                step3local.purposeOfFund,
                                step3local.areYouTheMajorityShareholder,
                                step3local.havefinancial,
                                step3local.incomeStatement,
                                step3local.balanceSheet,
                                step3local.businessPlan,
                                step3local.articleOfIncorporation,
                                step3local.cashFlowStatement,
                                step3local.marketStudy,
                                step3local.otherDocuments,
                              );
                            },
                      title: 'Save',
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
