import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../controller/invite_user_controller.dart';

class InviteUserReferral extends StatelessWidget {
  const InviteUserReferral({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GetBuilder(
      init: InviteUserReferrerController(),
      builder: (controller) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
        body: LayoutBuilder(
          builder: (context, constaint) => Stack(
            children: [
              Column(children: [
                Expanded(
                    child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xff384593),
                        Color(0xff3588E8),
                      ],
                    ),
                  ),
                ))
              ]),
              SafeArea(
                // bottom: false,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: constaint.maxHeight > 600
                              ? (20 / Get.height) * Get.height
                              : (15 / Get.height) * Get.height),
                      child: Align(
                          alignment: Alignment.topCenter,
                          child: SvgPicture.asset(
                            "assets/images/invite/refer_friend.svg",
                            width: constaint.maxHeight > 600
                                ? null
                                : (140 / Get.height) * Get.height,
                            height: constaint.maxHeight > 600
                                ? null
                                : (140 / Get.height) * Get.height,
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: constaint.maxHeight > 600 ? 20 : 10),
                      child: Text(
                        "Share your referral code",
                        textAlign: TextAlign.center,
                        style: textTheme.bodyMedium!.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: SizedBox(
                        width: (329 / Get.width) * Get.width,
                        child: Text(
                          "Lorem ipsum dolor sit amet consectetur. Mi ut nulla amet vitae eget duis ac egestas. Adipiscing volutpat imperdiet ullamcorper.",
                          textAlign: TextAlign.center,
                          style: textTheme.bodyMedium!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.only(
                    //       left: 20, right: 20, top: (58 / Get.height) * Get.height),
                    //   child: Container(
                    //     height: 54,
                    //     width: double.maxFinite,
                    //     decoration: BoxDecoration(
                    //         color: Colors.white.withOpacity(.12),
                    //         border: Border.all(
                    //           color: Colors.white,
                    //         ),
                    //         borderRadius: BorderRadius.circular(30)),
                    //   ),
                    // ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 20,
                          right: 20,
                          top: constaint.maxHeight > 600
                              ? (58 / Get.height) * Get.height
                              : 20),
                      child: buildCard(context, controller.referrerCode,
                          controller.isLoading),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 20,
                          right: 20,
                          top: constaint.maxHeight > 600 ? 20 : 10),
                      child: buildCard(context, controller.dynamicLink,
                          controller.isLoading),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: constaint.maxHeight > 600 ? 50 : 30,
                          right: 20,
                          left: 20),
                      child: Container(
                        height: 1,
                        color: Colors.white.withOpacity(.20),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding:
                          EdgeInsets.only(bottom: Platform.isAndroid ? 15 : 0),
                      child: GestureDetector(
                        onTap: () {
                          try {
                            if (controller.onShare && !controller.isLoading) {
                              controller.onShare = false;
                              Share.shareWithResult(
                                'Lorem ipsum dolor sit ametcon sectetur. Sociis dui molestie ipsum consequat.'
                                '\n 1. Download the app | https://cicapp.page.link/HnCL \n 2. Registration \n 3. Done',
                              ).then((value) {
                                debugPrint("Hello");
                                controller.onShare = true;
                              });
                            }
                          } catch (e) {
                            debugPrint("$e");
                          }
                        },
                        // focusColor: Colors.white,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 3, horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white.withOpacity(.12),
                                ),
                                height: 40,
                                width: 40,
                                alignment: Alignment.center,
                                child: SvgPicture.asset(
                                  'assets/images/share.svg',
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Share",
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: textTheme.bodyMedium!.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  SizedBox buildCard(
    BuildContext context,
    String? text,
    bool loading,
  ) {
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      height: 54,
      width: double.maxFinite,
      child: Stack(
        children: [
          Container(
            height: 54,
            width: double.maxFinite,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(.12),
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(30)),
            child: loading
                ? const SpinKitThreeBounce(
                    size: 20,
                    color: Colors.white,
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Center(
                      child: Text(
                        text.toString(),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.bodyMedium!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 6),
            child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Clipboard.setData(
                      ClipboardData(text: text ?? ""),
                    ).then(
                      (value) {
                        return ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(
                          content: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/wallet/copy_fill.svg',
                                color: Colors.white,
                              ),
                              const SizedBox(width: 15),
                              const Text("Copied to clipboard."),
                            ],
                          ),
                          behavior: SnackBarBehavior.floating,
                        ));
                      },
                    );
                  },
                  child:
                      SvgPicture.asset("assets/images/invite/circle_copy.svg"),
                )),
          ),
        ],
      ),
    );
  }
}
