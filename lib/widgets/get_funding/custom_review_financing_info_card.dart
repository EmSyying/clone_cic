import 'package:cicgreenloan/widgets/member_directory/member_displayinfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Utils/form_builder/custom_form_card.dart';
import '../../Utils/helper/format_number.dart';

class CustomFinancingInfo extends StatelessWidget {
  final String? useOfFund;
  final String? financingAmount, date;
  final GestureTapCallback? onTap;
  final bool? isEditable;
  const CustomFinancingInfo(
      {Key? key,
      this.isEditable,
      this.financingAmount,
      this.date,
      this.onTap,
      this.useOfFund})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomFormCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // const Text(
                    //   'Financing Information',
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
                            text: 'Financing Information',
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
                    if (isEditable!)
                      GestureDetector(
                        onTap: onTap,
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
              if (financingAmount != '')
                MemberDisplayInfo(
                    isLongLabel: true,
                    changeColorText: true,
                    label: 'Financing Amount :',
                    isTextAlignRight: true,
                    value:
                        '\$${FormatNumber.formatNumber(double.parse(financingAmount!))}'),
              if (date != '')
                MemberDisplayInfo(
                    changeColorText: true,
                    isTextAlignRight: true,
                    label: 'Intended Date of Disbursement :',
                    value: date!),
              if (useOfFund != '')
                MemberDisplayInfo(
                    changeColorText: true,
                    isTextAlignRight: true,
                    isLongLabel: true,
                    label: 'Use of Fund :',
                    value: useOfFund!),
            ],
          ),
        ),
      ],
    );
  }
}
