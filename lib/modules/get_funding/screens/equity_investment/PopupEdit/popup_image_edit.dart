import 'package:cicgreenloan/Utils/helper/custom_file_picker.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/widgets/get_funding/custom_show_image_file.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import '../../../../../Utils/helper/color.dart';

// ignore: must_be_immutable
class PersonalInfoPopup extends StatefulWidget {
  List? image;
  final String? label;
  final bool? isrequiredimage;
  PersonalInfoPopup(
      {Key? key, this.image, this.label, this.isrequiredimage = false})
      : super(key: key);
  @override
  State<PersonalInfoPopup> createState() => _PersonalInfoPopupState();
}

class _PersonalInfoPopupState extends State<PersonalInfoPopup> {
  List? imagelocal = [];
  Function eq = const ListEquality().equals;
  @override
  void initState() {
    widget.image!.map((e) {
      imagelocal!.add(e);
    }).toList();

    super.initState();
  }

  bool checkImage = false;

  onpress() {
    if (imagelocal!.isEmpty) {
      setState(() {
        checkImage = true;
      });
    } else {
      setState(() {
        checkImage = false;
      });
      Navigator.pop(context, imagelocal);
    }
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
                padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
                child: Text(
                  widget.label!,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomFilePicker(
                fileList: imagelocal,
                validate: checkImage,
                haveFile: imagelocal!.isNotEmpty,
                onTap: (file) {
                  setState(() {
                    imagelocal!.add(file);
                  });
                },
              ),
              if (imagelocal!.isNotEmpty)
                CustomShowImageFile(
                  listfile: imagelocal,
                  onRemove: (file) {
                    setState(() {
                      imagelocal!.remove(file);
                    });
                  },
                  ontap: (file, index) {
                    setState(() {
                      imagelocal![index] = file;
                    });
                  },
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
                  onPressed: eq(imagelocal, widget.image)
                      ? null
                      : widget.isrequiredimage!
                          ? () {
                              onpress();
                            }
                          : () {
                              Navigator.pop(context, imagelocal);
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
