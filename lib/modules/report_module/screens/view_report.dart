// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:cicgreenloan/Utils/app_settings/controllers/appsetting_controller.dart';
import 'package:cicgreenloan/modules/learning_platform_module/models/certificate_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../Utils/helper/custom_appbar.dart';
import '../../../utils/web_view/web_view.dart';

class ViewReport extends StatefulWidget {
  // final int? id;
  // final String? type;
  // final String? category;
  final String? title;
  // final String? shortDescription;
  // final String? publishedAt;
  // final String? cover;
  final String? attachedFile;
  final String? url;
  final CertificateModel? certificateModel;
  const ViewReport(
      {Key? key,
      this.certificateModel,
      // this.id,
      // this.type,
      // this.category,
      this.title,
      // this.shortDescription,
      // this.publishedAt,
      // this.cover,
      this.attachedFile,
      this.url})
      : super(key: key);

  @override
  State<ViewReport> createState() => _ViewReportState();
}

class _ViewReportState extends State<ViewReport> {
  onShowDialog(BuildContext context) {
    kIsWeb
        ? showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: const Text('PDF loading failed'),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder()),
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
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(),
                        ),
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
  }

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitUp
    ]);
    super.initState();
  }

  final settingCon = Get.put(SettingController());
  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ///auto rotate
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitUp
    ]);

    settingCon.isLandScapView.value =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      appBar: settingCon.isLandScapView.value
          ? null
          : CustomAppBar(
              isLogo: false,
              isLeading: true,
              context: context,
              elevation: 1.0,
              title: widget.title!),
      body: widget.attachedFile != null && widget.attachedFile!.isNotEmpty
          ? Stack(
              children: [
                SfPdfViewer.network(
                  widget.attachedFile!,
                  onDocumentLoadFailed: (e) {
                    onShowDialog(context);
                  },
                ),

                // ElevatedButton(
                //   onPressed: () {
                //     if (MediaQuery.of(context).orientation == Orientation.landscape) {
                //       SystemChrome.setPreferredOrientations([
                //         DeviceOrientation.landscapeLeft,
                //         DeviceOrientation.landscapeRight
                //       ]);
                //     }
                //   },
                //   child: Text('Rotate'),
                // ),
                Obx(
                  () => SafeArea(
                    child: IconButton(
                      onPressed: () {
                        settingCon.isLandScapView.value =
                            !settingCon.isLandScapView.value;
                        if (settingCon.isLandScapView.value) {
                          SystemChrome.setPreferredOrientations([
                            DeviceOrientation.landscapeRight,
                            DeviceOrientation.landscapeLeft,
                            // DeviceOrientation.portraitUp
                          ]);
                        } else {
                          SystemChrome.setPreferredOrientations([
                            DeviceOrientation.portraitUp,
                            // DeviceOrientation.landscapeLeft,
                            // DeviceOrientation.landscapeRight
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
                ),
              ],
            )
          : ViewWebsite(
              isfromReport: true,
              title: widget.title,
              url: widget.url,
            ),
    );
  }
}
