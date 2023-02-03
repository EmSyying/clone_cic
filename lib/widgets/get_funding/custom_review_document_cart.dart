import 'dart:io';

import 'package:cicgreenloan/widgets/get_funding/custom_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Utils/form_builder/custom_form_card.dart';

// ignore: must_be_immutable
class CustomReviewDocument extends StatelessWidget {
  File? nationalFront, nationalBack, residentbook, businessLegal;

  final GestureTapCallback? onTap;

  final bool? isEditable;
  CustomReviewDocument(
      {Key? key,
      this.isEditable,
      this.businessLegal,
      this.nationalBack,
      this.nationalFront,
      this.onTap,
      this.residentbook})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Document Verification',
                style: TextStyle(
                    fontFamily: 'DMSans',
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
              if (isEditable!)
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    color: Colors.transparent,
                    padding: const EdgeInsets.all(6.0),
                    width: 30,
                    height: 32,
                    child: SvgPicture.asset('assets/images/editIcon.svg'),
                  ),
                ),
            ],
          ),
        ),
        CustomFormCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'National ID Card ( Front & Back )',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    SvgPicture.asset('assets/images/editIcon.svg'),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    CustomImagePicker(
                      imageFile: nationalFront,
                      onTap: (imageFile) {
                        nationalFront = imageFile;
                      },
                      title: 'Front',
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    CustomImagePicker(
                      imageFile: nationalBack,
                      onTap: (imageFile) {
                        nationalBack = imageFile;
                      },
                      title: 'Back',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Resident Book (Min  2MB)',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    Container(
                      color: Colors.transparent,
                      padding: const EdgeInsets.all(6.0),
                      width: 30,
                      height: 32,
                      child: SvgPicture.asset(
                          'assets/images/svgfile/editedIcon.svg'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomImagePicker(
                  imageFile: residentbook,
                  onTap: (imageFile) {
                    residentbook = imageFile;
                  },
                  title: 'Front',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Business Legal',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    Container(
                      color: Colors.transparent,
                      padding: const EdgeInsets.all(6.0),
                      width: 30,
                      height: 32,
                      child: SvgPicture.asset(
                          'assets/images/svgfile/editedIcon.svg'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomImagePicker(
                  imageFile: businessLegal,
                  onTap: (imageFile) {
                    businessLegal = imageFile;
                  },
                  title: 'Business Legal',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
