import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:cicgreenloan/Utils/helper/app_pin_code.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/customer_controller.dart';
import 'package:cicgreenloan/modules/member_directory/models/user.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../utils/helper/custom_route_snackbar.dart';

class ShowMyQRCode extends StatefulWidget {
  final User? user;
  const ShowMyQRCode({Key? key, this.user}) : super(key: key);

  @override
  State<ShowMyQRCode> createState() => _ShowMyQRCodeState();
}

class _ShowMyQRCodeState extends State<ShowMyQRCode> {
  static GlobalKey captureKey = GlobalKey();
  final cusController = Get.put(CustomerController());

  Future<void> captureAndSharePng(BuildContext context) async {
    Navigator.pop(context);
    try {
      final RenderBox box = context.findRenderObject() as RenderBox;
      RenderRepaintBoundary boundary = captureKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      var image = await boundary.toImage(pixelRatio: 2);
      var byteData = await image.toByteData(format: ImageByteFormat.png);
      var pngBytes = byteData!.buffer.asUint8List();
      final directory = await getTemporaryDirectory();
      final file = File('${directory.path}/screenshot.png');
      await file.writeAsBytes(pngBytes);
      Share.shareXFiles([XFile('${directory.path}/screenshot.png')],
          text: 'Use Scan QR to view other CIC Member\'s Profile.',
          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    } catch (e) {
      debugPrint("$e");
    }
  }

  Future<void> onCaptureAndSave(BuildContext context) async {
    try {
      RenderRepaintBoundary boundary = captureKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      var image = await boundary.toImage(pixelRatio: 5);
      var byteData = await image.toByteData(
        format: ImageByteFormat.png,
      );
      var pngBytes = byteData!.buffer.asUint8List();
      final directory = await getTemporaryDirectory();
      final file = File('${directory.path}/qrCode.png');
      await file.writeAsBytes(pngBytes);
      await [Permission.storage].request();
      final time = DateTime.now()
          .toIso8601String()
          .replaceAll(".", "-")
          .replaceAll(":", "-");
      final name = 'CiC Member\'s QR Code $time';
      final result = await ImageGallerySaver.saveImage(
        pngBytes,
        name: name,
        isReturnImagePathOfIOS: true,
      );
      if (result != null) {
        customRouterSnackbar(
            title: 'Done',
            description: 'Your ticket has been saved to gallery!');
      } else {}
    } catch (e) {
      debugPrint("$e");
    }
  }

  onShowPopupMenu(BuildContext context) {
    return kIsWeb
        ? showModalBottomSheet(
            context: context,
            builder: (context) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        onCaptureAndSave(context);
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: Text(
                          'Download',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 16,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      height: 0,
                    ),
                    GestureDetector(
                      onTap: () {
                        captureAndSharePng(context);
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: Text(
                          'Share',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 16,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      height: 0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: Center(
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: 16,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        : Platform.isAndroid
            ? showModalBottomSheet(
                context: context,
                builder: (context) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            onCaptureAndSave(context);
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.only(top: 20, bottom: 20),
                            child: Text(
                              'Download',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'DMSans',
                                fontSize: 16,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),
                        const Divider(
                          height: 0,
                        ),
                        GestureDetector(
                          onTap: () {
                            captureAndSharePng(context);
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.only(top: 20, bottom: 20),
                            child: Text(
                              'Share',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'DMSans',
                                fontSize: 16,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),
                        const Divider(
                          height: 0,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.only(top: 20, bottom: 20),
                            child: Center(
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                  fontFamily: 'DMSans',
                                  fontSize: 16,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )
            : showCupertinoModalPopup(
                context: context,
                builder: (context) {
                  return CupertinoActionSheet(
                    cancelButton: CupertinoActionSheetAction(
                      child: const Text('Cancel'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    actions: [
                      CupertinoActionSheetAction(
                        child: const Text('Download'),
                        onPressed: () {
                          onCaptureAndSave(context);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                      ),
                      CupertinoActionSheetAction(
                        child: const Text('Share'),
                        onPressed: () {
                          captureAndSharePng(context);
                        },
                      )
                    ],
                  );
                },
              );
  }

  String shortUrl = '';
  bool? isGenerate = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        color: Theme.of(context).cardColor,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.close,
                    ),
                    color: Colors.black,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_vert_outlined),
                    onPressed: () {
                      onShowPopupMenu(context);
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: SizedBox(
                      height: 220,
                      width: 220,
                      child: RepaintBoundary(
                        key: captureKey,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          color: Colors.white,
                          child: isGenerate!
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : PrettyQr(
                                  image: const AssetImage(
                                      'assets/images/Logo/cic_logo_x4jpg.jpg'),
                                  typeNumber: 3,
                                  size: 300,
                                  data: customerController.profileQRLink.value,
                                  roundEdges: true,
                                ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 45, right: 30, left: 30),
                      child: Text(
                        "Use Scan QR to view other CiC Member's profile.",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ),
                  // Container(
                  //   margin: const EdgeInsets.all(20),
                  //   height: 50,
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(10),
                  //       border: Border.all(width: 1, color: Colors.grey[300])),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     children: [
                  //       Icon(Icons.scanner),
                  //       SizedBox(
                  //         width: 20,
                  //       ),
                  //       Text(
                  //         'Scan QR Code',
                  //         style: Theme.of(context).textTheme.bodyText1,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: CustomButton(
                      iconUrl: 'assets/images/svgfile/scanQR.svg',
                      isOutline: true,
                      isDisable: false,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      title: 'Scan QR Code',
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
