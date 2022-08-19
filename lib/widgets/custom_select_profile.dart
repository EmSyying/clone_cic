import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../Utils/function/get_sharepreference_data.dart';
import '../generated/l10n.dart';
import 'package:http/http.dart' as http;

import '../modules/member_directory/controllers/customer_controller.dart';
import '../modules/member_directory/controllers/member_controller.dart';
import '../modules/member_directory/screens/new_profile_ui/view_image_profile_screen.dart';

// class CustomSelectProfile extends StatefulWidget {
//   final Widget? text;
//   const CustomSelectProfile({Key? key, this.text}) : super(key: key);

//   @override
//   State<CustomSelectProfile> createState() => _CustomSelectProfileState();
// }

// class _CustomSelectProfileState extends State<CustomSelectProfile> {
//   final customerCon = Get.put(CustomerController());
//   final memberCon = Get.put(MemberController());
//   final _pickerImage = ImagePicker();
//   File? imageFile;

// //     return GestureDetector(
// //       onTap: () {

//         startUpload() async {
//           var tokenKey = await LocalData.getCurrentUser();
//           String url =
//               '${GlobalConfiguration().getValue('main_api_url')}user/change-profile';
//           if (imageFile == null) {
//             return;
//           }
//           final byte = imageFile!.readAsBytesSync();
//           final salarySlipResult = await FlutterImageCompress.compressWithList(
//             byte.buffer.asUint8List(),
//             minWidth: 800,
//             minHeight: 800,
//             quality: 70,
//             rotate: 0,
//           );

//           String base64Image = base64Encode(salarySlipResult);

//           await http
//               .post(Uri.parse(url),
//                   headers: {
//                     'Accept': 'application/json',
//                     'Authorization': 'Bearer $tokenKey',
//                     'Content-type': 'application/json',
//                   },
//                   body: json.encode({
//                     'profile': 'data:image/png;base64,$base64Image',
//                   }))
//               .then((value) {
//             if (value.statusCode == 200) {
//               customerCon.getUser();
//             } else {}
//           }).catchError((onError) {});
//         }

//         Future<void> _onChooseImage() async {
//           final pickerFile = await _pickerImage.pickImage(
//             source: ImageSource.gallery,
//           );

//           setState(() {
//             if (pickerFile != null) {
//               imageFile = File(pickerFile.path);
//             }
//           });
//           startUpload();
//         }

//         Future<void> _onOpenCamera() async {
//           final pickerFile =
//               await _pickerImage.pickImage(source: ImageSource.camera);
//           setState(() {
//             if (pickerFile != null) {
//               imageFile = File(pickerFile.path);
//             }
//           });
//           startUpload();
//         }

//         uploadImage(BuildContext context) {
//           return kIsWeb
//               ? showModalBottomSheet(
//                   context: context,
//                   builder: (context) {
//                     return SizedBox(
//                       height: 170.0,
//                       child: Column(
//                         children: [
//                           GestureDetector(
//                             onTap: () async {
//                               await _onOpenCamera()
//                                   .then((value) => Navigator.pop(context));
//                             },
//                             child: Container(
//                               color: Colors.white,
//                               width: double.infinity,
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 100.0, vertical: 15),
//                               child: Center(
//                                 child: Text(S.of(context).takePhoto,
//                                     style:
//                                         Theme.of(context).textTheme.headline5),
//                               ),
//                             ),
//                           ),
//                           GestureDetector(
//                             onTap: () async {
//                               await _onChooseImage()
//                                   .then((value) => Navigator.pop(context));
//                             },
//                             child: Container(
//                               color: Colors.white,
//                               width: double.infinity,
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 100.0, vertical: 15),
//                               child: Center(
//                                 child: Text(S.of(context).openGallery,
//                                     style:
//                                         Theme.of(context).textTheme.headline5),
//                               ),
//                             ),
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               Navigator.pop(context);
//                             },
//                             child: Container(
//                               color: Colors.white,
//                               width: double.infinity,
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 100.0, vertical: 15),
//                               child: Center(
//                                 child: Text(S.of(context).cancelButton,
//                                     style:
//                                         Theme.of(context).textTheme.headline5),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   })
//               : Platform.isAndroid
//                   ? showModalBottomSheet(
//                       context: context,
//                       builder: (context) {
//                         return SizedBox(
//                           height: 170.0,
//                           child: Column(
//                             children: [
//                               GestureDetector(
//                                 onTap: () async {
//                                   await _onOpenCamera()
//                                       .then((value) => Navigator.pop(context));
//                                 },
//                                 child: Container(
//                                   color: Colors.white,
//                                   width: double.infinity,
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 100.0, vertical: 15),
//                                   child: Center(
//                                     child: Text(S.of(context).takePhoto,
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .headline5),
//                                   ),
//                                 ),
//                               ),
//                               GestureDetector(
//                                 onTap: () async {
//                                   await _onChooseImage()
//                                       .then((value) => Navigator.pop(context));
//                                 },
//                                 child: Container(
//                                   color: Colors.white,
//                                   width: double.infinity,
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 100.0, vertical: 15),
//                                   child: Center(
//                                     child: Text(S.of(context).openGallery,
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .headline5),
//                                   ),
//                                 ),
//                               ),
//                               GestureDetector(
//                                 onTap: () {
//                                   Navigator.pop(context);
//                                 },
//                                 child: Container(
//                                   color: Colors.white,
//                                   width: double.infinity,
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 100.0, vertical: 15),
//                                   child: Center(
//                                     child: Text(S.of(context).cancelButton,
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .headline5),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                       })
//                   : showCupertinoModalPopup(
//                       context: context,
//                       builder: (context) {
//                         return CupertinoActionSheet(
//                           actions: [
//                             CupertinoActionSheetAction(
//                               onPressed: () {
//                                 Navigator.pop(context);
//                                 setState(() {
//                                   showMaterialModalBottomSheet(
//                                       enableDrag: false,
//                                       backgroundColor: Colors.black,
//                                       context: context,
//                                       builder: (context) {
//                                         return const ViewImageProfle();
//                                       });
//                                   // Navigator.push(context,
//                                   //     MaterialPageRoute(builder: (context) {
//                                   //   return const ViewImageProfle();
//                                   // }));
//                                 });
//                               },
//                               child: Text(
//                                 S.of(context).viewImageProfile,
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .headline3!
//                                     .copyWith(
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.w400),
//                               ),
//                             ),
//                             CupertinoActionSheetAction(
//                               onPressed: () async {
//                                 await _onOpenCamera()
//                                     .then((value) => Navigator.pop(context));
//                               },
//                               child: Text(
//                                 S.of(context).takePhoto,
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .headline3!
//                                     .copyWith(
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.w400),
//                               ),
//                             ),
//                             CupertinoActionSheetAction(
//                               onPressed: () {
//                                 setState(() {
//                                   _onChooseImage()
//                                       .then((value) => Navigator.pop(context));
//                                 });
//                               },
//                               child: Text(
//                                 S.of(context).editImage,
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .headline3!
//                                     .copyWith(
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.w400),
//                               ),
//                             ),
//                             CupertinoActionSheetAction(
//                               onPressed: () {
//                                 setState(() {
//                                   Navigator.pop(context);
//                                 });
//                               },
//                               child: Text(
//                                 S.of(context).removeImage,
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .headline3!
//                                     .copyWith(
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.w400,
//                                         color: Colors.red),
//                               ),
//                             ),
//                           ],
//                           cancelButton: CupertinoActionSheetAction(
//                             onPressed: () {
//                               Navigator.pop(context);
//                             },
//                             child: Text(
//                               S.of(context).cancelButton,
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .headline3!
//                                   .copyWith(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.w400),
//                             ),
//                           ),
//                         );
//                       });
//         }

final customerCon = Get.put(CustomerController());
final memberCon = Get.put(MemberController());
ImagePicker? pickerImage;
File? imageFile;

startUpload() async {
  var tokenKey = await LocalData.getCurrentUser();
  String url =
      '${GlobalConfiguration().getValue('main_api_url')}user/change-profile';
  if (imageFile == null) {
    return;
  }
  final byte = imageFile!.readAsBytesSync();
  final salarySlipResult = await FlutterImageCompress.compressWithList(
    byte.buffer.asUint8List(),
    minWidth: 800,
    minHeight: 800,
    quality: 70,
    rotate: 0,
  );

  String base64Image = base64Encode(salarySlipResult);

  await http
      .post(Uri.parse(url),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $tokenKey',
            'Content-type': 'application/json',
          },
          body: json.encode({
            'profile': 'data:image/png;base64,$base64Image',
          }))
      .then((value) {
    if (value.statusCode == 200) {
      customerCon.getUser();
    } else {}
  }).catchError((onError) {});
}

Future<void> _onChooseImage() async {
  final pickerFile = await pickerImage!.pickImage(
    source: ImageSource.gallery,
  );

  if (pickerFile != null) {
    imageFile = File(pickerFile.path);
  }

  startUpload();
}

Future<void> _onOpenCamera() async {
  final pickerFile = await pickerImage!.pickImage(source: ImageSource.camera);

  if (pickerFile != null) {
    imageFile = File(pickerFile.path);
  }

  startUpload();
}

uploadImage(BuildContext? context) {
  return kIsWeb
      ? showModalBottomSheet(
          context: context!,
          builder: (context) {
            return SizedBox(
              height: 170.0,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () async {
                      await _onOpenCamera()
                          .then((value) => Navigator.pop(context));
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
                      await _onChooseImage()
                          .then((value) => Navigator.pop(context));
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
              context: context!,
              builder: (context) {
                return SizedBox(
                  height: 170.0,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await _onOpenCamera()
                              .then((value) => Navigator.pop(context));
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
                          await _onChooseImage()
                              .then((value) => Navigator.pop(context));
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
              context: context!,
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
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                    ),
                    CupertinoActionSheetAction(
                      onPressed: () async {
                        await _onOpenCamera()
                            .then((value) => Navigator.pop(context));
                      },
                      child: Text(
                        S.of(context).takePhoto,
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                    ),
                    CupertinoActionSheetAction(
                      onPressed: () {
                        _onChooseImage()
                            .then((value) => Navigator.pop(context));
                      },
                      child: Text(
                        S.of(context).editImage,
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                    ),
                    CupertinoActionSheetAction(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        S.of(context).removeImage,
                        style: Theme.of(context).textTheme.headline3!.copyWith(
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
                          .headline3!
                          .copyWith(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                  ),
                );
              });
}
