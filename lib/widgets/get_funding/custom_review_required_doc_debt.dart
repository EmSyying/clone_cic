import 'package:cicgreenloan/widgets/get_funding/custom_select_getfunding.dart';
import 'package:cicgreenloan/widgets/get_funding/custom_text_getfunding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Utils/form_builder/custom_form_card.dart';
import '../../modules/get_funding/controller/debt_investment_controller.dart';

class CustomRiviewRequiredDocInDebt extends StatefulWidget {
  final GestureTapCallback? onTap;
  final bool? isEdit;
  const CustomRiviewRequiredDocInDebt({Key? key, this.onTap, this.isEdit})
      : super(key: key);

  @override
  State<CustomRiviewRequiredDocInDebt> createState() =>
      _CustomRiviewRequiredDocInDebtState();
}

class _CustomRiviewRequiredDocInDebtState
    extends State<CustomRiviewRequiredDocInDebt> {
  final DebtInvestmentController debtCon = Get.put(DebtInvestmentController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        ),
        CustomFormCard(
          isRadius: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 20,
                  left: 20,
                  top: 10,
                  bottom: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // const Text(
                    //   'Required Documents*',
                    //   style: TextStyle(
                    //       fontFamily: 'DMSans',
                    //       fontSize: 16,
                    //       color: Colors.black,
                    //       fontWeight: FontWeight.w700),
                    // ),
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'Required Documents',
                            style: TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextSpan(
                            text: '*',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    if (widget.isEdit!)
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Container(
                          color: Colors.transparent,
                          padding: const EdgeInsets.all(6.0),
                          width: 30,
                          height: 32,
                          child: SvgPicture.asset(
                              'assets/images/svgfile/editedIcon.svg'),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // const CustomTextGetfunding(
              //   isColorReView: true,
              //   isrequire: true,
              //   label1:
              //       'Do you have Income Statement (Monthly and yearly statement during last 3 years)?',
              //   label2: '',
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Do you have Income Statement (Monthly and yearly statement during last 3 years)?',
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff464646),
                      ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    debtCon.incomeStatement.value == 0
                        ? CustomSelectgetFunding(
                            onSelect: true,
                            title: 'No',
                            ontap: () {},
                          )
                        : CustomSelectgetFunding(
                            title: 'Yes',
                            onSelect: true,
                            ontap: () {},
                          ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Do you have Balance Sheet (Monthly and yearly statement during last 3 years)?',
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff464646),
                      ),
                ),
              ),
              // const CustomTextGetfunding(
              //   isColorReView: true,
              //   isrequire: true,
              //   label1:
              //       'Do you have Balance Sheet (Monthly and yearly statement during last 3 years)?',
              //   label2: '',
              // ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    debtCon.balanceSheet.value == 0
                        ? CustomSelectgetFunding(
                            onSelect: true,
                            title: 'No',
                            ontap: () {},
                          )
                        : CustomSelectgetFunding(
                            title: 'Yes',
                            onSelect: true,
                            ontap: () {},
                          ),
                  ],
                ),
              ),
              // const CustomTextGetfunding(
              //   isColorReView: true,
              //   isrequire: true,
              //   label1:
              //       'Do you have Cash Flow Statement (Monthly and yearly statement during last 3 years)?',
              //   label2: '',
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Do you have Cash Flow Statement (Monthly and yearly statement during last 3 years)?',
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff464646),
                      ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    debtCon.cashFlowStatement.value == 0
                        ? CustomSelectgetFunding(
                            onSelect: true,
                            title: 'No',
                            ontap: () {},
                          )
                        : CustomSelectgetFunding(
                            title: 'Yes',
                            onSelect: true,
                            ontap: () {},
                          ),
                  ],
                ),
              ),
              const CustomTextGetfunding(
                isColorReView: true,
                isrequire: true,
                label1: 'Do you have Business Plan/Presentation?',
                label2: '',
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    debtCon.businessPlan.value == 0
                        ? CustomSelectgetFunding(
                            onSelect: true,
                            title: 'No',
                            ontap: () {},
                          )
                        : CustomSelectgetFunding(
                            title: 'Yes',
                            onSelect: true,
                            ontap: () {},
                          ),
                  ],
                ),
              ),
              const CustomTextGetfunding(
                isColorReView: true,
                isrequire: true,
                label1:
                    'Do you have Other documents necessary for business and market understanding?',
                label2: '',
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    debtCon.otherDocuments.value == 0
                        ? CustomSelectgetFunding(
                            onSelect: true,
                            title: 'No',
                            ontap: () {},
                          )
                        : CustomSelectgetFunding(
                            title: 'Yes',
                            onSelect: true,
                            ontap: () {},
                          ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
