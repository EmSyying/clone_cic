import 'package:cicgreenloan/utils/function/get_sharepreference_data.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/customer_controller.dart';
import 'package:cicgreenloan/modules/member_directory/models/user.dart';
import 'package:cicgreenloan/modules/notification_modules/models/notification.dart';
import 'package:cicgreenloan/modules/ut_trading/models/trading_model.dart';
import 'package:cicgreenloan/utils/helper/custom_route_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../configs/route_configuration/route.dart';

class NotificationController extends GetxController {
  final notificationList = <NotificationModel>[].obs;
  final notificationAnouncementList = <NotificationModel>[].obs;
  final token = ''.obs;
  final notification = NotificationModel().obs;
  final isLoading = false.obs;
  final countNotificatio = 0.obs;
  final isFetchingDetail = false.obs;
  final inquiryModel = InquiryModel().obs;
  final userCon = Get.put(CustomerController());
  final reasonList = <Gender>[].obs;
  final selectedReasonList = <int>[].obs;
  final reasonReject = Gender().obs;
  final isLoadingNotification = false.obs;
  final isGetReason = false.obs;

  final countReadNotification = 0.obs;
  final countReadAnnouncement = 0.obs;

  Future<List<NotificationModel>> getNotification() async {
    isLoadingNotification(true);
    final notifications = NotificationModel().obs;
    // Old Code
    SharedPreferences pref = await SharedPreferences.getInstance();
    token.value = pref.getString('current_user')!;
    // New Code
    // token.value = StorageUtil.getString('current_user');

    String url =
        '${GlobalConfiguration().getValue('api_base_url')}user/notification';
    try {
      await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token.value}'
      }).then((response) {
        if (response.statusCode == 200) {
          var responseData = json.decode(response.body)['data'];

          ///Clear value
          notificationAnouncementList.clear();
          notificationList.clear();
          countReadNotification(0);
          countReadAnnouncement(0);

          ///
          responseData.map((json) {
            notifications.value = NotificationModel.fromJson(json);

            if (notifications.value.data!.type!.toLowerCase() ==
                    'announcement' ||
                notifications.value.data!.type!.toLowerCase() == 'reminder' ||
                notifications.value.data!.type!.toLowerCase() ==
                    'event-invitation' ||
                notifications.value.data!.type!.toLowerCase() ==
                    'fif-reminder') {
              notificationAnouncementList.add(notifications.value);

              if (notifications.value.readAt == null) {
                countReadAnnouncement.value = countReadAnnouncement.value + 1;
              }
            } else {
              notificationList.add(notifications.value);

              if (notifications.value.readAt == null) {
                countReadNotification.value = countReadNotification.value + 1;
              }
            }
          }).toList();
        } else {
          debugPrint("Notification is failed:${response.statusCode}");
        }
      });
    } finally {
      isLoadingNotification(false);
    }
    return notificationAnouncementList;
  }

  void onClickNotification() {
    // var test = notificationList.firstWhere((e) => e.readAt == null);

    // debugPrint("Result : $test");
    for (var e in notificationList) {
      if (e.readAt == null) {
        countReadNotification(1);
        break;
      } else {
        countReadNotification(0);
      }
    }
    for (var e in notificationAnouncementList) {
      if (e.readAt == null) {
        countReadAnnouncement(1);
        break;
      } else {
        countReadAnnouncement(0);
      }
    }
  }

  Future<int> countNotification() async {
    String url =
        '${GlobalConfiguration().getValue('api_base_url')}user/notification?only=unread&count=true';

    // Old Code
    SharedPreferences pref = await SharedPreferences.getInstance();
    token.value = pref.getString('current_user')!;
    // New Code
    // token.value = StorageUtil.getString('current_user');
    await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${token.value}'
    }).then((response) {
      if (response.statusCode == 200) {
        countNotificatio.value = json.decode(response.body)['count'];
      } else {}
    });
    return countNotificatio.value;
  }

  Future<void> onReadNotification(String ids) async {
    String url =
        '${GlobalConfiguration().getValue('api_base_url')}user/notification/readordelete?to=read&ids=["$ids"]';
    SharedPreferences pref = await SharedPreferences.getInstance();
    token.value = pref.getString('current_user')!;
    //token.value = StorageUtil.getString('current_user');

    await http.put(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${token.value}'
    }).then((response) {
      if (response.statusCode == 200) {
        countNotification();
        onClickNotification();
      } else {}
    });
  }

  Future<InquiryModel> fetchNotificationDetail(
      {int? transitionId, int? marketId, String? operation}) async {
    var token = await LocalData.getCurrentUser();
    isFetchingDetail(true);
    String url =
        '${GlobalConfiguration().get('api_base_urlv2')}trading?type=single-trading&member_id=${userCon.customer.value.customerId}&transaction_id=$transitionId&market_id=$marketId&operation=$operation';
    try {
      await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      }).then((response) {
        if (response.statusCode == 200) {
          var responseJson = json.decode(response.body)['data'];
          inquiryModel.value = InquiryModel.fromJson(responseJson);
        } else {}
      });
    } finally {
      isFetchingDetail(false);
    }
    return inquiryModel.value;
  }

  onAcceptTradeRequest(
      {String? type,
      List<int>? reason,
      int? transactionId,
      String? notificationId}) async {
    for (int i = 0; i < reason!.length; i++) {}
    isLoading(true);
    String url =
        '${GlobalConfiguration().get('api_base_urlv2')}trading-accepted-declined?';

    debugPrint(
        'TYPE : $type : REASON : $reason : transactionId : $transactionId : notificationId : $notificationId');

    var token = await LocalData.getCurrentUser();
    var body = json.encode({
      "type": type,
      "reason": reason,
      "transaction_id": transactionId,
      "notification_id": notificationId
    });

    try {
      await http
          .post(Uri.parse(url),
              headers: {
                "Accept": "application/json",
                "Content-Type": "application/json",
                "Authorization": "Bearer $token"
              },
              body: body)
          .then((response) {
        if (response.statusCode == 200 && type == 'accepted') {
          Navigator.pop(
              router.routerDelegate.navigatorKey.currentState!.context);

          getNotification();
        } else if (response.statusCode == 200 && type == 'rejected') {
          getNotification();
          selectedReasonList.clear();
          onGetReason();

          Navigator.pop(
              router.routerDelegate.navigatorKey.currentState!.context);
        } else {
          debugPrint('Message : ${response.statusCode} : ${response.body}');
          Navigator.pop(
              router.routerDelegate.navigatorKey.currentState!.context);

          customRouterSnackbar(
              title: 'Confirm trading',
              description: 'Your submited has not been successful',
              type: SnackType.error);
        }
      });
    } finally {
      isLoading(false);
    }
  }

  Future<List<Gender>> onGetReason() async {
    final url = '${GlobalConfiguration().get('api_base_urlv2')}option';
    try {
      isGetReason(true);
      await http.get(
        Uri.parse(url),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
      ).then((response) {
        final reasonModel = Gender().obs;
        if (response.statusCode == 200) {
          reasonList.clear();
          var responseJson =
              json.decode(response.body)['trading_specific_member_reasons'];
          responseJson.map((value) {
            reasonModel.value = Gender.fromJson(value);
            reasonList.add(reasonModel.value);
          }).toList();
        } else {}
      });
    } finally {
      isGetReason(false);
    }
    return reasonList;
  }
}
