import 'package:cicgreenloan/widgets/get_funding/custom_select_2_getfunding.dart';
import 'package:cicgreenloan/widgets/member_directory/member_displayinfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../Utils/form_builder/custom_form_card.dart';
import '../../modules/get_funding/controller/equity_investment_controller.dart';

// ignore: must_be_immutable
class CustomReviewCompanyInfocard extends StatefulWidget {
  final String? title;
  final String? companyName;
  final String? address;
  final String? year;
  final String? typeofOrganization;
  final String? taxIdentification;
  final String? industry;
  final String? numberofStaff, ownername, productSevice;
  int? patentDoc, mocCertificate, licenceDoc, memorandom;
  final Function? onEditpatent, onEditMoc, onEditLicence;
  final GestureTapCallback? onTap;

  final bool? isEditable;

  CustomReviewCompanyInfocard(
      {Key? key,
      this.title,
      this.year,
      this.address,
      this.typeofOrganization,
      this.isEditable = false,
      this.companyName,
      this.taxIdentification,
      this.onTap,
      this.industry,
      this.licenceDoc,
      this.mocCertificate,
      this.memorandom,
      this.numberofStaff,
      this.ownername,
      this.patentDoc,
      this.productSevice,
      this.onEditLicence,
      this.onEditMoc,
      this.onEditpatent})
      : super(key: key);

  @override
  State<CustomReviewCompanyInfocard> createState() =>
      _CustomReviewCompanyInfocardState();
}

class _CustomReviewCompanyInfocardState
    extends State<CustomReviewCompanyInfocard> {
  final equityCon = Get.put(EquityInvestmentController());
  @override
  void initState() {
    super.initState();
  }

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
                      //   widget.title ?? 'Company Information',
                      //   style: const TextStyle(
                      //       fontFamily: 'DMSans',
                      //       fontSize: 16,
                      //       color: Colors.black,
                      //       fontWeight: FontWeight.w700),
                      // ),
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: 'Company Information',
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
                if (widget.companyName != '')
                  MemberDisplayInfo(
                      changeColorText: true,
                      label: 'Company Name :',
                      isTextAlignRight: true,
                      value: widget.companyName!),
                if (widget.year != '')
                  MemberDisplayInfo(
                      changeColorText: true,
                      isTextAlignRight: true,
                      isLongLabel: true,
                      label: 'Year of Establishment :',
                      value: widget.year!),
                if (widget.typeofOrganization != '')
                  MemberDisplayInfo(
                    isLongLabel: true,
                    changeColorText: true,
                    label: 'Type of Organization :',
                    isTextAlignRight: true,
                    value: widget.typeofOrganization ?? "",
                  ),
                if (widget.taxIdentification != '')
                  MemberDisplayInfo(
                      isLongLabel: true,
                      changeColorText: true,
                      label: 'Tax Identification Number :',
                      isTextAlignRight: true,
                      value: widget.taxIdentification),
                if (widget.industry != null)
                  MemberDisplayInfo(
                      changeColorText: true,
                      label: 'Industry :',
                      isTextAlignRight: true,
                      value: widget.industry),
                if (widget.numberofStaff != '')
                  MemberDisplayInfo(
                      changeColorText: true,
                      label: 'Number of Staff :',
                      isTextAlignRight: true,
                      value: widget.numberofStaff!),
                if (widget.ownername != '')
                  MemberDisplayInfo(
                      changeColorText: true,
                      label: 'Owner Name :',
                      isTextAlignRight: true,
                      value: widget.ownername!),
                if (widget.productSevice != '')
                  MemberDisplayInfo(
                      changeColorText: true,
                      label: 'Product Service :',
                      isTextAlignRight: true,
                      value: widget.productSevice!),
                if (widget.address != '')
                  MemberDisplayInfo(
                    changeColorText: true,
                    isTextAlignRight: true,
                    isMultipleLine: true,
                    label: 'Address :',
                    value: widget.address!,
                  ),
                if (widget.patentDoc != 0 ||
                    widget.licenceDoc != 0 ||
                    widget.mocCertificate != 0 ||
                    widget.memorandom != 0)
                  Container(
                    margin: const EdgeInsets.only(
                      right: 20,
                      left: 20,
                      top: 20,
                    ),
                    height: 0.50,
                    width: double.infinity,
                    color: Colors.grey,
                  ),
                if (widget.patentDoc != 0 ||
                    widget.licenceDoc != 0 ||
                    widget.mocCertificate != 0 ||
                    widget.memorandom != 0)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Text(
                      'Which of the following legal documents that you have? (Multiple selections)',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontFamily: 'DMSans',
                            fontSize: 14,
                            color: const Color(0xff464646),
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                  ),
                if (widget.patentDoc != 0)
                  Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    child: CustomSelect2GetFunding(
                      isMultipleSelect: true,
                      title: 'Company’s Patent Document',
                      isSelect: true,
                      ontap: () {},
                    ),
                  ),
                if (widget.mocCertificate != 0)
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 20, left: 20, top: 20),
                    child: CustomSelect2GetFunding(
                      isMultipleSelect: true,
                      title: 'Company’s MOC Certificate',
                      isSelect: true,
                      ontap: () {},
                    ),
                  ),
                if (widget.licenceDoc != 0)
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 20, left: 20, top: 20),
                    child: CustomSelect2GetFunding(
                      isMultipleSelect: true,
                      title: 'Company’s License Document',
                      isSelect: true,
                      ontap: () {},
                    ),
                  ),
                if (widget.memorandom != 0)
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 20, left: 20, top: 20),
                    child: CustomSelect2GetFunding(
                      isMultipleSelect: true,
                      title:
                          'Company’s Memorandum And Article Of \n Association',
                      isSelect: true,
                      ontap: () {},
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
