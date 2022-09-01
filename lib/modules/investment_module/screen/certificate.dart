import 'dart:io';
import 'dart:ui';
import 'package:cicgreenloan/modules/bonus/controllers/bonus_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../Utils/helper/custom_appbar_colorswhite.dart';
import '../../../utils/helper/container_partern.dart';
import '../../../utils/helper/custom_snackbar.dart';

class PDFViewer extends StatefulWidget {
  final String? urlAttachment;
  final String? title;
  const PDFViewer({Key? key, this.urlAttachment, this.title}) : super(key: key);

  @override
  State<PDFViewer> createState() => _PDFViewerState();
}

class _PDFViewerState extends State<PDFViewer> {
  Dio dio = Dio();
  bool isloadingfile = false;
  bool isDownloading = false;
  Directory? directory;
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  static GlobalKey printScreenKey = GlobalKey();
  final bonusCon = Get.put(BonusController());

  @override
  void reassemble() {
    super.reassemble();
    if (!kIsWeb) {
      if (Platform.isAndroid) {
        // controller!.pauseCamera();
      }
    }

    // controller!.resumeCamera();
  }

  Future<void> onCaptureAndSave(BuildContext context) async {
    setState(() {
      isDownloading = true;
    });
    try {
      RenderRepaintBoundary boundary = printScreenKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      var image = await boundary.toImage(pixelRatio: 5);
      var byteData = await image.toByteData(
        format: ImageByteFormat.png,
      );
      var pngBytes = byteData!.buffer.asUint8List();
      final directory = await getTemporaryDirectory();
      final file = File('${directory.path}/screenshot.png');
      await file.writeAsBytes(pngBytes);
      await [Permission.storage].request();
      final time = DateTime.now()
          .toIso8601String()
          .replaceAll(".", "-")
          .replaceAll(":", "-");
      final name = 'Ticket $time';
      final result = await ImageGallerySaver.saveImage(
        pngBytes,
        name: name,
        isReturnImagePathOfIOS: true,
      );
      if (result != null) {
        customSnackbar(
            imgUrl: 'assets/images/svgfile/successIcon.svg',
            color: Colors.green,
            titleText: 'Done',
            messageText: 'Your certificate has been saved to gallery!');
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      setState(() {
        isDownloading = false;
      });
    }
  }

  // function download pdf file
  Future<bool> savePdf(String url, String fileName) async {
    try {
      setState(() {
        isloadingfile = true;
      });
      if (!kIsWeb) {
        if (Platform.isAndroid) {
          if (await _requestPermission(Permission.storage)) {
            directory = await getExternalStorageDirectory();
            String newPath = "";

            List<String> paths = directory!.path.split("/");
            for (int x = 1; x < paths.length; x++) {
              String folder = paths[x];
              if (folder != "Android") {
                newPath += "/$folder";
              } else {
                break;
              }
            }
            newPath = "$newPath/Download";
            directory = Directory(newPath);
          } else {
            return false;
          }
        }
      } else {
        if (await _requestPermission(Permission.storage)) {
          directory = await getTemporaryDirectory();
        } else {
          return false;
        }
      }

      if (!await directory!.exists()) {
        await directory!.create(recursive: true);
      }
      if (await directory!.exists()) {
        File saveFile = File("${directory!.path}/$fileName");
        await dio.download(
          url, saveFile.path,
          onReceiveProgress: (value1, value2) {
            // setState(() {
            //   progress = value1 / value2;

            //   final percent = ((value1 / value2) * 100).toStringAsFixed(0);
            //   // print('Progress: $percent');
            // });
          },
          // onReceiveProgress: showDownloadProgress,
          options: Options(
            contentType: 'Content-Type',
          ),
        );
        // if (Platform.isIOS) {
        //   // await ImageGallerySaver.saveFile(saveFile.path,
        //   //     isReturnPathOfIOS: true);
        // }
        return true;
      }
    } catch (e) {
      debugPrint("$e");
    } finally {
      setState(() {
        isloadingfile = false;
      });
      OpenFile.open("${directory!.path}/$fileName");
    }
    return false;
  }

  Future<bool> _requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      }
    }
    return false;
  }

  // end of function download pdf file
  @override
  Widget build(BuildContext context) {
    return isDownloading == true
        ? Scaffold(
            body: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black.withOpacity(0.7),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        backgroundColor: Colors.white38,
                        strokeWidth: 4,
                      ),
                    ),
                    SizedBox(height: padding),
                    Text(
                      'Downloading...',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          )
        : Scaffold(
            appBar: CustomAppBarWhiteColor(
              context: context,
              title: "",
              action: [
                isloadingfile == true
                    ? IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.download,
                          color: Theme.of(context).primaryColor,
                        ))
                    : widget.urlAttachment != null
                        ? IconButton(
                            onPressed: () {
                              onCaptureAndSave(context);
                            },
                            icon: Icon(
                              Icons.download,
                              color: Theme.of(context).primaryColor,
                            ),
                          )
                        : Container()
              ],
            ),
            body: Stack(
              children: [
                Container(
                  key: _pdfViewerKey,
                  child: RepaintBoundary(
                    key: printScreenKey,
                    child: widget.urlAttachment != null
                        ? SfPdfViewer.network(
                            "${widget.urlAttachment}",
                            canShowScrollHead: false,
                            canShowScrollStatus: false,
                          )
                        : const Center(
                            child: Text("No Certificate"),
                          ),
                  ),
                ),
                Positioned(
                  child: isloadingfile == true
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Container(),
                )
              ],
            ),
          );
  }
}
