import 'package:cicgreenloan/widgets/member_directory/member_displayinfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomReviewFinancingCard extends StatelessWidget {
  final bool? isEdit;
  final GestureTapCallback? onTap;
  final String? financingPurpose;
  final String? financingAmount;
  final String? term;
  final String? intendedDate;
  final String? productType;

  const CustomReviewFinancingCard({
    this.isEdit,
    this.onTap,
    this.productType,
    this.financingAmount,
    this.financingPurpose,
    this.intendedDate,
    this.term,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
              blurRadius: 4,
              offset: Offset(
                0.0,
                1.0,
              ),
              color: Colors.black12),
        ],
        color: Theme.of(context).cardColor,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // const Text(
                //   "Financing Information*",
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
                if (isEdit!)
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
          if (financingPurpose != "")
            MemberDisplayInfo(
              changeColorText: true,
              isTextAlignRight: true,
              label: 'Financing Purpose :',
              isLongLabel: true,
              value: financingPurpose,
            ),
          if (financingAmount != "")
            MemberDisplayInfo(
              changeColorText: true,
              isTextAlignRight: true,
              label: 'Financing Amount :',
              isLongLabel: true,
              value: financingAmount,
            ),
          if (term != '')
            MemberDisplayInfo(
              changeColorText: true,
              isTextAlignRight: true,
              label: 'Term :',
              isLongLabel: true,
              value: term,
            ),
          if (intendedDate != '')
            MemberDisplayInfo(
              changeColorText: true,
              isTextAlignRight: true,
              label: 'Intended Date Of Dibursement :',
              isLongLabel: true,
              value: intendedDate,
            ),
          const SizedBox(
            height: 20.0,
          )
        ],
      ),
    );
  }
}
