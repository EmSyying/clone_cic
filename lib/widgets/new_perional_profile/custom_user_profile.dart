import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:cicgreenloan/Utils/helper/color.dart';
import 'package:cicgreenloan/generated/l10n.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/customer_controller.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/member_controller.dart';
import 'package:cicgreenloan/widgets/new_perional_profile/custom_option_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../modules/member_directory/models/user.dart';
import '../../modules/member_directory/screens/new_profile_ui/view_image_profile_screen.dart';
import '../../utils/function/get_sharepreference_data.dart';

class CustomUserProfile extends StatefulWidget {
  final String? fullName;
  final String? position;
  final String? description;
  final User? userModel;
  final int? id;

  const CustomUserProfile({
    Key? key,
    this.fullName,
    this.position,
    this.description,
    this.userModel,
    this.id,
  }) : super(key: key);

  @override
  State<CustomUserProfile> createState() => _CustomUserProfileState();
}

class _CustomUserProfileState extends State<CustomUserProfile> {
  final customerCon = Get.put(CustomerController());
  final memberCon = Get.put(MemberController());
  final _pickerImage = ImagePicker();
  File? imageFile;

  Future<void> _onChooseImage() async {
    final pickerFile = await _pickerImage.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      if (pickerFile != null) {
        imageFile = File(pickerFile.path);
      }
    });
    startUpload();
  }

  Future<void> _onOpenCamera() async {
    final pickerFile = await _pickerImage.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickerFile != null) {
        imageFile = File(pickerFile.path);
      }
    });
    startUpload();
  }

  uploadImage(BuildContext context) {
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
                context: context,
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
                context: context,
                builder: (context) {
                  return CupertinoActionSheet(
                    actions: [
                      CupertinoActionSheetAction(
                        onPressed: () {
                          Navigator.pop(context);
                          setState(() {
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
                          });
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
                          await _onOpenCamera()
                              .then((value) => Navigator.pop(context));
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
                        onPressed: () {
                          setState(() {
                            _onChooseImage()
                                .then((value) => Navigator.pop(context));
                          });
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
                          setState(() {
                            Navigator.pop(context);
                          });
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
                });
  }

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

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            stops: [0.4, 0.8],
            begin: Alignment.topCenter,
            end: Alignment.center,
            colors: [AppColor.mainColor, Colors.white24],
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(),
          child: Stack(
            children: [
              Container(
                // color: AppColor.mainColor,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    stops: [0.6, 0.9],
                    begin: Alignment.topCenter,
                    end: Alignment.center,
                    colors: [AppColor.mainColor, Colors.white],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                    child: Container(
                      padding: const EdgeInsets.only(top: 60),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                          ),
                          color: Colors.white.withOpacity(0.5)),
                      child: Column(
                        children: [
                          Text(
                            '${widget.fullName}',
                            style:
                                Theme.of(context).textTheme.headline4!.copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                    ),
                          ),
                          if (widget.position != null && widget.position != '')
                            const SizedBox(
                              height: 10,
                            ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (widget.position != null &&
                                  widget.position != '')
                                SvgPicture.asset(
                                    'assets/images/svgfile/shield_done.svg'),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                '${widget.position}',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(
                                      fontSize: 14,
                                    ),
                              ),
                            ],
                          ),
                          if (widget.position != null && widget.position != '')
                            const SizedBox(
                              height: 10,
                            ),
                          Text(
                            '${widget.description}',
                            style: Theme.of(context)
                                .textTheme
                                .headline3!
                                .copyWith(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              CustomOptionProfile(
                                title: 'Call',
                                imageSvg: 'assets/images/svgfile/Call.svg',
                              ),
                              CustomOptionProfile(
                                title: 'Email',
                                imageSvg: 'assets/images/svgfile/message.svg',
                              ),
                              CustomOptionProfile(
                                title: 'Telegram',
                                imageSvg: 'assets/images/svgfile/send.svg',
                              ),
                              CustomOptionProfile(
                                title: 'Website',
                                imageSvg: 'assets/images/svgfile/website.svg',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 90,
                        height: 90,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                      // memberCon.isLoadingQRCode.value
                      //     ? Shimmer.fromColors(
                      //         highlightColor: Colors.white,
                      //         baseColor: Colors.grey[300]!,
                      //         child: Container(
                      //           height: 90,
                      //           width: 90,
                      //           decoration: BoxDecoration(
                      //             shape: BoxShape.circle,
                      //             color: Colors.grey[100],
                      //           ),
                      //         ),
                      //       )
                      //     :
                      memberCon.personalProfilemember.value.profile != null &&
                              memberCon.personalProfilemember.value.profile !=
                                  ''
                          ? Container(
                              height: 85,
                              width: 85,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: 3.5, color: AppColor.mainColor),
                                image: DecorationImage(
                                    image: NetworkImage(memberCon
                                        .personalProfilemember.value.profile!),
                                    fit: BoxFit.cover),
                              ),
                            )
                          : Container(
                              height: 85,
                              width: 85,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://cicstaging.z1central.com//uploads//files//default//default-user-icon.png'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                    ],
                  )),
              Positioned(
                top: 30,
                right: 0,
                left: 80,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      uploadImage(context);
                    });
                  },
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.white,
                    child: SvgPicture.asset(
                        'assets/images/svgfile/camera_new.svg'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
