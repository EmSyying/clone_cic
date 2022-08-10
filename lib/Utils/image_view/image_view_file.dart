import 'dart:io';

import 'package:cicgreenloan/Utils/function/down_load_image.dart';
import 'package:cicgreenloan/Utils/helper/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:photo_view/photo_view.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../app_settings/controllers/appsetting_controller.dart';

class ImageViewerFile extends StatelessWidget {
  final String? heroTag;
  final File? imageFile;
  final String? imageUrl;
  final bool? isNoIconDownload;
  ImageViewerFile(
      {Key? key,
      this.imageFile,
      this.heroTag,
      this.imageUrl,
      this.isNoIconDownload = false})
      : super(key: key);
  onShowDialog(BuildContext context) {
    kIsWeb
        ? showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: const Text('PDF loading failed'),
                actions: [
                  // ignore: deprecated_member_use
                  RaisedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    shape: const RoundedRectangleBorder(),
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          )
        : Platform.isIOS
            ? showCupertinoDialog(
                context: context,
                builder: (context) {
                  return Center(
                    child: CupertinoAlertDialog(
                      title: const Text(
                        'PDF file loading failed',
                      ),
                      content: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Please check pdf format and try again!'),
                      ),
                      actions: [
                        CupertinoButton(
                          child: const Text('OK'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )
                      ],
                    ),
                  );
                })
            : showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: const Text('PDF loading failed'),
                    actions: [
                      // ignore: deprecated_member_use
                      RaisedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        shape: const RoundedRectangleBorder(),
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
  }

  final settingCon = Get.put(SettingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      body: imageUrl?.split('.').last == "pdf"
          ? Scaffold(
              appBar: settingCon.isLandScapView.value
                  ? null
                  : CustomAppBar(
                      isLeading: true,
                      context: context,
                      elevation: 1.0,
                      title: 'PDF'),
              body: Stack(
                children: [
                  SfPdfViewer.network(
                    imageUrl!,
                    onDocumentLoadFailed: (e) {
                      onShowDialog(context);
                    },
                  ),
                  Obx(
                    () => IconButton(
                      onPressed: () {
                        settingCon.isLandScapView.value =
                            !settingCon.isLandScapView.value;
                        if (settingCon.isLandScapView.value) {
                          SystemChrome.setPreferredOrientations([
                            DeviceOrientation.landscapeLeft,
                            DeviceOrientation.landscapeRight
                          ]);
                        } else {
                          SystemChrome.setPreferredOrientations([
                            DeviceOrientation.portraitDown,
                            DeviceOrientation.portraitUp
                          ]);
                        }
                      },
                      icon: settingCon.isLandScapView.value
                          ? Icon(Icons.fullscreen_exit,
                              color: Theme.of(context).primaryColor)
                          : Icon(Icons.fullscreen,
                              color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
            )
          : imageFile?.path.split('.').last == "pdf"
              ? Scaffold(
                  appBar: settingCon.isLandScapView.value
                      ? null
                      : CustomAppBar(
                          isLeading: true,
                          context: context,
                          elevation: 1.0,
                          title: 'PDF'),
                  body: Stack(
                    children: [
                      SfPdfViewer.file(
                        imageFile!,
                        onDocumentLoadFailed: (e) {
                          onShowDialog(context);
                        },
                      ),
                      Obx(
                        () => IconButton(
                          onPressed: () {
                            settingCon.isLandScapView.value =
                                !settingCon.isLandScapView.value;
                            if (settingCon.isLandScapView.value) {
                              SystemChrome.setPreferredOrientations([
                                DeviceOrientation.landscapeLeft,
                                DeviceOrientation.landscapeRight
                              ]);
                            } else {
                              SystemChrome.setPreferredOrientations([
                                DeviceOrientation.portraitDown,
                                DeviceOrientation.portraitUp
                              ]);
                            }
                          },
                          icon: settingCon.isLandScapView.value
                              ? Icon(Icons.fullscreen_exit,
                                  color: Theme.of(context).primaryColor)
                              : Icon(Icons.fullscreen,
                                  color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ],
                  ),
                )
              : Stack(
                  children: [
                    GestureDetector(
                      child: Hero(
                        tag: heroTag!,
                        child: imageFile != null
                            ? PhotoView(
                                minScale:
                                    PhotoViewComputedScale.contained * 0.8,
                                maxScale: PhotoViewComputedScale.covered * 1.8,
                                imageProvider: FileImage(imageFile!),
                              )
                            : PhotoView(
                                minScale:
                                    PhotoViewComputedScale.contained * 0.8,
                                maxScale: PhotoViewComputedScale.covered * 1.8,
                                imageProvider: NetworkImage(imageUrl!),
                              ),
                      ),
                    ),
                    Positioned(
                      top: 50.0,
                      left: 10.0,
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.cancel,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                    isNoIconDownload!
                        ? Container()
                        : Positioned(
                            top: 50,
                            right: 10,
                            child: IconButton(
                              icon: const Icon(
                                Icons.download_sharp,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                onDownload(imageUrl!);
                              },
                            ),
                          )
                  ],
                ),
    );
  }
}

onPreviewImage({
  BuildContext? context,
  String? heroTag,
  File? imageFile,
  String? imageUrl,
  bool? isNoIconDownload,
}) {
  showMaterialModalBottomSheet(
    context: context!,
    builder: (context) => ImageViewerFile(
      heroTag: heroTag,
      imageFile: imageFile,
      imageUrl: imageUrl,
      isNoIconDownload: isNoIconDownload,
    ),
  );
}
