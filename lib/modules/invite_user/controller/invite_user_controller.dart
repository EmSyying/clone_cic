import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Utils/helper/api_base_helper.dart';
import '../../../configs/firebase_deeplink/deeplink_service.dart';

class InviteUserReferrerController extends GetxController {
  final ApiBaseHelper _apiBaseHelper = ApiBaseHelper();
  String dynamicLink = "";
  String referrerCode = "";
  bool onShare = true;
  bool isLoading = false;
  @override
  void onInit() {
    onGenerateInvitation();
    super.onInit();
  }

  void onGenerateInvitation() {
    isLoading = true;
    update();
    _apiBaseHelper
        .onNetworkRequesting(
            url: "invitation/generate", methode: METHODE.get, isAuthorize: true)
        .then((value) async {
      referrerCode = value["code"];
      DynamicLinkService.createDynamicLink(
        path: "register?referral-code=$referrerCode",
        isShort: true,
      ).then((value) async{
      dynamicLink = value.toString();
      isLoading = false;
      update();
      var link = await FirebaseDynamicLinks.instance
          .getDynamicLink(Uri.parse(dynamicLink.toString()));
      debugPrint("link${link!.link}");
      });
      
    }).onError((ErrorModel error, stackTrace) {
      isLoading = false;
      update();
      debugPrint("Error: ${error.statusCode}");
      debugPrint("Error: ${error.bodyString}");
    });
    // Future.delayed(const Duration(seconds: 0), () {

    // DynamicLinkService.createDynamicLink(
    //   path: "register?referral-code=$referrerCode",
    //   isShort: true,
    // ).then((value) {
    //   dynamicLink = value.toString();
    //   isLoading = false;
    //   debugPrint("dynamicLink==$dynamicLink");
    //   update();
    //   Future.delayed(const Duration(), () async {
    //     var link = await FirebaseDynamicLinks.instance
    //         .getDynamicLink(Uri.parse(value.toString()));
    //     debugPrint("link${link!.link}");
    //   });
    // });

    // });
  }
}
