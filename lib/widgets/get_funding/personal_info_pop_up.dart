import 'dart:io';
import 'package:cicgreenloan/Utils/helper/custom_file_picker.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/widgets/get_funding/custom_show_image_file.dart';
import 'package:flutter/material.dart';

import '../../Utils/helper/color.dart';

class PersonalInfoPopup extends StatefulWidget {
  final List<File>? imagelocal;
  final String? label;
  const PersonalInfoPopup({Key? key, this.imagelocal, this.label})
      : super(key: key);
  @override
  State<PersonalInfoPopup> createState() => _PersonalInfoPopupState();
}

class _PersonalInfoPopupState extends State<PersonalInfoPopup> {
  final List<File> _imagelocal = [];
  @override
  void initState() {
    setState(() {
      widget.imagelocal!.map((e) {
        _imagelocal.add(e);
      }).toList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                color: Colors.red,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: Text(
                  widget.label!,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomFilePicker(
                haveFile: _imagelocal.isNotEmpty,
                onTap: (file) {
                  setState(() {
                    _imagelocal.add(file);
                  });
                },
              ),
              if (_imagelocal.isNotEmpty)
                CustomShowImageFile(
                  listfile: _imagelocal,
                  ontap: () {},
                ),
            ],
          ),
        )),
        Container(
          color: AppColor.dividerBackground,
          height: 2,
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
                    setState(() {
                      Navigator.pop(context, widget.imagelocal!);
                    });
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
                  onPressed: () {
                    Navigator.pop(context, _imagelocal);
                  },
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
