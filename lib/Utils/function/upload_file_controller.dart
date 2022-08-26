import 'dart:convert';
import 'dart:io';

import 'package:cicgreenloan/generated/l10n.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/customer_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../modules/member_directory/controllers/member_controller.dart';
import '../../modules/member_directory/screens/new_profile_ui/view_image_profile_screen.dart';
import '../../utils/function/get_sharepreference_data.dart';

class UploadFileController extends GetxController {
  final imagePicker = ImagePicker();
  var imageFile = File('').obs;
  final memberCon = Get.put(MemberController());
  final customerCon = Get.put(CustomerController());

  final isLoading = false.obs;

  uploadImage(BuildContext context, {String? url, Map<String, dynamic>? body}) {
    return kIsWeb
        ? showModalBottomSheet(
            context: context,
            builder: (context) {
              return SizedBox(
                height: 170.0,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        Navigator.pop(context);
                        await onOpenCamera(url: url, body: body);
                      },
                      child: Container(
                        color: Colors.white,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100.0, vertical: 15),
                        child: Center(
                          child: Text(S.of(context).takePhoto,
                              style: Theme.of(context).textTheme.headline5),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        Navigator.pop(context);
                        await onChooseImage(url: url, body: body);
                      },
                      child: Container(
                        color: Colors.white,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100.0, vertical: 15),
                        child: Center(
                          child: Text(S.of(context).openGallery,
                              style: Theme.of(context).textTheme.headline5),
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
                          child: Text(S.of(context).cancelButton,
                              style: Theme.of(context).textTheme.headline5),
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
                    height: 170.0,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            Navigator.pop(context);
                            await onOpenCamera(url: url, body: body);
                          },
                          child: Container(
                            color: Colors.white,
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 100.0, vertical: 15),
                            child: Center(
                              child: Text(S.of(context).takePhoto,
                                  style: Theme.of(context).textTheme.headline5),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            Navigator.pop(context);
                            await onChooseImage(url: url, body: body);
                          },
                          child: Container(
                            color: Colors.white,
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 100.0, vertical: 15),
                            child: Center(
                              child: Text(S.of(context).openGallery,
                                  style: Theme.of(context).textTheme.headline5),
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
                              child: Text(S.of(context).cancelButton,
                                  style: Theme.of(context).textTheme.headline5),
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
                          Navigator.pop(context);

                          showMaterialModalBottomSheet(
                              enableDrag: false,
                              backgroundColor: Colors.black,
                              context: context,
                              builder: (context) {
                                return const ViewImageProfle();
                              });
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) {
                          //   return const ViewImageProfle();
                          // }));
                        },
                        child: Text(
                          S.of(context).viewImageProfile,
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(
                                  fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                      ),
                      CupertinoActionSheetAction(
                        onPressed: () async {
                          Navigator.pop(context);
                          await onOpenCamera(url: url, body: body);
                        },
                        child: Text(
                          S.of(context).takePhoto,
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(
                                  fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                      ),
                      CupertinoActionSheetAction(
                        onPressed: () async {
                          Navigator.pop(context);
                          await onChooseImage(url: url, body: body);
                        },
                        child: Text(
                          S.of(context).editImage,
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(
                                  fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                      ),
                      CupertinoActionSheetAction(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          S.of(context).removeImage,
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.red),
                        ),
                      ),
                    ],
                    cancelButton: CupertinoActionSheetAction(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        S.of(context).cancelButton,
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                    ),
                  );
                },
              );
  }

  startUpload({String? baseUrl, Map<String, dynamic>? body}) async {
    isLoading(true);
    var tokenKey = await LocalData.getCurrentUser();
    String url = body != null && baseUrl != null
        ? '${GlobalConfiguration().getValue('api_base_urlv3')}$baseUrl'
        : '${GlobalConfiguration().getValue('main_api_url')}user/change-profile';
    // ignore: unnecessary_null_comparison
    if (imageFile.value == null) {
      return;
    }
    final byte = imageFile.value.readAsBytesSync();
    final salarySlipResult = await FlutterImageCompress.compressWithList(
      byte.buffer.asUint8List(),
      minWidth: 800,
      minHeight: 800,
      quality: 70,
      rotate: 0,
    );

    String base64Image = base64Encode(salarySlipResult);
    try {
      await http
          .post(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $tokenKey',
          'Content-type': 'application/json',
        },
        body: json.encode(
          body ??
              {
                'profile': 'data:image/png;base64,$base64Image',
              },
        ),
      )
          .then((response) {
        customerCon.getUser();
        debugPrint("is uploaded image work");
      });
    } catch (ex) {
      debugPrint("Errorr: $ex");
    } finally {
      isLoading(false);
    }
  }

  Future<void> onChooseImage({String? url, Map<String, dynamic>? body}) async {
    final pickerFile = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickerFile != null) {
      imageFile.value = File(pickerFile.path);
    }
    startUpload(baseUrl: url, body: body);
  }

  Future<void> onOpenCamera({String? url, Map<String, dynamic>? body}) async {
    final pickerFile = await imagePicker.pickImage(source: ImageSource.camera);

    if (pickerFile != null) {
      imageFile.value = File(pickerFile.path);
    }

    startUpload(baseUrl: url, body: body);
  }
}
