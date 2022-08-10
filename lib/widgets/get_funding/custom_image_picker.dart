import 'dart:io';

import 'package:cicgreenloan/generated/l10n.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class CustomImagePicker extends StatefulWidget {
  File? imageFile;
  final Function? onTap;
  final String? title;
  CustomImagePicker({Key? key, this.onTap, this.title, this.imageFile})
      : super(key: key);
  @override
  State<CustomImagePicker> createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  final _pickerImage = ImagePicker();

  bool? isSelectPhoto;
  Future<void> _onOpenCamera() async {
    final pickerFile = await _pickerImage.pickImage(source: ImageSource.camera);
    if (pickerFile != null) {
      setState(() {
        widget.imageFile = File(pickerFile.path);
        widget.onTap!(widget.imageFile);
        isSelectPhoto = true;
      });
    }
  }

  Future<void> _onChooseImage() async {
    final pickerFile =
        await _pickerImage.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickerFile != null) {
        widget.imageFile = File(pickerFile.path);
        widget.onTap!(widget.imageFile);
        isSelectPhoto = true;
      }
    });
  }

  uploadImage(BuildContext context) {
    return kIsWeb
        ? showModalBottomSheet(
            context: context,
            builder: (context) {
              return SizedBox(
                height: 160.0,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _onOpenCamera();
                        Navigator.pop(context);
                      },
                      child: Container(
                        color: Colors.white,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100.0, vertical: 15),
                        child: Center(
                          child: Text(
                            S.of(context).takePhoto,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _onChooseImage();
                        Navigator.pop(context);
                      },
                      child: Container(
                        color: Colors.white,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100.0, vertical: 15),
                        child: Center(
                          child: Text(
                            S.of(context).openGallery,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        color: Colors.white,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100.0, vertical: 15),
                        child: Center(
                          child: Text(
                            S.of(context).cancel,
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            })
        : Platform.isAndroid
            ? showModalBottomSheet(
                context: context,
                builder: (context) {
                  return SizedBox(
                    height: 160.0,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _onOpenCamera();
                            Navigator.pop(context);
                          },
                          child: Container(
                            color: Colors.white,
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 100.0, vertical: 15),
                            child: Center(
                              child: Text(
                                S.of(context).takePhoto,
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Theme.of(context).primaryColor),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _onChooseImage();
                            Navigator.pop(context);
                          },
                          child: Container(
                            color: Colors.white,
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 100.0, vertical: 15),
                            child: Center(
                              child: Text(
                                S.of(context).openGallery,
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Theme.of(context).primaryColor),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            color: Colors.white,
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 100.0, vertical: 15),
                            child: Center(
                              child: Text(
                                S.of(context).cancel,
                                style: Theme.of(context).textTheme.headline2,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                })
            : showCupertinoModalPopup(
                context: context,
                builder: (context) {
                  return CupertinoActionSheet(
                    title: const Text('Profile Photo'),
                    actions: [
                      CupertinoActionSheetAction(
                        onPressed: () {
                          _onOpenCamera();
                          Navigator.pop(context);
                        },
                        child: Text(S.of(context).takePhoto),
                      ),
                      CupertinoActionSheetAction(
                        onPressed: () {
                          _onChooseImage();
                          Navigator.pop(context);
                        },
                        child: Text(S.of(context).openGallery),
                      ),
                    ],
                    cancelButton: CupertinoActionSheetAction(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(S.of(context).cancel),
                    ),
                  );
                });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        uploadImage(context);
      },
      child: Column(
        children: [
          DottedBorder(
            borderType: BorderType.RRect,
            padding: const EdgeInsets.all(1),
            color: Theme.of(context).primaryColor,
            strokeWidth: 1,
            strokeCap: StrokeCap.round,
            radius: const Radius.circular(10),
            dashPattern: const [5],
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).primaryColor.withAlpha(20),
                  image: widget.imageFile != null
                      ? DecorationImage(
                          image: FileImage(
                            widget.imageFile!,
                          ),
                          fit: BoxFit.cover)
                      : null),
              height: 100,
              width: 100,
              child: widget.imageFile == null
                  ? Center(
                      child: SvgPicture.asset(
                          'assets/images/svgfile/cameraIcon.svg'),
                    )
                  : null,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.title!,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
