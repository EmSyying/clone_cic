import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modules/bonus/screens/bonus_screen.dart';
import '../../modules/event_module/models/event_detail_argument.dart';
import '../../modules/event_module/screen/event_detail.dart';
import '../../modules/get_funding/models/appliication_card_model.dart';
import '../../modules/get_funding/screens/debt_investment/preview_debt_form.dart';
import '../../modules/get_funding/screens/equity_investment/preview_equity.dart';
import '../../modules/investment_module/screen/bullet_payment_detail.dart';
import '../../modules/investment_module/screen/deposit_screen.dart';
import '../../modules/investment_module/screen/saving_detail_screen.dart';
import '../../modules/notification_modules/controllers/notification_controller.dart';
import '../../modules/notification_modules/screens/notification.dart';

class OnMessageOpenApp {
  final _notificationCon = Get.put(NotificationController());
  onMessageOpenApp(BuildContext context, RemoteMessage event) async {
    debugPrint("on Message open App4:${event.data}");

    debugPrint("on Message open App id:${event.data['id']}");

    debugPrint("on Message open App5:${event.data['application_id']}");
    //  Add OnMessageOpenApp

    if (event.data['type'] == 'fif' ||
        event.data['type'] == 'renew' ||
        event.data['type'] == 'withdraw' ||
        event.data['type'] == 'fif-monthly-payment') {
      if (event.data['operation'] == "confirmed") {
        _notificationCon.onReadNotification(event.data['id']);
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DepositeScreen(
                id: int.tryParse(event.data['application_id']),
              );
            },
          ),
        );
      } else if (event.data['operation'] == "reviewing" ||
          event.data['operation'] == "rejected") {
        _notificationCon.onReadNotification(event.data['id']);
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return BulletPaymentDetail(
                titles: 'Detail Summary',
                status: event.data['operation'],
                isStatusPending: true,
                isNoUSD: false,
                id: num.tryParse(event.data['application_id']),
              );
            },
          ),
        );
      } else {
        _notificationCon.onReadNotification(event.data['id']);
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SavingDetailScreen(
              paddings: const EdgeInsets.only(top: 50, left: 10, right: 0),
              id: num.tryParse(event.data['application_id']),
            ),
          ),
        );
      }
    } else if (event.data['type'] == 'Equity') {
      _notificationCon.onReadNotification(event.data['id']);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              PreviewEquity(id: int.tryParse(event.data['application_id'])),
        ),
      );
    } else if (event.data['type'] == 'Debt') {
      _notificationCon.onReadNotification(event.data['id']);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PreviewDebtForm(
            applicationDetail:
                ApplicationData(id: int.tryParse(event.data['application_id'])),
            fromPage: "submitted",
          ),
        ),
      );
    } else if (event.data['type'] == 'bonus' ||
        event.data['type'] == 'cash-out' ||
        event.data['type'] == 'confirm-subscription' ||
        event.data['type'] == 'confirm-payment') {
      _notificationCon.onReadNotification(event.data['id']);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const BonusScreen()),
      );
    } else if (event.data['status'] == 'Unmatched' ||
        event.data['type'] == 'transfer' ||
        event.data['type'] == 'subscription-payment' ||
        event.data['type'] == 'ut-trading' ||
        event.data['status'] == 'rejected' ||
        event.data['status'] == 'canceled' ||
        event.data['type'] == 'Payment' ||
        event.data['type'] == 'Disbursement' ||
        event.data['verify'] == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const NotificationScreen(),
        ),
      );
    } else if (event.data['type'] == 'event-invitation') {
      _notificationCon.onReadNotification(event.data['id']);
      EventDetailArgument argument =
          EventDetailArgument(id: int.parse(event.data['event_id']));
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const EventDetail(),
          settings: RouteSettings(arguments: argument),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const NotificationScreen(),
        ),
      );
    }

    // End onMessageOpenApp
  }
}
