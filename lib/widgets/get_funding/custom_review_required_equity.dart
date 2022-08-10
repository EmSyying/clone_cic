import 'package:cicgreenloan/Utils/option_controller/option_controller.dart';
import 'package:cicgreenloan/modules/get_funding/controller/equity_investment_controller.dart';
import 'package:cicgreenloan/widgets/get_funding/custom_select_getfunding.dart';
import 'package:cicgreenloan/widgets/get_funding/custom_text_getfunding.dart';
import 'package:cicgreenloan/widgets/member_directory/member_displayinfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../Utils/form_builder/custom_form_card.dart';
import 'custom_select_2_getfunding.dart';

// ignore: must_be_immutable
class CustomReviewRequiredCard extends StatefulWidget {
  final String? numberofshare;
  final String? numberofboard;
  final int? havetheconsensus;
  final int? purposeEquity;
  final int? majority;
  final int? havethefinancail;
  int? businessplan,
      article,
      incomingstatement,
      balancesheet,
      cashflow,
      marketstudy,
      otherdoc;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onTabFinancialProject;
  final GestureTapCallback? onTabOtherProject;

  final bool? isEditable;

  CustomReviewRequiredCard(
      {Key? key,
      this.havetheconsensus,
      this.numberofboard,
      this.purposeEquity,
      this.isEditable = false,
      this.numberofshare,
      this.majority,
      this.onTap,
      this.havethefinancail,
      this.article,
      this.balancesheet,
      this.businessplan,
      this.cashflow,
      this.incomingstatement,
      this.marketstudy,
      this.otherdoc,
      this.onTabFinancialProject,
      this.onTabOtherProject})
      : super(key: key);

  @override
  State<CustomReviewRequiredCard> createState() =>
      _CustomReviewRequiredCardState();
}

class _CustomReviewRequiredCardState extends State<CustomReviewRequiredCard> {
  final optionController = Get.put(DocumentCategory());
  final equityController = Get.put(EquityInvestmentController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
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
                      // Text(
                      //   'Required Documents',
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
                      // if (widget.isEditable!)
                      //   GestureDetector(
                      //     onTap: widget.onTap,
                      //     child: SvgPicture.asset(
                      //         'assets/images/svgfile/editedIcon.svg'),
                      //   ),
                    ],
                  ),
                ),
                if (widget.numberofshare != '')
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Business Overview',
                          style: TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: 14,
                              color: Color(0xff0F50A4),
                              fontWeight: FontWeight.w700),
                        ),
                        if (widget.isEditable!)
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
                MemberDisplayInfo(
                    isLongLabel: true,
                    changeColorText: true,
                    label: 'Number of Shareholders :',
                    isTextAlignRight: true,
                    value: widget.numberofshare!),
                if (widget.numberofboard != '')
                  MemberDisplayInfo(
                      isLongLabel: true,
                      changeColorText: true,
                      label: 'Number of Board Member :',
                      isTextAlignRight: true,
                      value: widget.numberofboard!),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  height: 0.5,
                  width: double.infinity,
                  color: Colors.grey,
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                  ),
                  child: CustomTextGetfunding(
                    isrequire: true,
                    isColorReView: true,
                    label1:
                        'Do you have the consenus of all shareholders to raise new fund?',
                    label2: '',
                  ),
                ),
                widget.havetheconsensus == 1
                    ? const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: CustomSelectgetFunding(
                            onSelect: true, title: 'Yes'),
                      )
                    : const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: CustomSelectgetFunding(
                          onSelect: true,
                          title: 'No',
                        ),
                      ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Text(
                    'Will the new fund raised be injected into business or used to buy share from existing shareholders?',
                    style: TextStyle(
                        fontFamily: 'DMSans',
                        fontSize: 14,
                        color: Color(0xff464646),
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Column(
                  children: optionController.optionData.value.riaseuseoffund!
                      .map((e) {
                    return widget.purposeEquity == e.id
                        ? Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: CustomSelect2GetFunding(
                              title: e.display,
                              isSelect: true,
                              ontap: () {},
                            ),
                          )
                        : Container();
                  }).toList(),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Text(
                    'As key sponsor of the business, you are the majority shareholders?',
                    style: TextStyle(
                        fontFamily: 'DMSans',
                        fontSize: 14,
                        color: Color(0xff464646),
                        fontWeight: FontWeight.w400),
                  ),
                ),
                widget.majority == 1
                    ? const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: CustomSelectgetFunding(
                            onSelect: true, title: 'Yes'),
                      )
                    : const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: CustomSelectgetFunding(
                          onSelect: true,
                          title: 'No',
                        ),
                      ),
                const SizedBox(height: 20.0),
                const CustomTextGetfunding(
                  isrequire: true,
                  isColorReView: true,
                  label1: 'Do you have Business Plan / Presentation?',
                  label2: '',
                ),
                const SizedBox(height: 20.0),
                widget.businessplan == 1
                    ? const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: CustomSelectgetFunding(
                            onSelect: true, title: 'Yes'),
                      )
                    : const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: CustomSelectgetFunding(
                          onSelect: true,
                          title: 'No',
                        ),
                      ),
                const SizedBox(height: 20.0),
                const CustomTextGetfunding(
                  isrequire: true,
                  isColorReView: true,
                  label1: 'Do you have Article of Incorporation?',
                  label2: '',
                ),
                const SizedBox(height: 20.0),
                widget.article == 1
                    ? const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: CustomSelectgetFunding(
                            onSelect: true, title: 'Yes'),
                      )
                    : const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: CustomSelectgetFunding(
                          onSelect: true,
                          title: 'No',
                        ),
                      ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Financial Performance and Projection',
                        style: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 14,
                            color: Color(0xff0F50A4),
                            fontWeight: FontWeight.w700),
                      ),
                      if (widget.isEditable!)
                        GestureDetector(
                          onTap: widget.onTabFinancialProject,
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
                const Padding(
                  padding: EdgeInsets.only(top: 0, bottom: 16),
                  child: CustomTextGetfunding(
                    isColorReView: true,
                    isrequire: false,
                    label1:
                        'Do you have Income Statement (Monthly and yearly statement during last 3 years)?',
                    label2: '',
                  ),
                ),
                widget.incomingstatement == 1
                    ? const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: CustomSelectgetFunding(
                            onSelect: true, title: 'Yes'),
                      )
                    : const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: CustomSelectgetFunding(
                          onSelect: true,
                          title: 'No',
                        ),
                      ),
                const Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 16),
                  child: CustomTextGetfunding(
                    isColorReView: true,
                    isrequire: false,
                    label1:
                        'Do you have Balance Sheet (Monthly and yearly statement during last 3 years)?',
                    label2: '',
                  ),
                ),
                widget.balancesheet == 1
                    ? const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: CustomSelectgetFunding(
                            onSelect: true, title: 'Yes'),
                      )
                    : const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: CustomSelectgetFunding(
                          onSelect: true,
                          title: 'No',
                        ),
                      ),
                const Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 16),
                  child: CustomTextGetfunding(
                    isColorReView: true,
                    isrequire: false,
                    label1:
                        'Do you have Cash Flow Statement (Monthly and yearly statement during last 3 years)?',
                    label2: '',
                  ),
                ),
                widget.cashflow == 1
                    ? const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: CustomSelectgetFunding(
                            onSelect: true, title: 'Yes'),
                      )
                    : const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: CustomSelectgetFunding(
                          onSelect: true,
                          title: 'No',
                        ),
                      ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 16, top: 16),
                  child: CustomTextGetfunding(
                    isrequire: true,
                    isColorReView: true,
                    label1:
                        'Do you have the financial projection (3 to 5 year)?',
                    label2: '',
                  ),
                ),
                widget.havethefinancail == 1
                    ? const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: CustomSelectgetFunding(
                            onSelect: true, title: 'Yes'),
                      )
                    : const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: CustomSelectgetFunding(
                          onSelect: true,
                          title: 'No',
                        ),
                      ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Other',
                        style: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 14,
                            color: Color(0xff0F50A4),
                            fontWeight: FontWeight.w700),
                      ),
                      if (widget.isEditable!)
                        GestureDetector(
                          onTap: widget.onTabOtherProject,
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
                const Padding(
                  padding: EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                  ),
                  child: CustomTextGetfunding(
                    isrequire: true,
                    isColorReView: true,
                    label1: 'Do you have market study documents?',
                    label2: '',
                  ),
                ),
                widget.marketstudy == 1
                    ? const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: CustomSelectgetFunding(
                            onSelect: true, title: 'Yes'),
                      )
                    : const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: CustomSelectgetFunding(
                          onSelect: true,
                          title: 'No',
                        ),
                      ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 20, right: 20, top: 20),
                  child: CustomTextGetfunding(
                    isrequire: true,
                    isColorReView: true,
                    label1:
                        'Do you have other documents necessary for business and market understanding?',
                    label2: '',
                  ),
                ),
                widget.otherdoc == 1
                    ? const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: CustomSelectgetFunding(
                            onSelect: true, title: 'Yes'),
                      )
                    : const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: CustomSelectgetFunding(
                          onSelect: true,
                          title: 'No',
                        ),
                      ),
                const SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
