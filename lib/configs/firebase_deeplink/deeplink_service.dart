import 'package:cicgreenloan/configs/route_configuration/route.dart';
import 'package:cicgreenloan/core/flavor/flavor_configuration.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/customer_controller.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Utils/pin_code_controller/set_pin_code_controller.dart';

final setPinCon = Get.put(SetPINCodeController());
FirebaseDynamicLinks dynamiclink = FirebaseDynamicLinks.instance;

class DynamicLinkService {
  static Future<Uri> createDynamicLink(
      {String? path,
      String? description,
      String? image,
      String? title,
      bool isShort = false,
      bool forSocialLink = false}) async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
        uriPrefix: 'https://cicapp.page.link',
        link: Uri.parse('https://cicapp.page.link/$path'),
        androidParameters: const AndroidParameters(
          packageName: 'com.cambodianinvestorscorporation',
          minimumVersion: 1,
        ),
        iosParameters: IOSParameters(
          bundleId: FlavorConfig.instance.values!.iOSBundleName,
          minimumVersion: '2.1.2',
          appStoreId: '1553871408',
          ipadBundleId: FlavorConfig.instance.values!.iOSBundleName,
        ),
        socialMetaTagParameters: forSocialLink
            ? SocialMetaTagParameters(
                description: description,
                title: title,
                imageUrl: Uri.tryParse(image!),
              )
            : null);
    Uri url;
    if (isShort) {
      final ShortDynamicLink shortLink =
          await dynamiclink.buildShortLink(parameters);
      url = shortLink.shortUrl;
    } else {
      url = await dynamiclink.buildLink(parameters);
    }

    return url;
  }

  static Future<void> initDynamicLinks() async {
    final customerCon = Get.put(CustomerController());
    final PendingDynamicLinkData? initialLink =
        await FirebaseDynamicLinks.instance.getInitialLink();
    if (initialLink != null) {
      debugPrint("Initial Link: $initialLink");
      String links = initialLink.link
          .toString()
          .replaceAll('https://cicapp.page.link', '');
      await customerCon.getUser();
      router.go(links);
    }
    dynamiclink.onLink.listen((PendingDynamicLinkData? dynamicLink) async {
      setPinCon.deepLink = dynamicLink?.link;
      debugPrint("Initial Link: ${dynamicLink?.link}");
      String links = dynamicLink!.link
          .toString()
          .replaceAll('https://cicapp.page.link', '');
      await customerCon.getUser();
      router.go(links);
      // context.go(dynamicLink!.link.path);
      // setPinCon.update();

      // if (setPinCon.deepLink != null) {
      //   if (setPinCon.deepLink!.path.contains(RouteName.EVENTDETAIL)) {
      //     var param = setPinCon.deepLink!.queryParameters['eventID'];
      //     final argument = EventDetailArgument(id: int.parse(param!));
      //     if (setPinCon.isLogin.value) {
      //       Navigator.pushNamed(Get.context!, RouteName.EVENTDETAIL,
      //           arguments: argument);
      //     }
      //   }
      //   if (setPinCon.deepLink!.path.contains(RouteName.MEMBERDETAIL)) {
      //     var param = setPinCon.deepLink!.queryParameters['memberID'];
      //     final agument = MemberDetailAgrument(
      //         id: int.parse(param!), pageName: 'memberList');
      //     if (setPinCon.isLogin.value) {
      //       Navigator.pushNamed(Get.context!, RouteName.MEMBERDETAIL,
      //           arguments: agument);
      //     }
      //   }
      // }
    }, onError: (e) async {
      debugPrint("Dynamic link wrong place:$e");
    });
  }
}
