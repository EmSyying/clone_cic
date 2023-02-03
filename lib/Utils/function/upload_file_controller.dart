import 'dart:convert';
import 'dart:io';

import 'package:cicgreenloan/generated/l10n.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/customer_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../core/flavor/flavor_configuration.dart';
import '../../modules/member_directory/controllers/member_controller.dart';
import '../../modules/member_directory/screens/new_profile_ui/view_image_profile_screen.dart';
import '../../utils/function/get_sharepreference_data.dart';

class UploadFileController extends GetxController {
  final imagePicker = ImagePicker();
  final imageFile = File('').obs;
  final imagePathFile = "".obs;
  final memberCon = Get.put(MemberController());
  final customerCon = Get.put(CustomerController());

  final isLoading = false.obs;

  uploadImage(BuildContext context,
      {String? url,
      Map<String, dynamic>? body,
      bool isCompany = false,
      Function? onRemove}) {
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
                        showMaterialModalBottomSheet(
                            enableDrag: false,
                            backgroundColor: Colors.black,
                            context: context,
                            builder: (context) {
                              return const ViewImageProfle();
                            });
                      },
                      child: Container(
                        color: Colors.white,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100.0, vertical: 15),
                        child: Center(
                          child: Text(
                            S.of(context).viewImageProfile,
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        Navigator.pop(context);
                        await onOpenCamera(
                            url: url, body: body, isCompany: isCompany);
                        update();
                      },
                      child: Container(
                        color: Colors.white,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100.0, vertical: 15),
                        child: Center(
                          child: Text(
                            S.of(context).takePhoto,
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        Navigator.pop(context);
                        await onChooseImage(
                            url: url, body: body, isCompany: isCompany);
                        update();
                      },
                      child: Container(
                        color: Colors.white,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100.0, vertical: 15),
                        child: Center(
                          child: Text(
                            S.of(context).openGallery,
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        Navigator.pop(context);
                        onRemove!();
                      },
                      child: Container(
                        color: Colors.white,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100.0, vertical: 15),
                        child: Center(
                          child: Text(
                            S.of(context).removeImage,
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.red,
                                ),
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
                            S.of(context).cancelButton,
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            })
        : Platform.isAndroid
            ? showMaterialModalBottomSheet(
                backgroundColor: Colors.white,
                context: context,
                useRootNavigator: true,
                builder: (context) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.38,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            Navigator.pop(context);
                            showMaterialModalBottomSheet(
                                enableDrag: false,
                                backgroundColor: Colors.black,
                                context: context,
                                builder: (context) {
                                  return const ViewImageProfle();
                                });
                          },
                          child: Container(
                            color: Colors.white,
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 100.0, vertical: 15),
                            child: Center(
                              child: Text(
                                S.of(context).viewImageProfile,
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            Navigator.pop(context);
                            await onOpenCamera(
                                url: url, body: body, isCompany: isCompany);
                            update();
                          },
                          child: Container(
                            color: Colors.white,
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 100.0, vertical: 15),
                            child: Center(
                              child: Text(
                                S.of(context).takePhoto,
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            Navigator.pop(context);
                            await onChooseImage(
                                url: url, body: body, isCompany: isCompany);
                            update();
                          },
                          child: Container(
                            color: Colors.white,
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 100.0, vertical: 15),
                            child: Center(
                              child: Text(
                                S.of(context).openGallery,
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            Navigator.pop(context);
                            onRemove!();
                          },
                          child: Container(
                            color: Colors.white,
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 100.0, vertical: 15),
                            child: Center(
                              child: Text(
                                S.of(context).removeImage,
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.red,
                                    ),
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
                                S.of(context).cancelButton,
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
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
                              .displaySmall!
                              .copyWith(
                                  fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                      ),
                      CupertinoActionSheetAction(
                        onPressed: () async {
                          Navigator.pop(context);
                          await onOpenCamera(
                              url: url, body: body, isCompany: isCompany);
                          update();
                        },
                        child: Text(
                          S.of(context).takePhoto,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                  fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                      ),
                      CupertinoActionSheetAction(
                        onPressed: () async {
                          Navigator.pop(context);
                          await onChooseImage(
                              url: url, body: body, isCompany: isCompany);
                          update();
                        },
                        child: Text(
                          S.of(context).openGallery,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                  fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                      ),
                      CupertinoActionSheetAction(
                        onPressed: () {
                          Navigator.pop(context);
                          onRemove!();
                        },
                        child: Text(
                          S.of(context).removeImage,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
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
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(
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
        ? '${FlavorConfig.instance.values!.apiBaseUrl}$baseUrl'
        : '${FlavorConfig.instance.values!.apiBaseUrl}user/change-profile';
    // ignore: unnecessary_null_comparison
    if (imageFile == null) {
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
      debugPrint("File Path Before: ${imageFile.value.path}");
      imageFile.value = File('');
      debugPrint("File Path Before: ${imageFile.value.path}");
      isLoading(false);
    }
  }

  Future<void> onChooseImage(
      {String? url, Map<String, dynamic>? body, bool isCompany = false}) async {
    final pickerFile = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    File? file;

    if (pickerFile != null) {
      if (isCompany == true) {
        memberCon.comCompanyLogo = File(pickerFile.path);
      }
      file = File(pickerFile.path);
      imageFile.value = file;
      imagePathFile.value = imageFile.toString();

      update();
    }
    debugPrint(imageFile.value.toString());
    if (file != null) {
      if (isCompany != true) {
        startUpload(baseUrl: url, body: body);
      }
    }
  }

  Future<void> onOpenCamera(
      {String? url, Map<String, dynamic>? body, bool isCompany = false}) async {
    File? file;
    final pickerFile = await imagePicker.pickImage(source: ImageSource.camera);

    if (pickerFile != null) {
      if (isCompany == true) {
        memberCon.comCompanyLogo = File(pickerFile.path);
      }

      file = File(pickerFile.path);
      imageFile.value = file;
      imagePathFile.value = imageFile.toString();
      update();
    }

    if (file != null) {
      if (isCompany != true) {
        startUpload(baseUrl: url, body: body);
      }
    }
  }
}
