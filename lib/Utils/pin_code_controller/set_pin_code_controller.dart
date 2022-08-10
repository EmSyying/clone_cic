import 'dart:convert';
import 'package:cicgreenloan/utils/function/get_sharepreference_data.dart';
import 'package:cicgreenloan/Utils/popupannouncement/popup_announcement.dart';
import 'package:cicgreenloan/configs/route_management/route_name.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/customer_controller.dart';
import 'package:cicgreenloan/modules/notification_modules/controllers/notification_controller.dart';
import 'package:cicgreenloan/modules/event_module/models/event_detail_argument.dart';
import 'package:cicgreenloan/widgets/notification/accept_notification_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;

import '../helper/screen_agrument/member_screen_argument.dart';

class SetPINCodeController extends GetxController {
  final currentUser = ''.obs;
  String? tokenKey;
  final isLoading = false.obs;
  final isblock = false.obs;
  final isInvalidePin = false.obs;
  final isLogin = false.obs;
  final timeblock = 0.obs;
  final message = ''.obs;
  final contact = ''.obs;
  Uri? deepLink;

  onSetDeepLink(Uri? deeplink) {
    deepLink = deeplink;
    update();
  }

  final customerController = Get.put(CustomerController());
  final notifcationCon = Get.put(NotificationController());
  // final pinCode = ''.obs;

  Future<bool> submitPINCode({String? pinCode, String? routeName}) async {
    bool isSuccess = false;
    tokenKey = await LocalData.getCurrentUser();
    isLoading(true);

    String url =
        '${GlobalConfiguration().getValue('main_api_url')}user/verify-pin-code';

    var body = json.encode({
      'pin_code': pinCode,
    });
    try {
      await http
          .post(Uri.parse(url),
              headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
                'Authorization': 'Bearer $tokenKey'
              },
              body: body)
          .then((response) {
        if (response.statusCode == 200) {
          var success = json.decode(response.body)['success'];

          if (success) {
            customerController.isLoginSuccess(true);
            isLogin(true);

            // update();
            if (routeName == null) {
              Navigator.pop(Get.context!, true);
            } else {
              Navigator.pop(Get.context!, true);
              Navigator.pushNamed(Get.context!, '/$routeName');
            }
            debugPrint("Submit PIN Code three");
            if (notifcationCon.notificationAnouncementList.first.readAt ==
                    null &&
                notifcationCon.notificationAnouncementList.first.data!.type ==
                    'Announcement' &&
                notifcationCon
                        .notificationAnouncementList.first.data!.expired ==
                    false) {
              return showDialog(
                barrierDismissible: false,
                context: Get.context!,
                builder: (context) => PopUpAnnouncement(
                  notificationModel:
                      notifcationCon.notificationAnouncementList.first,
                ),
              );
            }
            if (notifcationCon.notificationAnouncementList.first.readAt ==
                    null &&
                notifcationCon.notificationAnouncementList.first.data!.type ==
                    'ut-trading' &&
                notifcationCon.notificationAnouncementList.first.data!.status ==
                    'Requested') {
              return showDialog(
                barrierDismissible: false,
                context: Get.context!,
                builder: (context) => AcceptNotificationPopup(
                  notificationModel:
                      notifcationCon.notificationAnouncementList.first,
                ),
              );
            }

            if (deepLink != null) {
              if (deepLink!.path.contains(RouteName.EVENTDETAIL)) {
                var param = deepLink!.queryParameters['eventID'];
                final argument = EventDetailArgument(id: int.parse(param!));
                Navigator.pushNamed(Get.context!, RouteName.EVENTDETAIL,
                    arguments: argument);
                deepLink = null;
              }
              if (deepLink!.path.contains(RouteName.MEMBERDETAIL)) {
                var param = deepLink!.queryParameters['memberID'];
                final agument = MemberDetailAgrument(
                    id: int.parse(param!), pageName: 'memberList');
                Navigator.pushNamed(Get.context!, RouteName.MEMBERDETAIL,
                    arguments: agument);
                deepLink = null;
              }
            }
          } else {
            customerController.isLoginSuccess(false);
            var block = json.decode(response.body)['retry_in'];
            if (block != null) {
              timeblock.value = json.decode(response.body)['retry_in_second'];
              message.value = json.decode(response.body)['message'];
              contact.value = json.decode(response.body)['contact'];
              isblock(true);
            } else {
              isInvalidePin(true);
            }
          }
        } else {}
      });
    } finally {
      deepLink = null;
      isLoading(false);
    }
    return customerController.isLoginSuccess.value;
  }

  @override
  void onInit() {
    submitPINCode();

    super.onInit();
  }
}
