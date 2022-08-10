import 'package:cicgreenloan/modules/notification_modules/controllers/notification_controller.dart';
import 'package:cicgreenloan/modules/notification_modules/models/notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class NotificationWidget extends StatelessWidget {
  final NotificationModel? notification;
  final String? fromPage;
  const NotificationWidget({Key? key, this.notification, this.fromPage})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final con = Get.put(NotificationController());

    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
      width: double.infinity,
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              notification!.data!.type == 'Disbursement' ||
                      notification!.data!.type == 'Debt' ||
                      notification!.data!.type == 'Equity'
                  ? SvgPicture.asset(notification!.readAt == null
                      ? 'assets/images/svgfile/requestLoanIcon.svg'
                      : 'assets/images/svgfile/readrequestloadIcon.svg')
                  : notification!.data!.type!.toLowerCase() == 'fif' ||
                          notification!.data!.type!.toLowerCase() ==
                              'withdraw' ||
                          notification!.data!.type!.toLowerCase() == 'renew' ||
                          notification!.data!.type!.toLowerCase() ==
                              'fif-monthly-payment'
                      ? SvgPicture.asset(
                          notification!.readAt == null
                              ? 'assets/images/svgfile/fifnotification.svg'
                              : 'assets/images/svgfile/fifnotificationread.svg',
                        )
                      : notification!.data!.type == 'ut-trading'
                          ? SvgPicture.asset(notification!.readAt == null
                              ? 'assets/images/svgfile/utNotificationIcon.svg'
                              : 'assets/images/svgfile/readTradeIcon.svg')
                          : notification!.data!.type == 'subscription-payment' ||
                                  notification!.data!.type == 'trading-payment'
                              ? SvgPicture.asset(notification!.readAt == null
                                  ? 'assets/images/svgfile/paymentIcon.svg'
                                  : 'assets/images/svgfile/readPaymentIcon.svg')
                              : notification!.data!.type == 'cash-out'
                                  ? SvgPicture.asset(notification!.readAt == null
                                      ? "assets/images/svgfile/cashoutNotification.svg"
                                      : "assets/images/svgfile/readCashout.svg")
                                  : notification!.data!.type == 'bonus'
                                      ? SvgPicture.asset(notification!.readAt == null
                                          ? "assets/images/svgfile/Bonus.svg"
                                          : "assets/images/svgfile/readbonus.svg")
                                      : notification!.data!.type ==
                                              'confirm-subscription'
                                          ? SvgPicture.asset(notification!.readAt == null
                                              ? "assets/images/svgfile/confirmSubscription.svg"
                                              : "assets/images/svgfile/readSubscription.svg")
                                          : notification!.data!.type ==
                                                  'confirm-payment'
                                              ? SvgPicture.asset(
                                                  notification!.readAt == null ? "assets/images/svgfile/confirmSubscription.svg" : "assets/images/svgfile/readSubscription.svg")
                                              : SvgPicture.asset(notification!.readAt == null ? 'assets/images/svgfile/announcementicons.svg' : 'assets/images/svgfile/readAnnouncementicons.svg'),
              const SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 15,
                          child: Text(
                            notification!.data!.title != ""
                                ? '${notification!.data!.title}'
                                : notification!.data!.message != ""
                                    ? notification!.data!.message!
                                    : "",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'DMSans',
                              color: notification!.readAt == null
                                  ? Colors.black
                                  : const Color(0xff6D7174),
                            ),
                            maxLines: fromPage != '' ? 10 : 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Spacer(),
                        notification!.data!.status != '' && fromPage == null
                            ? Text(
                                notification!.data!.status == null
                                    ? ''
                                    : '${notification!.data!.status}',
                                style: TextStyle(
                                  color:
                                      notification!.data!.status == 'Rejected'
                                          ? const Color(0xffED1E26)
                                          : notification!.data!.status ==
                                                  'Unmatched'
                                              ? const Color(0xffE28112)
                                              : Colors.green,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'DMSans',
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              )
                            : Container(),
                        if (notification!.readAt == null)
                          const SizedBox(width: 25),
                        notification!.readAt == null && fromPage == null
                            ? Container(
                                height: 8.0,
                                width: 8.0,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red,
                                ),
                              )
                            : Container(),
                      ],
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      '${notification!.humanCreatedAt}',
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontFamily: 'DMSans',
                          fontWeight: FontWeight.w100),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                  ],
                ),
              ),
              if (fromPage != null)
                InkWell(
                  child: const Icon(Icons.close),
                  onTap: () {
                    con.onReadNotification(notification!.id!);
                    Navigator.pop(context);
                  },
                )
            ],
          ),
          if (fromPage != 'rejectPopup')
            Text(
              '${notification!.data!.body}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'DMSans',
                  color: notification!.readAt == null
                      ? Colors.black87
                      : const Color(0xff6D7174),
                  fontWeight: FontWeight.w100),
            ),
        ],
      ),
    );
  }
}
