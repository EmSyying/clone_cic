import 'dart:io';

import 'package:cicgreenloan/Utils/image_view/image_view_file.dart';
import 'package:cicgreenloan/generated/l10n.dart';
import 'package:cicgreenloan/widgets/get_funding/custom_file_card.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class CustomShowImageFile extends StatefulWidget {
  final List? listfile;
  // File? imageFile;
  final bool? allowMultiple;
  final bool? isNotEdit;
  final Function? ontap;
  final Function? onRemove;
  const CustomShowImageFile({
    Key? key,
    this.onRemove,
    this.listfile,
    this.isNotEdit = false,
    this.ontap,
    this.allowMultiple,
    // this.imageFile
  }) : super(key: key);

  @override
  State<CustomShowImageFile> createState() => _CustomShowImageFileState();
}

class _CustomShowImageFileState extends State<CustomShowImageFile> {
  editPhoto(BuildContext context, dynamic file, int index) {
    return kIsWeb
        ? showModalBottomSheet(
            context: context,
            builder: (context) {
              return StatefulBuilder(
                builder: (BuildContext context, setmyState) {
                  return SizedBox(
                    height: 240.0,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _onOpenCamera(index);
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
                            _onChooseImage(index);
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ImageViewerFile(
                                  heroTag: 'invoice',
                                  imageUrl: file is String ? file : null,
                                  imageFile: file is String ? null : file,
                                  isNoIconDownload: true,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            color: Colors.white,
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 100.0, vertical: 15),
                            child: Center(
                              child: Text(
                                S.of(context).viewImage,
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Theme.of(context).primaryColor),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            widget.onRemove!(file);
                            Navigator.pop(context);
                          },
                          child: Container(
                            color: Colors.white,
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 100.0, vertical: 15),
                            child: Center(
                              child: Text(
                                'Remove',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Theme.of(context).primaryColor),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context, true);
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
                },
              );
            })
        : Platform.isAndroid
            ? showModalBottomSheet(
                context: context,
                builder: (context) {
                  return StatefulBuilder(
                    builder: (BuildContext context, setmyState) {
                      return SizedBox(
                        height: 240.0,
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                _onOpenCamera(index);
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
                                _onChooseImage(index);
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ImageViewerFile(
                                      heroTag: 'invoice',
                                      imageUrl: file is String ? file : null,
                                      imageFile: file is String ? null : file,
                                      isNoIconDownload: true,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                color: Colors.white,
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 100.0, vertical: 15),
                                child: Center(
                                  child: Text(
                                    S.of(context).viewImage,
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        color: Theme.of(context).primaryColor),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                widget.onRemove!(file);
                                Navigator.pop(context);
                              },
                              child: Container(
                                color: Colors.white,
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 100.0, vertical: 15),
                                child: Center(
                                  child: Text(
                                    'Remove',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        color: Theme.of(context).primaryColor),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context, true);
                              },
                              child: Container(
                                color: Colors.white,
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 100.0, vertical: 15),
                                child: Center(
                                  child: Text(
                                    S.of(context).cancel,
                                    style:
                                        Theme.of(context).textTheme.headline2,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                })
            : showCupertinoModalPopup(
                context: context,
                builder: (context) {
                  return CupertinoActionSheet(
                    actions: [
                      CupertinoActionSheetAction(
                        onPressed: () {
                          _onOpenCamera(index);
                          Navigator.pop(context);
                        },
                        child: Text(S.of(context).takePhoto),
                      ),
                      CupertinoActionSheetAction(
                        onPressed: () {
                          _onChooseImage(index);
                          Navigator.pop(context);
                        },
                        child: Text(S.of(context).openGallery),
                      ),
                      CupertinoActionSheetAction(
                        onPressed: () {
                          Navigator.pop(context);
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => ImageViewerFile(
                          //       heroTag: 'invoice',
                          //       imageUrl: file is String ? file : null,
                          //       imageFile: file is String ? null : file,
                          //       isNoIconDownload: true,
                          //     ),
                          //   ),
                          // );

                          onPreviewImage(
                            context: context,
                            heroTag: 'invoice',
                            imageUrl: file is String ? file : null,
                            imageFile: file is String ? null : file,
                            isNoIconDownload: true,
                          );
                        },
                        child: Text(S.of(context).viewImage),
                      ),
                      CupertinoActionSheetAction(
                        onPressed: () {
                          // onSelectFile();\
                          widget.onRemove!(file);
                          Navigator.pop(context);
                        },
                        child: const Text('Remove'),
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

  editFile(BuildContext context, var file, int index) {
    return kIsWeb
        ? showModalBottomSheet(
            context: context,
            builder: (context) {
              return SizedBox(
                height: 200.0,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        onSelectFile(index);
                        Navigator.pop(context);
                      },
                      child: Container(
                        color: Colors.white,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100.0, vertical: 15),
                        child: Center(
                          child: Text(
                            'Replace',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        widget.onRemove!(file);

                        setState(() {});

                        Navigator.pop(context);
                      },
                      child: Container(
                        color: Colors.white,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100.0, vertical: 15),
                        child: Center(
                          child: Text(
                            'Remove',
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
                    height: 200.0,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            onSelectFile(index);
                            Navigator.pop(context);
                          },
                          child: Container(
                            color: Colors.white,
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 100.0, vertical: 15),
                            child: Center(
                              child: Text(
                                'Replace',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Theme.of(context).primaryColor),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            widget.onRemove!(file);

                            setState(() {});

                            Navigator.pop(context);
                          },
                          child: Container(
                            color: Colors.white,
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 100.0, vertical: 15),
                            child: Center(
                              child: Text(
                                'Remove',
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
                      CupertinoActionSheetAction(
                        onPressed: () {
                          onSelectFile(index);

                          Navigator.pop(context);
                        },
                        child: const Text('Replace'),
                      ),
                      CupertinoActionSheetAction(
                        onPressed: () {
                          // onSelectFile();\
                          widget.onRemove!(file);
                          Navigator.pop(context);
                        },
                        child: const Text('Remove'),
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

  final _pickerImage = ImagePicker();

  bool? isSelectPhoto;

  Future<void> _onOpenCamera(int intdex) async {
    final pickerFile = await _pickerImage.pickImage(source: ImageSource.camera);
    if (pickerFile != null) {
      widget.ontap!(File(pickerFile.path), intdex);
      isSelectPhoto = true;
    }
  }

  Future<void> _onChooseImage(int intdex) async {
    final pickerFile =
        await _pickerImage.pickImage(source: ImageSource.gallery);

    if (pickerFile != null) {
      widget.ontap!(File(pickerFile.path), intdex);
      isSelectPhoto = true;
    }
  }

  onSelectFile(int index) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple:
          widget.allowMultiple != null ? widget.allowMultiple! : false,
      allowedExtensions: ['jpg', 'pdf', 'doc', 'xls', 'xlsx', 'docx'],
    );

    if (result != null) {
      if (widget.allowMultiple != null && widget.allowMultiple!) {
        List<File> files = result.paths.map((path) => File(path!)).toList();
        widget.ontap!(files, index);
      } else {
        File file = File(result.files.single.path!);
        widget.ontap!(file, index);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.listfile!.isNotEmpty) {
      if (widget.listfile![0] is String) {
        if (widget.listfile![0].split('.').last == "jpg" ||
            widget.listfile![0].split('.').last == "JPG" ||
            widget.listfile![0].split('.').last == "png" ||
            widget.listfile![0].split('.').last == "PNG" ||
            widget.listfile![0].split('.').last == "jpeg" ||
            widget.listfile![0].split('.').last == "JPEG") {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: widget.listfile!
                  .asMap()
                  .entries
                  .map(
                    (e) => GestureDetector(
                      onTap: widget.isNotEdit!
                          ? () {
                              widget.ontap!(e.value);
                            }
                          : () async {
                              var result =
                                  await editPhoto(context, e.value, e.key);
                              if (result != null) {}
                            },
                      child: Container(
                        alignment: Alignment.topCenter,
                        margin: const EdgeInsets.only(left: 20, top: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 6.0,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(10),
                                // color: Colors.red,
                                image: e.value is String
                                    ? DecorationImage(
                                        image: NetworkImage(e.value),
                                        fit: BoxFit.cover,
                                      )
                                    : DecorationImage(
                                        image: FileImage(e.value),
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                            // if (widget.isEdit!)
                            //   GestureDetector(
                            //     child: SvgPicture.asset(
                            //         'assets/images/editIcon.svg'),
                            //   ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          );
        } else {
          return Column(
            children: widget.listfile!.asMap().entries.map(
              (e) {
                return GestureDetector(
                  onTap: widget.isNotEdit!
                      ? () {
                          widget.ontap!(e.value);
                        }
                      : () {
                          setState(() {
                            editFile(context, e.value, e.key);
                          });
                        },
                  child: Container(
                    margin: const EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 10.0),
                    child: CustomFileCard(
                      extensionFile: e.value is File
                          ? e.value.path.split(".").last
                          : e.value.split(".").last,
                      title: e.value is File
                          ? e.value.path.split("/").last
                          : e.value.split("/").last,
                    ),
                  ),
                );
              },
            ).toList(),
          );
        }
      } else {
        if (widget.listfile![0].path.split('.').last == "jpg" ||
            widget.listfile![0].path.split('.').last == "JPG" ||
            widget.listfile![0].path.split('.').last == "png" ||
            widget.listfile![0].path.split('.').last == "PNG" ||
            widget.listfile![0].path.split('.').last == "jpeg" ||
            widget.listfile![0].path.split('.').last == "JPEG") {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: widget.listfile!
                  .asMap()
                  .entries
                  .map((e) => GestureDetector(
                        onTap: widget.isNotEdit!
                            ? () {
                                widget.ontap!(e.value);
                              }
                            : () async {
                                var result =
                                    await editPhoto(context, e.value, e.key);
                                if (result != null) {
                                  setState(() {});
                                }
                              },
                        child: Container(
                          alignment: Alignment.topCenter,
                          margin: const EdgeInsets.only(left: 20, top: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 6.0,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(10),
                                  // color: Colors.red,
                                  image: e.value is String
                                      ? DecorationImage(
                                          image: NetworkImage(e.value),
                                          fit: BoxFit.cover,
                                        )
                                      : DecorationImage(
                                          image: FileImage(e.value),
                                          fit: BoxFit.cover,
                                        ),
                                ),
                              ),
                              // if (widget.isEdit!)
                              //   GestureDetector(
                              //     child: SvgPicture.asset(
                              //         'assets/images/editIcon.svg'),
                              //   ),
                            ],
                          ),
                        ),
                      ))
                  .toList(),
            ),
          );
        } else {
          return Column(
            children: widget.listfile!
                .asMap()
                .entries
                .map(
                  (e) => GestureDetector(
                    onTap: widget.isNotEdit!
                        ? () {
                            widget.ontap!(e.value);
                          }
                        : () {
                            setState(() {
                              editFile(context, e.value, e.key);
                            });
                          },
                    child: Container(
                      margin: const EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 10.0),
                      child: CustomFileCard(
                        extensionFile: e.value.path.split(".").last,
                        title: e.value.path.split("/").last,
                      ),
                    ),
                  ),
                )
                .toList(),
          );
        }
      }
    } else {
      return Container();
    }
  }
}
