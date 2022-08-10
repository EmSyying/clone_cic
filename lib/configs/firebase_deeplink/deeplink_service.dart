import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Utils/helper/screen_agrument/member_screen_argument.dart';
import '../../Utils/pin_code_controller/set_pin_code_controller.dart';
import '../../modules/event_module/models/event_detail_argument.dart';
import '../route_management/route_name.dart';

final setPinCon = Get.put(SetPINCodeController());
FirebaseDynamicLinks dynamiclink = FirebaseDynamicLinks.instance;

class DynamicLinkService {
  static Future<Uri> createDynamicLink(
      {String? path, String? description, String? image, String? title}) async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://cicapp.page.link',
      link: Uri.parse('https://cicapp.page.link/$path'),
      androidParameters: const AndroidParameters(
        packageName: 'com.cambodianinvestorscorporation',
        minimumVersion: 1,
      ),
      iosParameters: const IOSParameters(
        bundleId: 'com.cambodianinvestorscorporation',
        minimumVersion: '1',
        appStoreId: '1553871408',
      ),
      socialMetaTagParameters: SocialMetaTagParameters(
          description: description, imageUrl: Uri.parse(image!), title: title),
    );
    final ShortDynamicLink shortLink =
        await dynamiclink.buildShortLink(parameters);

    final shortUrl = shortLink.shortUrl;

    return shortUrl;
  }

  static Future<void> initDynamicLinks() async {
    final PendingDynamicLinkData? data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    setPinCon.deepLink = data?.link;
    setPinCon.update();

    if (setPinCon.deepLink != null) {
      Navigator.pushNamed(Get.context!, RouteName.EVENTDETAIL);
    }

    dynamiclink.onLink.listen((PendingDynamicLinkData? dynamicLink) async {
      setPinCon.deepLink = dynamicLink?.link;
      setPinCon.update();

      if (setPinCon.deepLink != null) {
        if (setPinCon.deepLink!.path.contains(RouteName.EVENTDETAIL)) {
          var param = setPinCon.deepLink!.queryParameters['eventID'];
          final argument = EventDetailArgument(id: int.parse(param!));
          if (setPinCon.isLogin.value) {
            Navigator.pushNamed(Get.context!, RouteName.EVENTDETAIL,
                arguments: argument);
          }
        }
        if (setPinCon.deepLink!.path.contains(RouteName.MEMBERDETAIL)) {
          var param = setPinCon.deepLink!.queryParameters['memberID'];
          final agument = MemberDetailAgrument(
              id: int.parse(param!), pageName: 'memberList');
          if (setPinCon.isLogin.value) {
            Navigator.pushNamed(Get.context!, RouteName.MEMBERDETAIL,
                arguments: agument);
          }
        }
      }
    }, onError: (e) async {
      debugPrint("Dynamic link wrong place:$e");
    });
  }
}
