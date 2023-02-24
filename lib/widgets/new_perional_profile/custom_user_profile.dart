import 'dart:ui';

import 'package:cicgreenloan/modules/member_directory/controllers/customer_controller.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/member_controller.dart';
import 'package:cicgreenloan/widgets/new_perional_profile/custom_option_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../Utils/function/upload_file_controller.dart';

class CustomUserProfile extends StatefulWidget {
  final int? id;
  final String? fullName;
  final String? position;
  final String? companyName;
  final String? imgUrl;
  final String? defaultPhoto;
  final bool? isDirectories;

  const CustomUserProfile({
    Key? key,
    this.id,
    this.fullName,
    this.position,
    this.companyName,
    this.imgUrl,
    this.defaultPhoto,
    this.isDirectories = false,
  }) : super(key: key);

  @override
  State<CustomUserProfile> createState() => _CustomUserProfileState();
}

class _CustomUserProfileState extends State<CustomUserProfile> {
  final customerCon = Get.put(CustomerController());
  final memberCon = Get.put(MemberController());
  final uploadImageCon = Get.put(UploadFileController());
  Future<void> launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            stops: const [0.4, 0.8],
            begin: Alignment.topCenter,
            end: Alignment.center,
            colors: [Theme.of(context).primaryColor, Colors.white24],
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(),
          child: Stack(
            children: [
              Container(
                // color: Theme.of(context).primaryColor,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    stops: const [0.6, 0.9],
                    begin: Alignment.topCenter,
                    end: Alignment.center,
                    colors: [Theme.of(context).primaryColor, Colors.white],
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
                            widget.fullName ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
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
                                widget.position ?? '',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
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
                            widget.companyName ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomOptionProfile(
                                onPress: () async {
                                  final Uri launchUri = Uri(
                                    scheme: 'tel',
                                    path:
                                        '${memberCon.personalProfile.value.phone}',
                                  );
                                  await launchUrl(launchUri);
                                },
                                title: 'Call',
                                imageSvg: 'assets/images/svgfile/Call.svg',
                                disableIcon:
                                    memberCon.personalProfile.value.phone,
                              ),
                              CustomOptionProfile(
                                onPress: () async {
                                  final Uri launchEmail = Uri(
                                    scheme: 'mailto',
                                    path:
                                        '${memberCon.personalProfile.value.email}',
                                  );
                                  await launchUrl(launchEmail);
                                },
                                title: 'Email',
                                imageSvg: 'assets/images/svgfile/message.svg',
                                disableIcon:
                                    memberCon.personalProfile.value.email,
                              ),
                              CustomOptionProfile(
                                onPress: () async {
                                  await launchUrl(
                                    Uri.parse(
                                        '${memberCon.personalProfile.value.telegram}'),
                                    mode: LaunchMode.externalApplication,
                                  );
                                },
                                title: 'Telegram',
                                imageSvg: 'assets/images/svgfile/send.svg',
                                disableIcon:
                                    memberCon.personalProfile.value.telegram,
                              ),
                              CustomOptionProfile(
                                onPress: () async {
                                  await launchUrl(
                                    Uri.parse(
                                        '${memberCon.personalProfile.value.website}'),
                                    mode: LaunchMode.externalApplication,
                                  );
                                },
                                title: 'Website',
                                imageSvg: 'assets/images/svgfile/website.svg',
                                disableIcon:
                                    memberCon.personalProfile.value.website,
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
                      uploadImageCon.isLoading.value
                          ? Container(
                              width: 88.0,
                              height: 88.0,
                              decoration: const BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: CircularProgressIndicator(
                                strokeWidth: 4,
                                color: Theme.of(context).primaryColor,
                              ),
                            )
                          : Container(
                              width: 90,
                              height: 90,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                      Container(
                        height: 85,
                        width: 85,
                        decoration: widget.imgUrl == null
                            ? BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                shape: BoxShape.circle)
                            : BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: 3.5,
                                    color: Theme.of(context).primaryColor),
                                image: DecorationImage(
                                    image: NetworkImage(widget.imgUrl ?? ''),
                                    fit: BoxFit.cover),
                              ),
                        child: widget.defaultPhoto != null
                            ? Center(
                                child: Text(
                                  widget.defaultPhoto!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(fontSize: 30),
                                ),
                              )
                            : null,
                      )
                    ],
                  )),
              if (widget.isDirectories != true)
                Positioned(
                  top: 30,
                  right: 0,
                  left: 80,
                  child: GestureDetector(
                    onTap: () {
                      uploadImageCon.uploadImage(context, onRemove: () {
                        memberCon.onDeleteImageProfile(
                          context,
                          widget.id,
                          'member',
                        );
                      });
                    },
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.white,
                      child: SvgPicture.asset(
                        'assets/images/svgfile/camera_new.svg',
                      ),
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
