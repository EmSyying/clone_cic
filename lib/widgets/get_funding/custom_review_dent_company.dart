import 'package:cicgreenloan/modules/get_funding/controller/debt_investment_controller.dart';
import 'package:cicgreenloan/modules/get_funding/screens/equity_investment/PopupEdit/popup_image_edit.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_form_card.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_material_modal_sheet.dart';
import 'package:cicgreenloan/widgets/get_funding/custom_show_image_file.dart';
import 'package:cicgreenloan/widgets/get_funding/custom_text_getfunding.dart';
import 'package:cicgreenloan/widgets/member_directory/member_displayinfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomReviewDebtCompany extends StatefulWidget {
  final String? title;
  final String? companyName;
  final String? address;
  final String? year;
  final String? typeofOrganization;
  final String? taxIdentification;
  final String? industry;
  final String? numberofStaff, ownername, productSevice;
  final List? patentDoc, mocCertificate, licenceDoc;
  final GestureTapCallback? onTap;
  final bool? isEditable;
  const CustomReviewDebtCompany(
      {Key? key,
      this.address,
      this.isEditable,
      this.companyName,
      this.industry,
      this.licenceDoc,
      this.mocCertificate,
      this.numberofStaff,
      this.onTap,
      this.ownername,
      this.patentDoc,
      this.productSevice,
      this.taxIdentification,
      this.title,
      this.typeofOrganization,
      this.year})
      : super(key: key);

  @override
  State<CustomReviewDebtCompany> createState() =>
      _CustomReviewDebtCompanyState();
}

class _CustomReviewDebtCompanyState extends State<CustomReviewDebtCompany> {
  DebtInvestmentController debtCon = Get.put(DebtInvestmentController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title ?? 'Company Information',
                  style: const TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 16,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
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
          CustomFormCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                      value: widget.typeofOrganization!),
                if (widget.taxIdentification != '')
                  MemberDisplayInfo(
                      isLongLabel: true,
                      changeColorText: true,
                      label: 'Tax Identification Number :',
                      isTextAlignRight: true,
                      value: widget.taxIdentification!),
                if (widget.industry != '')
                  MemberDisplayInfo(
                      changeColorText: true,
                      label: 'Industry :',
                      isTextAlignRight: true,
                      value: widget.industry!),
                if (widget.numberofStaff != '')
                  MemberDisplayInfo(
                      isLongLabel: true,
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
                      isLongLabel: true,
                      changeColorText: true,
                      label: 'Product Service :',
                      isTextAlignRight: true,
                      value: widget.productSevice!),
                if (widget.address != '')
                  MemberDisplayInfo(
                      changeColorText: true,
                      label: 'Address :',
                      isTextAlignRight: true,
                      value: widget.address!),
                if (widget.patentDoc!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 10),
                    child: CustomTextGetfunding(
                      label1: 'Company’s Patent Document  ',
                      label2: ' (File Attachment)',
                      isEdit: widget.isEditable!,
                      onTap: () async {
                        var result = await onShowCustomCupertinoModalSheet(
                            icon: const Icon(Icons.clear),
                            isNoIcon: false,
                            title: 'Company Infomation',
                            context: context,
                            child: PersonalInfoPopup(
                              image: widget.patentDoc,
                              label:
                                  'Company’s Patent Document   (File Attachment)',
                            ));
                        if (result != null) {
                          setState(() {
                            debtCon.patentDoc.value = result;
                          });
                        } else {}
                      },
                    ),
                  ),
                if (widget.patentDoc!.isNotEmpty)
                  CustomShowImageFile(
                    isNotEdit: true,
                    listfile: widget.patentDoc,
                  ),
                if (widget.mocCertificate!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 10),
                    child: CustomTextGetfunding(
                      label1: 'Company’s MoC Certificate  ',
                      label2: ' (File Attachment)',
                      isEdit: widget.isEditable!,
                      onTap: () async {
                        var result = await onShowCustomCupertinoModalSheet(
                            icon: const Icon(Icons.clear),
                            isNoIcon: false,
                            title: 'Personal Infomation',
                            context: context,
                            child: PersonalInfoPopup(
                              image: debtCon.mocCertificate,
                              label:
                                  'Company’s MoC Certificate   (File Attachment)',
                            ));
                        if (result != null) {
                          setState(() {
                            debtCon.mocCertificate.value = result;
                          });
                        }
                      },
                    ),
                  ),
                if (widget.mocCertificate!.isNotEmpty)
                  CustomShowImageFile(
                    isNotEdit: true,
                    listfile: widget.mocCertificate,
                  ),
                if (widget.licenceDoc!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 10),
                    child: CustomTextGetfunding(
                      label1: 'Company’s Licence Document  ',
                      label2: ' (File Attachment)',
                      isEdit: widget.isEditable!,
                      onTap: () async {
                        var result = await onShowCustomCupertinoModalSheet(
                            icon: const Icon(Icons.clear),
                            isNoIcon: false,
                            title: 'Personal Infomation',
                            context: context,
                            child: PersonalInfoPopup(
                              image: debtCon.licenceDoc,
                              label:
                                  'Company’s Licence Document   (File Attachment)',
                            ));
                        if (result != null) {
                          setState(() {
                            debtCon.licenceDoc.value = result;
                          });
                        }
                      },
                    ),
                  ),
                if (widget.licenceDoc!.isNotEmpty)
                  CustomShowImageFile(
                    isNotEdit: true,
                    listfile: widget.licenceDoc,
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
