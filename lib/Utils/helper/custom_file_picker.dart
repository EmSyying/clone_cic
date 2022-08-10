import 'dart:io';

import 'package:cicgreenloan/generated/l10n.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class CustomFilePicker extends StatefulWidget {
  final bool? validate;
  final bool? allowMultiple;
  final Function? onTap;
  final bool? haveFile;
  File? imageFile;
  List? fileList;
  final String? title;
  CustomFilePicker(
      {Key? key,
      this.allowMultiple,
      this.onTap,
      this.imageFile,
      this.fileList = const [],
      this.title,
      this.haveFile = false,
      this.validate = false})
      : super(key: key);

  @override
  State<CustomFilePicker> createState() => _CustomFilePickerState();
}

class _CustomFilePickerState extends State<CustomFilePicker> {
  final _pickerImage = ImagePicker();
  bool isImage = false;
  bool isFile = false;
  bool? isSelectPhoto;
  onSelectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple:
          widget.allowMultiple != null ? widget.allowMultiple! : false,
      allowedExtensions: ['jpg', 'pdf', 'doc', 'xls', 'xlsx', 'docx'],
    );

    if (result != null) {
      if (widget.allowMultiple != null && widget.allowMultiple!) {
        List<File> files = result.paths.map((path) => File(path!)).toList();
        widget.onTap!(files);
      } else {
        File file = File(result.files.single.path!);
        widget.onTap!(file);
      }
    }
  }

  uploadImage(BuildContext context) {
    return kIsWeb
        ? showModalBottomSheet(
            context: context,
            builder: (context) {
              return SizedBox(
                height: isFile == true
                    ? 150.0
                    : isImage == true
                        ? 100
                        : 200,
                child: Column(
                  children: [
                    if (isImage == false)
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
                    if (isImage == false)
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
                    if (isFile == false)
                      GestureDetector(
                        onTap: () {
                          onSelectFile();
                          Navigator.pop(context);
                        },
                        child: Container(
                          color: Colors.white,
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 100.0, vertical: 15),
                          child: Center(
                            child: Text(
                              'File',
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
                    height: isFile == true
                        ? 150.0
                        : isImage == true
                            ? 100
                            : 200,
                    child: Column(
                      children: [
                        if (isImage == false)
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
                        if (isImage == false)
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
                        if (isFile == false)
                          GestureDetector(
                            onTap: () {
                              onSelectFile();
                              Navigator.pop(context);
                            },
                            child: Container(
                              color: Colors.white,
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 100.0, vertical: 15),
                              child: Center(
                                child: Text(
                                  'File',
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
                    actions: [
                      if (isImage == false)
                        CupertinoActionSheetAction(
                          onPressed: () {
                            _onOpenCamera();
                            Navigator.pop(context);
                          },
                          child: Text(S.of(context).takePhoto),
                        ),
                      if (isImage == false)
                        CupertinoActionSheetAction(
                          onPressed: () {
                            _onChooseImage();
                            Navigator.pop(context);
                          },
                          child: Text(S.of(context).openGallery),
                        ),
                      if (isFile == false)
                        CupertinoActionSheetAction(
                          onPressed: () {
                            onSelectFile();
                            Navigator.pop(context);
                          },
                          child: const Text('File'),
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

  ontap() {
    if (widget.fileList![0] is String) {
      if (widget.fileList![0].split('.').last == "jpg" ||
          widget.fileList![0].split('.').last == "JPG" ||
          widget.fileList![0].split('.').last == "png" ||
          widget.fileList![0].split('.').last == "PNG" ||
          widget.fileList![0].split('.').last == "jpeg" ||
          widget.fileList![0].split('.').last == "JPEG") {
        isFile = true;
        isImage = false;
      } else {
        isFile = false;
        isImage = true;
      }
    } else if (widget.fileList![0].path.split('.').last == "jpg" ||
        widget.fileList![0].path.split('.').last == "JPG" ||
        widget.fileList![0].path.split('.').last == "png" ||
        widget.fileList![0].path.split('.').last == "PNG" ||
        widget.fileList![0].path.split('.').last == "jpeg" ||
        widget.fileList![0].path.split('.').last == "JPEG") {
      isFile = true;
      isImage = false;
    } else {
      isFile = false;
      isImage = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.fileList!.isNotEmpty
          ? () {
              ontap();
              uploadImage(context);
            }
          : () {
              setState(() {
                isFile = false;
                isImage = false;
              });
              uploadImage(context);
            },
      child: widget.haveFile!
          ? Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset('assets/images/fileImage.svg',
                      color: const Color(0xff0F50A4)),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Choose File',
                    style: TextStyle(color: Color(0xff0F50A4)),
                  ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DottedBorder(
                    borderType: BorderType.RRect,
                    padding: const EdgeInsets.all(1),
                    color: widget.validate!
                        ? Colors.red
                        : Theme.of(context).primaryColor,
                    strokeWidth: 1,
                    strokeCap: StrokeCap.round,
                    radius: const Radius.circular(6),
                    dashPattern: const [5],
                    child: Container(
                      color: const Color.fromRGBO(15, 80, 164, 0.08),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 13),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset('assets/images/fileImage.svg'),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Choose File',
                            style: TextStyle(color: Color(0xff0F50A4)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (widget.validate!)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Icon(
                            Icons.error,
                            color: Colors.red,
                            size: 20,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Please Choose File',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 13,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    )
                ],
              ),
            ),
    );
  }
}
