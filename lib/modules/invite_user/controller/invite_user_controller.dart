import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../member_directory/controllers/customer_controller.dart';

class InviteUserReferrerController extends GetxController {
  // final ApiBaseHelper _apiBaseHelper = ApiBaseHelper();
  String dynamicLink = "";
  String referralCode = "";
  bool onShare = true;
  // bool isLoading = false;
  @override
  void onInit() {
    debugPrint("Initializing");
    // onGenerateInvitation();
    onGetLinkAndReferralCode();
    super.onInit();
  }

  onGetLinkAndReferralCode() {
    referralCode =
        Get.put(CustomerController()).customer.value.referralCode ?? "";
    dynamicLink = Get.put(CustomerController()).customer.value.inviteLink ?? "";
    update();
  }

  // void onGenerateInvitation() {
  //   isLoading = true;
  //   update();
  //   _apiBaseHelper
  //       .onNetworkRequesting(
  //           url: "invitation/generate", methode: METHODE.get, isAuthorize: true)
  //       .then((value) async {
  //     referralCode = value["code"];
  //     DynamicLinkService.createDynamicLink(
  //       path: "register?referral-code=$referralCode",
  //       isShort: true,
  //     ).then((value) async {
  //       debugPrint("value=$value");
  //       dynamicLink = value.toString();

  //       update();
  //       var link = await FirebaseDynamicLinks.instance
  //           .getDynamicLink(Uri.parse(dynamicLink));
  //       debugPrint("link${link!.link}");
  //       isLoading = false;
  //     });
  //   }).onError((ErrorModel error, stackTrace) {
  //     isLoading = false;
  //     update();
  //     debugPrint("Error: ${error.statusCode}");
  //     debugPrint("Error: ${error.bodyString}");
  //   });
  //   // Future.delayed(const Duration(seconds: 0), () {

  //   // DynamicLinkService.createDynamicLink(
  //   //   path: "register?referral-code=$referrerCode",
  //   //   isShort: true,
  //   // ).then((value) {
  //   //   dynamicLink = value.toString();
  //   //   isLoading = false;
  //   //   debugPrint("dynamicLink==$dynamicLink");
  //   //   update();
  //   //   Future.delayed(const Duration(), () async {
  //   //     var link = await FirebaseDynamicLinks.instance
  //   //         .getDynamicLink(Uri.parse(value.toString()));
  //   //     debugPrint("link${link!.link}");
  //   //   });
  //   // });

  //   // });
  // }
}
