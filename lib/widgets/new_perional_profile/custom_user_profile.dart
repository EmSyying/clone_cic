import 'dart:ui';

import 'package:cicgreenloan/Utils/helper/color.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/customer_controller.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/member_controller.dart';
import 'package:cicgreenloan/widgets/new_perional_profile/custom_option_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../Utils/function/upload_file_controller.dart';
import '../../modules/member_directory/models/user.dart';

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
                              ),
                              CustomOptionProfile(
                                onPress: () {
                                  launchInBrowser(
                                    Uri(
                                        scheme: 'https',
                                        host:
                                            '${memberCon.personalProfile.value.website}',
                                        path:
                                            '${memberCon.personalProfile.value.website}'),
                                  );
                                },
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
                      uploadImageCon.isLoading.value
                          ? Container(
                              width: 88.0,
                              height: 88.0,
                              decoration: const BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: const CircularProgressIndicator(
                                strokeWidth: 4,
                                color: AppColor.mainColor,
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
                      customerCon.customer.value.profile != null &&
                              customerCon.customer.value.profile != ''
                          ? Container(
                              height: 85,
                              width: 85,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: 3.5, color: AppColor.mainColor),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        customerCon.customer.value.profile!),
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
                    uploadImageCon.uploadImage(context);
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
