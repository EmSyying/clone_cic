import 'dart:io';

import 'package:cicgreenloan/Utils/form_builder/custom_form_card.dart';
import 'package:cicgreenloan/widgets/member_directory/member_displayinfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomReviewCompanyDebt extends StatelessWidget {
  final String? companyName;
  final String? address;
  final String? yearEstablishment;
  final String? typeofOrganization;
  final String? taxIdentification;
  final String? industry;
  final String? numberofStaff, ownername, productSevice;
  final List<File>? patentDoc, mocCertificate, licenceDoc;
  final GestureTapCallback? onTap;

  final bool? isEditable;
  const CustomReviewCompanyDebt(
      {Key? key,
      this.address,
      this.companyName,
      this.industry,
      this.isEditable,
      this.licenceDoc,
      this.mocCertificate,
      this.numberofStaff,
      this.onTap,
      this.ownername,
      this.patentDoc,
      this.productSevice,
      this.taxIdentification,
      this.typeofOrganization,
      this.yearEstablishment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Company Information',
                  style: TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 16,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
                if (isEditable!)
                  GestureDetector(
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
                if (companyName != '')
                  MemberDisplayInfo(
                    changeColorText: true,
                    label: 'Company Name :',
                    isTextAlignRight: true,
                    value: companyName!,
                  ),
                if (address != '')
                  MemberDisplayInfo(
                    changeColorText: true,
                    label: 'Address :',
                    isTextAlignRight: true,
                    value: address!,
                  ),
                if (yearEstablishment != '')
                  MemberDisplayInfo(
                    changeColorText: true,
                    isTextAlignRight: true,
                    isLongLabel: true,
                    label: 'Year of Establishment :',
                    value: yearEstablishment!,
                  ),
                if (typeofOrganization != '')
                  MemberDisplayInfo(
                    isLongLabel: true,
                    changeColorText: true,
                    label: 'Type of Organization :',
                    isTextAlignRight: true,
                    value: typeofOrganization!,
                  ),
                if (taxIdentification != '')
                  MemberDisplayInfo(
                    isLongLabel: true,
                    changeColorText: true,
                    label: 'Tax Identification Number :',
                    isTextAlignRight: true,
                    value: taxIdentification!,
                  ),
                if (industry != '')
                  MemberDisplayInfo(
                      changeColorText: true,
                      label: 'Industry :',
                      isTextAlignRight: true,
                      value: industry!),
                if (numberofStaff != '')
                  MemberDisplayInfo(
                    changeColorText: true,
                    label: 'Number of Staff :',
                    isTextAlignRight: true,
                    value: numberofStaff!,
                  ),
                if (ownername != '')
                  MemberDisplayInfo(
                    changeColorText: true,
                    label: 'Owner Name :',
                    isTextAlignRight: true,
                    value: ownername!,
                  ),
                if (productSevice != '')
                  MemberDisplayInfo(
                    changeColorText: true,
                    label: 'Product Service :',
                    isTextAlignRight: true,
                    value: productSevice!,
                  ),
//File===========================================================================

                // if (patentDoc!.length != 0)
                //   Padding(
                //     padding: const EdgeInsets.only(top: 20, bottom: 10),
                //     child: const CustomTextGetfunding(
                //       label1: 'Company’s Patent Document ',
                //       label2: '(File Attachment)',
                //     ),
                //   ),
                // if (patentDoc!.length != 0)
                //   CustomShowImageFile(
                //     isEdit: true,
                //     listfile: patentDoc,
                //   ),
                // if (mocCertificate!.length != 0)
                //   Padding(
                //     padding: const EdgeInsets.only(top: 20, bottom: 10),
                //     child: const CustomTextGetfunding(
                //       label1: 'Company’s MoC Certificate ',
                //       label2: '(File Attachment)',
                //     ),
                //   ),
                // if (mocCertificate!.length != 0)
                //   CustomShowImageFile(
                //     isEdit: true,
                //     listfile: mocCertificate,
                //   ),
                // if (licenceDoc!.length != 0)
                //   Padding(
                //     padding: const EdgeInsets.only(top: 20, bottom: 10),
                //     child: const CustomTextGetfunding(
                //       label1: 'Company’s Licence Document ',
                //       label2: '(File Attachment)',
                //     ),
                //   ),
                // if (licenceDoc!.length != 0)
                //   CustomShowImageFile(
                //     isEdit: true,
                //     listfile: licenceDoc,
                //   ),
//File========================================================================
                const Text("\n\n"),
                if (productSevice != '')
                  MemberDisplayInfo(
                      changeColorText: true,
                      label: 'Number of Shareholders:',
                      isTextAlignRight: true,
                      value: productSevice!),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
